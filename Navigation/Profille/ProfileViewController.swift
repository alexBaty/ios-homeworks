//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Alexander Batyshev on 03.12.2022.
//

import UIKit

struct ModelPost {
    var author: String
    var description: String
    var image: String
    var likes: Int
    var views: Int
}

let postOne = ModelPost(author: "witchercommunity", description: "In addition to the release on new generation platforms, the PlayStation 4, Xbox One and Nintendo Switch versions of The Witcher 3: Wild Hunt game will also receive an update with numerous changes and improvements, as well as free content inspired by the Witcher series from Netflix.", image: "witcher", likes: 460, views: 560)

let postTwo = ModelPost(author: "netology.ru", description: "Netology is one of the leaders in the online education market. Open classes, intensive courses and interactive courses for learning.", image: "netology", likes: 56, views: 451)

let postThree = ModelPost(author: "News-apple", description: "Apple announces new security and privacy measures amid spike in cyber attacks. Hands on with Apple Music Sing on iPhone, iPad, & Apple TV.", image: "apple", likes: 245, views: 457)

let postFour = ModelPost(author: "Kinomania", description: "The time of prosperity is coming to an end, and the summer, which lasted almost a decade, is fading. A conspiracy is brewing around the center of power of the Seven Kingdoms, the Iron Throne, and at this difficult time the king decides to seek support from a friend of his youth, Eddard Stark. In a world where everyone — from a king to a mercenary — is eager for power, plotting and ready to stab a knife in the back, there is a place for nobility, compassion and love.", image: "gameOfThrones", likes: 23, views: 43)

class ProfileViewController: UIViewController {

    private var dataSource: [ModelPost] = [postOne, postTwo, postThree, postFour]

    let tableView: UITableView = {
        var tableView = UITableView()
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
        view.addSubview(tableView)
        createTableViewconstraints()
        hideKeyboardWhenTappedAround()
    }

   private func createTableViewconstraints() {

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
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.cellID, for: indexPath) as! PostTableViewCell
        cell.authorCell.text = dataSource[indexPath.item].author
        cell.imageCell.image = UIImage(named: dataSource[indexPath.item].image)
        cell.descriptionCell.text = dataSource[indexPath.item].description
        cell.likesCell.text = "Likes:" + " " + "\(dataSource[indexPath.item].likes)"
        cell.viewsCell.text = "Views:" + " " + "\(dataSource[indexPath.item].views)"
        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = ProfileHeaderView()
        return headerView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        220
    }
}
