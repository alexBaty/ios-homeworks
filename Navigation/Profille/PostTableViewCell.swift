//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Alexander Batyshev on 15.12.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    static let cellID = "PostTableViewCell"

    let authorCell: UILabel = {
        var authorCell = UILabel(frame: .zero)
        authorCell.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        authorCell.numberOfLines = 2
        authorCell.translatesAutoresizingMaskIntoConstraints = false
        return authorCell
    }()

    let descriptionCell: UILabel = {
        var descriptionCell = UILabel(frame: .zero)
        descriptionCell.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        descriptionCell.textColor = .systemGray
        descriptionCell.numberOfLines = 0
        descriptionCell.translatesAutoresizingMaskIntoConstraints = false
        return descriptionCell
    }()

    let imageCell: UIImageView = {
        var imageCell = UIImageView(frame: .zero)
        imageCell.contentMode = .scaleAspectFit
        imageCell.backgroundColor = .black
        imageCell.translatesAutoresizingMaskIntoConstraints = false
        return imageCell
    }()

    let likesCell:UILabel = {
        var likesCell = UILabel(frame: .zero)
        likesCell.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        likesCell.textColor = .black
        likesCell.translatesAutoresizingMaskIntoConstraints = false
        return likesCell
    }()

    let viewsCell:UILabel = {
        var viewsCell = UILabel(frame: .zero)
        viewsCell.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        viewsCell.textColor = .black
        viewsCell.translatesAutoresizingMaskIntoConstraints = false
        return viewsCell
    }()

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        getCells()
        createPostTableViewCellConstraints()
    }

    private func getCells() {
        addSubview(authorCell)
        addSubview(descriptionCell)
        addSubview(imageCell)
        addSubview(likesCell)
        addSubview(viewsCell)
    }

    func createPostTableViewCellConstraints() {

        NSLayoutConstraint.activate([
            authorCell.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            authorCell.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            imageCell.topAnchor.constraint(equalTo: authorCell.bottomAnchor, constant: 12),
            imageCell.rightAnchor.constraint(equalTo: rightAnchor),
            imageCell.leftAnchor.constraint(equalTo: leftAnchor),
            imageCell.heightAnchor.constraint(equalTo: widthAnchor),
            descriptionCell.topAnchor.constraint(equalTo: imageCell.bottomAnchor, constant: 16),
            descriptionCell.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            descriptionCell.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            likesCell.topAnchor.constraint(equalTo: descriptionCell.bottomAnchor, constant: 16),
            likesCell.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            likesCell.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            viewsCell.topAnchor.constraint(equalTo: descriptionCell.bottomAnchor, constant: 16),
            viewsCell.rightAnchor.constraint(equalTo: rightAnchor, constant: -16)
        ])
    }
}
