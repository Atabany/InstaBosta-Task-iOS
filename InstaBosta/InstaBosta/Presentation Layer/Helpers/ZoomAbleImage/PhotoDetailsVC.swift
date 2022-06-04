//
//  PhotoDetailsVC.swift
//  CineApp
//
//  Created by mohamed elatabany on 3/29/18.
//  Copyright © 2018 mohamed elatabany. All rights reserved.
//

import UIKit

class PhotoDetialsVC: UIViewController, UIScrollViewDelegate{
    
    // MARK: - UI Components

    var scrollView: UIScrollView = UIScrollView()
    var imgPhoto: UIImageView = UIImageView()
    var closeButton: UIButton = UIButton(type: .system)
    
    
    // MARK: - Properties
    var imageURL : String!
    
    static let reuseID = "PhotoDetialsVC"
    
    init(imageURL: String) {
        self.imageURL = imageURL
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        style()
    }
    
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imgPhoto
    }
    
}


// MARK: - Setup & Style

extension PhotoDetialsVC {
    
    // MARK: - Setup
    private func setupLayout() {
        setupScrollView()
        setupImagePhoto()
        setupButton()
    }
    
    
    private func setupScrollView() {
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    
    private func setupImagePhoto() {
        scrollView.addSubview(imgPhoto)
        NSLayoutConstraint.activate([
            imgPhoto.topAnchor.constraint(equalTo: scrollView.topAnchor),
            imgPhoto.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            imgPhoto.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            imgPhoto.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            imgPhoto.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            imgPhoto.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
        ])
    }
    
    
    private func setupButton() {
        scrollView.addSubview(closeButton)
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            closeButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            closeButton.widthAnchor.constraint(equalToConstant: 40),
            closeButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    

    
    // MARK: - Style
    private func style() {
        view.backgroundColor = UIColor.darkGray.withAlphaComponent(0.5)

        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.delegate = self
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 6.0
        scrollView.delegate = self
        
        imgPhoto.translatesAutoresizingMaskIntoConstraints = false
        imgPhoto.isUserInteractionEnabled = true
        imgPhoto.contentMode = .scaleAspectFill
        imgPhoto.setImage(from: imageURL)
        
        
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        closeButton.addTarget(self, action: #selector(closeButtonAction), for: .touchUpInside)
    }

}


// MARK: - Actions
extension PhotoDetialsVC {
    
    @objc
    func closeButtonAction() {
        dismiss(animated: true)
    }
    
}
