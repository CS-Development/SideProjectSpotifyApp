//
//  AlbumsViewController.swift
//  SideProjectSpotifyApp
//
//  Created by Pawel Kacela on 29/07/2021.
//

import UIKit

protocol AlbumsViewControllerRouting {
    var navigationController: UINavigationController? { set get }
    func routeToDetailViewController()
}

class AlbumsViewController: UIViewController {
    
    let viewModel: AlbumsViewModel
    var router: AlbumsViewControllerRouting
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    var delgate: AlbumsCollectionViewDelagate
    var dataSource: AlbumsCollectionViewDataSource

    init(viewModel: AlbumsViewModel, router: AlbumsViewControllerRouting) {
        self.viewModel = viewModel
        self.router = router
        self.delgate = AlbumsCollectionViewDelagate(viewModel: viewModel)
        self.dataSource = AlbumsCollectionViewDataSource(viewModel: viewModel)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.onUpdate = { [weak self] in
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
        
        registerCells()
        setupViews()
        setupHierarchy()
        setupLayout()
        viewModel.getAlbums()
    }
    
    private func registerCells() {
        collectionView.register(AlbumCell.self, forCellWithReuseIdentifier: AlbumCell.identifier)
    }
    
    private func setupViews() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .red
        collectionView.delegate = delgate
        collectionView.dataSource = dataSource
    }
    
    private func setupHierarchy() {
        view.addSubview(collectionView)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            collectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}


//MARK: Delegate
class AlbumsCollectionViewDelagate: NSObject, UICollectionViewDelegateFlowLayout {
    
    let viewModel: AlbumsViewModel
    
    init(viewModel: AlbumsViewModel) {
        self.viewModel = viewModel
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width - 32, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
    }
}

//MARK: Data source
class AlbumsCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    let viewModel: AlbumsViewModel
    
    init(viewModel: AlbumsViewModel) {
        self.viewModel = viewModel
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItemsInSection(section: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumCell.identifier, for: indexPath) as! AlbumCell
        return cell
    }
    
}
