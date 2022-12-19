//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Alexander Batyshev on 19.12.2022.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {

    static let cellID = "PhotosCollectionViewCell"

    var photo: UIImageView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        photo = UIImageView(frame: .zero)
        photo.contentMode = .scaleToFill
        photo.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(photo)

        NSLayoutConstraint.activate([
            photo.topAnchor.constraint(equalTo: topAnchor),
            photo.bottomAnchor.constraint(equalTo: bottomAnchor),
            photo.leadingAnchor.constraint(equalTo: leadingAnchor),
            photo.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
