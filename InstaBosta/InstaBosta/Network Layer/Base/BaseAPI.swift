//
//  BaseAPI.swift
//  NetworkLayer

//  InstaBosta
//
//  Created by Mohamed Elatabany on 01/06/2022.
//

import UIKit
import RxSwift
import Moya
import RxMoya


class BaseAPI {
    
    let disposeBag = DisposeBag()
    
    let cashe = NSCache<NSString, UIImage>()

    func fetchData<T: TargetType, ModelType: Codable>(request: T, responseObservable: PublishSubject<ModelType>) {
        let provider = MoyaProvider<T>()
        let decoder: JSONDecoder = JSONDecoder()
        provider.rx.request(request).subscribe { event in
            switch event {
            case .success(let response):
                do {
                    let decodedResponse = try decoder.decode(ModelType.self, from: response.data)
                    responseObservable.onNext(decodedResponse)
                } catch _ {
                    responseObservable.onError(GatewayError.decoding)
                }
            case .failure(let error):
                guard let moyaError = error as? MoyaError, let statusCode = moyaError.response?.statusCode else {
                    responseObservable.onError(GatewayError.generic)
                    return
                }
                switch statusCode {
                case 404:
                    responseObservable.onError(GatewayError.badGateway)
                default:
                    let errorResponseJson: [String: Any]? = try? moyaError.response?.mapJSON() as? [String: Any]
                    responseObservable.onError(GatewayError.backEnd(code: statusCode, payload: errorResponseJson))
                }
            }
        }.disposed(by: disposeBag)
    }
}

enum GatewayError: Error {
    case generic
    case noConnection
    case serverFailure
    case badGateway
    case decoding
    case backEnd(code: Int, payload: [String: Any]?)
}



//MARK: -  Image
extension BaseAPI {
    func downloadImage(from urlString: String) async -> UIImage? {
        let casheKey = NSString(string: urlString)
        if let image = cashe.object(forKey: casheKey) { return image }
        guard let url = URL(string: urlString) else {return nil }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            guard let image = UIImage(data: data) else { return nil }
            self.cashe.setObject(image, forKey: casheKey)
            return image
        } catch { return nil }
    }
}




