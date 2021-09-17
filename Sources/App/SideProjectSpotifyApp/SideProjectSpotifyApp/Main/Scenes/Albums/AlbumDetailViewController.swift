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
        label.font = UIFont.systemFont(ofSize: 32, weight: .regular)
        label.numberOfLines = 2
        return label
    }()
    
    private let releaseDateLabel: UILabel = {
        let label = UILabel()
        label.text = "This is test album releaseDate"
        label.font = UIFont.systemFont(ofSize: 24, weight: .regular)
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
        releaseDateLabel.text = viewModel.releaseDate
        albumImage.image = UIImage(data: viewModel.imageData)
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        
        [stackView, titleLabel, albumImage, releaseDateLabel].forEach {
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
        ])
        
        NSLayoutConstraint.activate([
            albumImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32),
            albumImage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32),
            albumImage.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 32),
            albumImage.heightAnchor.constraint(equalToConstant: 300)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            releaseDateLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            releaseDateLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
        ])
    }
    
}
