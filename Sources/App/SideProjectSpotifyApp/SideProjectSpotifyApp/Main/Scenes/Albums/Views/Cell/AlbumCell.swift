//
//  AlbumCell.swift
//  SideProjectSpotifyApp
//
//  Created by Pawel Kacela on 29/07/2021.
//

import UIKit

class AlbumCell: UICollectionViewCell {
    
    let cornerRadiusValue: CGFloat = 10
    
   private let wrapperView: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "This is test album name"
        label.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        return label
    }()
    
    private let albumImage: UIImageView = {
        let imager = UIImageView()
        imager.contentMode = UIView.ContentMode.scaleAspectFit
        return imager
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupHierarchy()
        setupLayout()
    }
    
    func update(viewModel: AlbumCellViewModel) {
        titleLabel.text = viewModel.title
        albumImage.image = UIImage(data: viewModel.image)?.sameAspectRatio(newHeight: 100)
    }
    
    private func setupViews(){
        backgroundColor = .white
        layer.cornerRadius = cornerRadiusValue
        wrapperView.layer.cornerRadius = cornerRadiusValue
        layer.addShadow()
        [wrapperView, titleLabel, albumImage].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setupHierarchy() {
        addSubview(wrapperView)
        [titleLabel, albumImage].forEach {
            wrapperView.addSubview($0)
        }
    }
    
    private func setupLayout() {
        
        NSLayoutConstraint.activate([
            wrapperView.leftAnchor.constraint(equalTo: self.leftAnchor),
            wrapperView.topAnchor.constraint(equalTo: self.topAnchor),
            wrapperView.rightAnchor.constraint(equalTo: self.rightAnchor),
            wrapperView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            albumImage.leftAnchor.constraint(equalTo: wrapperView.leftAnchor),
            albumImage.topAnchor.constraint(equalTo: wrapperView.topAnchor),
            albumImage.rightAnchor.constraint(equalTo: wrapperView.rightAnchor),
            albumImage.heightAnchor.constraint(equalToConstant: 140)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: albumImage.bottomAnchor),
            titleLabel.leftAnchor.constraint(equalTo: wrapperView.leftAnchor, constant: 16),
            titleLabel.rightAnchor.constraint(equalTo: wrapperView.rightAnchor, constant: -16),
            titleLabel.bottomAnchor.constraint(equalTo: wrapperView.bottomAnchor)
        ])
    }
    
    class var identifier: String {
        return "AlbumCell"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
