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
        view.backgroundColor = .systemBackground
    }
}

/*
class DefaultButton {
    
}


struct Theme {
    var primaryColor: UIColor
    var secondaryColor: UIColor
    
    var defaultFonts: [UIFont]
    
    var titleSize = 20.0
    

}

class CustomButton: UIButton {
    internal init(theme: Theme) {
        self.theme = theme
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var theme: Theme
    
    func setup() {
        self.backgroundColor = theme.primaryColor
        self.layer.cornerRadius = 5.0
    }
    
}
*/


