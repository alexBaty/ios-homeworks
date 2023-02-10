//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Alexander Batyshev on 15.12.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    static let cellID = "PostTableViewCell"
    var cellIndex = 0
    public var flag = true

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

    lazy var likesCell:UILabel = {
        var likesCell = UILabel(frame: .zero)
        likesCell.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        likesCell.textColor = .black
        likesCell.translatesAutoresizingMaskIntoConstraints = false
        likesCell.isUserInteractionEnabled = true
        likesCell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(plusLike)))
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

    func createTable(_ index: Int, _ flag: Bool = true) {

        cellIndex = index

        if flag == true {
            imageCell.isUserInteractionEnabled = true
            imageCell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(showPost)))
        }

        authorCell.text = dataSource[index].author
        imageCell.image = UIImage(named: dataSource[index].image)
        descriptionCell.text = dataSource[index].description
        likesCell.text = "Likes:" + " " + "\(dataSource[index].likes)"
        viewsCell.text = "Views:" + " " + "\(dataSource[index].views)"
    }

    @objc func plusLike() {
        dataSource[cellIndex].likes += 1
        likesCell.text = "Likes:" + " " + "\(dataSource[cellIndex].likes)"
    }

    @objc func showPost() {
        dataSource[cellIndex].views += 1
        viewsCell.text = "Views:" + " " + "\(dataSource[cellIndex].views)"

        if let navigationController = ((superview as? UITableView)?.dataSource as? UIViewController)?.navigationController {
            let postDetailVC = PostDetailViewController()
            postDetailVC.cellIndex = cellIndex
            postDetailVC.flag = false
            let postNC = UINavigationController(rootViewController: postDetailVC)
            postNC.modalPresentationStyle = .fullScreen
            postNC.modalTransitionStyle = .coverVertical
            navigationController.present(postNC, animated: true)
        }
    }
}
