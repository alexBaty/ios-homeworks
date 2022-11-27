//
//  InfoViewController.swift
//  Navigation
//
//  Created by Alexander Batyshev on 27.11.2022.
//

import UIKit

class InfoViewController: UIViewController {

    var alertButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .cyan
        alertButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        alertButton.backgroundColor = .darkText
        alertButton.setTitle("Alert", for: .normal)
        alertButton.center = self.view.center
        alertButton.addTarget(self, action: #selector(alertView), for: .touchUpInside)
        self.view.addSubview(alertButton)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        alertButton.center = self.view.center
    }

    @objc func alertView() {
        let alertViewController = UIAlertController(title: "Alert", message: "Error", preferredStyle: .alert)
        alertViewController.addAction(UIAlertAction (title: "Cancel", style: .cancel) {_ in print("Cancel")})
        alertViewController.addAction(UIAlertAction(title: "OK", style: .default) {_ in print("OK")})
        self.present(alertViewController, animated: true)
    }
}
