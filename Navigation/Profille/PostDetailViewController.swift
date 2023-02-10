//
//  PostDetailViewController.swift
//  Navigation
//
//  Created by Alexander Batyshev on 11.02.2023.
//

import UIKit

class PostDetailViewController: UIViewController, UITableViewDataSource {

    public var cellIndex = 0
    public var flag = true

    private let postTableView = UITableView(frame: .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height), style: .grouped)

    override func viewDidLoad() {
        super.viewDidLoad()
        postTableView.dataSource = self
        view.addSubview(postTableView)
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(closePost))
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = PostTableViewCell()
        cell.createTable(cellIndex, flag)
        return cell
    }

    @objc func closePost() {
        dismiss(animated: true, completion: nil)
    }
}
