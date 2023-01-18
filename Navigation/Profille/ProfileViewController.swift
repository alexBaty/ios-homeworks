//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Alexander Batyshev on 03.12.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    private var dataSource: [ModelPost] = [postOne, postTwo, postThree, postFour]

    let tableView: UITableView = {
        var tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .systemGray6
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.cellID)
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.cellID)
        view.addSubview(tableView)
        createTableViewConstraints()
        hideKeyboardWhenTappedAround()
    }

    private func createTableViewConstraints() {

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }

    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(ProfileViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    @objc func goToPhotos() {
        let photosViewController = PhotosViewController()
        photosViewController.navigationItem.title = "Photo Gallery"
        self.navigationController?.navigationBar.isHidden = false
        self.navigationController?.pushViewController(photosViewController, animated: true)
    }
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return dataSource.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.cellID, for: indexPath) as! PhotosTableViewCell
            cell.buttonGo.addTarget(self, action: #selector(goToPhotos), for: .touchUpInside)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.cellID, for: indexPath) as! PostTableViewCell
            cell.authorCell.text = dataSource[indexPath.item].author
            cell.imageCell.image = UIImage(named: dataSource[indexPath.item].image)
            cell.descriptionCell.text = dataSource[indexPath.item].description
            cell.likesCell.text = "Likes:" + " " + "\(dataSource[indexPath.item].likes)"
            cell.viewsCell.text = "Views:" + " " + "\(dataSource[indexPath.item].views)"
            return cell
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let headerView = ProfileHeaderView()
            return headerView
        } else {
            return nil
        }
    }
}
