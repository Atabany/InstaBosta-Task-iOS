//
//  AlbumDetailsPhotosGridViewController.swift
//  InstaBosta
//
//  Created by Mohamed Elatabany on 04/06/2022.
//

import UIKit
import RxSwift
import RxRelay
import RxDataSources

class AlbumDetailsPhotosGridViewController: UIViewController {
    
    // MARK: - UI COMPONENTS
    var collectionView: UICollectionView!
    var  searchController: UISearchController!
    
    // MARK: - Properties
    var viewModel: AlbumPhotosGridViewModel
    var disposeBag = DisposeBag()
    // MARK: - Data Source
    var photoGridDataSource: RxCollectionViewSectionedReloadDataSource<AlbumPhotosGridSection>?
    // MARK: - Coordinator
    lazy var coordinator: AlbumCoordinator  = AlbumCoordinator(vc: self)

    
    //MARK: - Life Cycle
    init(viewModel: AlbumPhotosGridViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        style()
        binding()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }


}


// MARK: - Setup

extension AlbumDetailsPhotosGridViewController {
    
    private func setup() {
        configureSearchController()
        configureCollectionView()
    }
    
    //MARK: - Configure Search Controller
    
    private func configureSearchController() {
        searchController                                   = UISearchController()
        searchController.searchBar.placeholder                 = K.Strings.PhotosGrid.searchImagesPlaceholder
        searchController.obscuresBackgroundDuringPresentation  = false
        navigationItem.searchController                        = searchController
        navigationItem.hidesSearchBarWhenScrolling             = false
    }
    
    //MARK: - Configure CollectionView
    
    private func configureCollectionView() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.configureColoumnsFlowLayout(in: self.view, with: 3)
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: flowLayout)
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemBackground
    }

}



// MARK: - Style
extension AlbumDetailsPhotosGridViewController {
    private func style() {
        view.backgroundColor = UIColor.systemBackground
    }
}



