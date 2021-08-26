//
//  AlbumsViewController.swift
//  SideProjectSpotifyApp
//
//  Created by Pawel Kacela on 29/07/2021.
//

import UIKit
import SpotifyApiModule

protocol AlbumsViewControllerRouting {
    var navigationController: UINavigationController? { set get }
    func routeToDetailViewController(album: AlbumItemDTO)
}

class AlbumsViewController: UIViewController {
    
    let viewModel: AlbumsViewModel
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    var delegate: AlbumsCollectionViewDelegate
    var dataSource: AlbumsCollectionViewDataSource

    init(viewModel: AlbumsViewModel) {
        self.viewModel = viewModel
        self.delegate = AlbumsCollectionViewDelegate(viewModel: viewModel)
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
        collectionView.backgroundColor = .white
        collectionView.delegate = delegate
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
class AlbumsCollectionViewDelegate: NSObject, UICollectionViewDelegateFlowLayout {
    
    let viewModel: AlbumsViewModel
    
    init(viewModel: AlbumsViewModel) {
        self.viewModel = viewModel
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width - 32, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.selectAlbum(for: indexPath)
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
        
        switch viewModel.cell(at: indexPath) {
        case .album(let albumCellViewModel):
            cell.update(viewModel: albumCellViewModel)
        }
        
        return cell
    }
    
}
