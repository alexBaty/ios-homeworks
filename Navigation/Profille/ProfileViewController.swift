//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Alexander Batyshev on 03.12.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    let profileHeaderView = ProfileHeaderView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray
        self.title = "Profile"

        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .secondarySystemBackground
        navigationItem.scrollEdgeAppearance = appearance

        self.view.addSubview(profileHeaderView)
        createProfileViewConstraints() // +
        self.view.addSubview(createButton()) // +
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
//        profileHeaderView.frame = self.view.frame
    }
}

extension ProfileViewController {

    func createProfileViewConstraints() {

        let safeLayout = self.view.safeAreaLayoutGuide
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            profileHeaderView.topAnchor.constraint(equalTo: safeLayout.topAnchor, constant: 0),
            profileHeaderView.leadingAnchor.constraint(equalTo: safeLayout.leadingAnchor, constant: 0),
            profileHeaderView.trailingAnchor.constraint(equalTo: safeLayout.trailingAnchor, constant: 0),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220)
        ])
    }

        func createButton() -> UIButton {
            let button = UIButton(frame: .zero)
            button.setTitle("Button", for: .normal)
            button.backgroundColor = .systemPink
            button.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(button)

            NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            button.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 0),
            button.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: 0)
            ])

            return button
        }
}
