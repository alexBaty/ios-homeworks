//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Alexander Batyshev on 19.12.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {

    static let cellID = "PhotosTableViewCell"

    let photoLabel: UILabel = {
        var photoLabel = UILabel(frame: .zero)
        photoLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        photoLabel.text = "Photos"
        photoLabel.textColor = .black
        photoLabel.translatesAutoresizingMaskIntoConstraints = false
        return photoLabel
    }()

    let buttonGo: UIButton = {
        var buttonGo = UIButton(frame: .zero)
        buttonGo.backgroundColor = .clear
        buttonGo.translatesAutoresizingMaskIntoConstraints = false
        return buttonGo
    }()

    let imageGo: UIImageView = {
        var imageGo = UIImageView(frame: .zero)
        imageGo.image = UIImage(systemName: "forward")
        imageGo.tintColor = .black
        imageGo.translatesAutoresizingMaskIntoConstraints = false
        return imageGo
    }()

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        addSubview(photoLabel)
        addSubview(buttonGo)
        addSubview(imageGo)
        addSubview(createPhotosStackView())
        createPhotosTableViewCellConstraints()
    }

    func createPhotosStackView() -> UIStackView {
        let photosStackView = UIStackView()
        photosStackView.axis = .horizontal
        photosStackView.distribution = .fillEqually
        photosStackView.spacing = 8
        photosStackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(photosStackView)

        let photoOne = UIImageView()
        photoOne.image = UIImage(named: "photo1")
        photoOne.layer.cornerRadius = 6
        photoOne.layer.masksToBounds = true
        photoOne.clipsToBounds = true

        let photoTwo = UIImageView()
        photoTwo.image = UIImage(named: "photo2")
        photoTwo.layer.cornerRadius = 6
        photoTwo.layer.masksToBounds = true
        photoTwo.clipsToBounds = true

        let photoThree = UIImageView()
        photoThree.image = UIImage(named: "photo3")
        photoThree.layer.cornerRadius = 6
        photoThree.layer.masksToBounds = true
        photoThree.clipsToBounds = true

        let photoFour = UIImageView()
        photoFour.image = UIImage(named: "photo4")
        photoFour.layer.cornerRadius = 6
        photoFour.layer.masksToBounds = true
        photoFour.clipsToBounds = true

        photosStackView.addArrangedSubview(photoOne)
        photosStackView.addArrangedSubview(photoTwo)
        photosStackView.addArrangedSubview(photoThree)
        photosStackView.addArrangedSubview(photoFour)

        NSLayoutConstraint.activate([
            photosStackView.topAnchor.constraint(equalTo: photoLabel.bottomAnchor, constant: 12),
            photosStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 12),
            photosStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -12),
            photosStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            photosStackView.heightAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 48) / 4)
        ])

        return photosStackView
    }

    func createPhotosTableViewCellConstraints() {

        NSLayoutConstraint.activate([
            photoLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            photoLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 12),
            imageGo.centerYAnchor.constraint(equalTo: photoLabel.centerYAnchor),
            imageGo.rightAnchor.constraint(equalTo: rightAnchor, constant: -12),
            buttonGo.topAnchor.constraint(equalTo: topAnchor),
            buttonGo.bottomAnchor.constraint(equalTo: bottomAnchor),
            buttonGo.leftAnchor.constraint(equalTo: leftAnchor),
            buttonGo.rightAnchor.constraint(equalTo: rightAnchor)
        ])
    }
}
