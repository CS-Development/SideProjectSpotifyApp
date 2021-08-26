//
//  AlbumDetailViewController.swift
//  SideProjectSpotifyApp
//
//  Created by Pawel Kacela on 26/08/2021.
//

import UIKit

class AlbumDetailViewController: UIViewController {
    
    var viewModel: AlbumDetailViewModel
    
    init(viewModel: AlbumDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "This is test album name"
        label.font = UIFont.systemFont(ofSize: 36, weight: .regular)
        return label
    }()
    
    private let releaseDateLabel: UILabel = {
        let label = UILabel()
        label.text = "This is test album releaseDate"
        label.font = UIFont.systemFont(ofSize: 26, weight: .regular)
        return label
    }()
    
    private let albumImage: UIImageView = {
        let imager = UIImageView()
        imager.contentMode = UIView.ContentMode.scaleAspectFit
        return imager
    }()
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupHierarchy()
        setupLayout()
        
        update(viewModel: viewModel)
    }
    
    private func update(viewModel: AlbumDetailViewModel) {
        let album = viewModel.album
        titleLabel.text = album.name
        releaseDateLabel.text = album.releaseDate
        albumImage.image = UIImage(data: viewModel.imageData)
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        
        [stackView, titleLabel, albumImage, ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    func setupHierarchy() {
        view.addSubview(stackView)
        [albumImage, titleLabel, releaseDateLabel].forEach {
            stackView.addArrangedSubview($0)
        }
    }
    
    func setupLayout() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            stackView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            albumImage.heightAnchor.constraint(equalToConstant: 376)
        ])
    }
    
}
