//
//  FeedViewController.swift
//  Navigation
//
//  Created by Alexander Batyshev on 25.11.2022.
//

import UIKit

class FeedViewController: UIViewController {

//    var button: UIButton!

    var post = Post(title: "Post")

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .yellow
//        button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
//        button.backgroundColor = .darkText
//        button.setTitle("Post", for: .normal)
//        button.center = self.view.center
//        button.addTarget(self, action: #selector(goToPost), for: .touchUpInside)
//        self.view.addSubview(button)
        self.view.addSubview(createStackView()) // +
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
//        button.center = self.view.center
    }

    func createStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)

        let buttonOne = UIButton()
        buttonOne.setTitle("Button 1", for: .normal)
        buttonOne.backgroundColor = .systemBlue
        buttonOne.addTarget(self, action: #selector(goToPost), for: .touchUpInside)

        let buttonTwo = UIButton()
        buttonTwo.setTitle("Button 2", for: .normal)
        buttonTwo.backgroundColor = .systemRed
        buttonTwo.addTarget(self, action: #selector(goToPost), for: .touchUpInside)

        stackView.addArrangedSubview(buttonOne)
        stackView.addArrangedSubview(buttonTwo)

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 100)
        ])

        return stackView
    }

    @objc func goToPost() {
        let postViewController = PostViewController()
        postViewController.navigationItem.title = post.title
        self.navigationController?.pushViewController(postViewController, animated: true)
    }
}

struct Post {
    var title: String
}
