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

    init(viewModel: AlbumsViewModel, router: AlbumsViewControllerRouting) {
        self.viewModel = viewModel
        self.router = router
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.getAlbums()
    }
    
    
}
