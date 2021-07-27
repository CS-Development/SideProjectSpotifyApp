//
//  MainTabBarController.swift
//  SideProjectSpotifyApp
//
//  Created by Christian Slanzi on 27.07.21.
//

import UIKit

class MainTabBarController: UITabBarController {
    required public init(viewControllers: [UIViewController]) {
        super.init(nibName: nil, bundle: nil)
        self.viewControllers = viewControllers
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}
