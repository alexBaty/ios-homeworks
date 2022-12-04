//
//  FeedViewController.swift
//  Navigation
//
//  Created by Alexander Batyshev on 25.11.2022.
//

import UIKit

class FeedViewController: UIViewController {

    var button: UIButton!

    var post = Post(title: "Post")

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .yellow
        button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        button.backgroundColor = .darkText
        button.setTitle("Post", for: .normal)
        button.center = self.view.center
        button.addTarget(self, action: #selector(goToPost), for: .touchUpInside)
        self.view.addSubview(button)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        button.center = self.view.center
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
