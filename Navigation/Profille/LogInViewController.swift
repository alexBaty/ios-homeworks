//
//  LogInViewController.swift
//  Navigation
//
//  Created by Alexander Batyshev on 08.12.2022.
//

import UIKit

class LogInViewController: UIViewController, UIScrollViewDelegate {

    let logInImageView: UIImageView = {
        var logInImageView = UIImageView(frame: .zero)
        logInImageView.image = UIImage(named: "logIn")
        logInImageView.translatesAutoresizingMaskIntoConstraints = false
        return logInImageView
    }()

    let logInButton: UIButton = {
        var logInButton = UIButton(frame: .zero)
        logInButton.backgroundColor = UIColor(named: "color")
        logInButton.setTitle("Log In", for: .normal)
        logInButton.layer.cornerRadius = 10
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        return logInButton
    }()

    let scrollView: UIScrollView = {
        var scrollView = UIScrollView(frame: .zero)
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 750)
        scrollView.keyboardDismissMode = .interactive
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(logInImageView)
        scrollView.addSubview(logInButton)
        logInButton.addTarget(self, action: #selector(goToProfile), for: .touchUpInside)
        scrollView.addSubview(createLogInView())
        createLogInViewConstraints()
        self.scrollView.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        subscribeKeyboardEvents()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }

    func createLogInView() -> UIStackView {
        let logInView = UIStackView()
        logInView.axis = .vertical
        logInView.distribution = .fillEqually
        logInView.layer.cornerRadius = 10
        logInView.layer.masksToBounds = true
        logInView.layer.borderColor = UIColor.lightGray.cgColor
        logInView.layer.borderWidth = 0.5
        logInView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logInView)

        let logInTextField = UITextField()
        logInTextField.layer.borderColor = UIColor.lightGray.cgColor
        logInTextField.placeholder = "Email or phone"
        logInTextField.layer.borderWidth = 0.5
        logInTextField.backgroundColor = .systemGray6
        logInTextField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        logInTextField.textColor = .black
        logInTextField.tintColor = .tintColor
        logInTextField.autocapitalizationType = .none
        logInTextField.setLeftPaddingPoints(10)
        logInTextField.clearButtonMode = .whileEditing

        let passwordTextField = UITextField()
        passwordTextField.placeholder = "Password"
        passwordTextField.backgroundColor = .systemGray6
        passwordTextField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        passwordTextField.textColor = .black
        passwordTextField.tintColor = .tintColor
        passwordTextField.autocapitalizationType = .none
        passwordTextField.setLeftPaddingPoints(10)
        passwordTextField.clearButtonMode = .whileEditing
        passwordTextField.isSecureTextEntry = true

        logInView.addArrangedSubview(logInTextField)
        logInView.addArrangedSubview(passwordTextField)

        let safeLayout = self.view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            logInView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 340),
            logInView.leftAnchor.constraint(equalTo: safeLayout.leftAnchor, constant: 16),
            logInView.rightAnchor.constraint(equalTo: safeLayout.rightAnchor, constant: -16),
            logInView.heightAnchor.constraint(equalToConstant: 100)
        ])

        return logInView
    }

    func createLogInViewConstraints() {

        let safeLayout = self.view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            logInImageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 120),
            logInImageView.heightAnchor.constraint(equalToConstant: 100),
            logInImageView.widthAnchor.constraint(equalToConstant: 100),
            logInImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logInButton.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 456),
            logInButton.leadingAnchor.constraint(equalTo: safeLayout.leadingAnchor, constant: 16),
            logInButton.trailingAnchor.constraint(equalTo: safeLayout.trailingAnchor, constant: -16),
            logInButton.heightAnchor.constraint(equalToConstant: 50),
            scrollView.heightAnchor.constraint(equalTo: safeLayout.heightAnchor),
            scrollView.widthAnchor.constraint(equalTo: safeLayout.widthAnchor),
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    @objc func goToProfile() {
        let profileViewController = ProfileViewController()
        self.navigationController?.pushViewController(profileViewController, animated: true)
    }
}

extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}

extension LogInViewController {

    func subscribeKeyboardEvents() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc func keyboardWillShow(_ notification: NSNotification) {
        guard let keyboardShow = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {return}
        self.scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardShow.height - self.view.safeAreaInsets.bottom + 70, right: 0)
    }

    @objc func keyboardWillHide(_ notification: NSNotification) {
        self.scrollView.contentInset = .zero
    }
}
