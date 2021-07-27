//
//  ViewController.swift
//  SideProjectSpotifyApp
//
//  Created by Christian Slanzi on 16.07.21.
//

import UIKit

protocol ViewControllerRouting {
    var navigationController: UINavigationController? { set get }
    func routeToDetailViewController()
}

class ViewController: UIViewController {
    
    let viewModel: MainViewModel
    var router: ViewControllerRouting

    init(viewModel: MainViewModel, router: ViewControllerRouting) {
        self.viewModel = viewModel
        self.router = router
        
        super.init(nibName: nil, bundle: nil)
        //self.router.navigationController = self.navigationController
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .systemPink

        viewModel.getFeaturedPlaylists()
        
        DispatchQueue.main.asyncAfter(deadline: .now()+5.0) {
            self.routeToDetailViewController()
        }
    }
    
    func routeToDetailViewController() {
        router.routeToDetailViewController()
    }
}

