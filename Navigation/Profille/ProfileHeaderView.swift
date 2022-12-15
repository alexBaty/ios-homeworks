//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Alexander Batyshev on 02.12.2022.
//

import UIKit

class ProfileHeaderView: UIView {

    static let headerID = "ProfileHeaderView"

    let fullNameLabel: UILabel = {
        var fullNameLabel = UILabel(frame: CGRect(x: 170, y: 130, width: 200, height: 20))
        fullNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        fullNameLabel.text = "Hipster Cat"
        return fullNameLabel
    }()

    let statusLabel: UILabel = {
        var statusLabel = UILabel(frame: CGRect(x: 170, y: 185, width: 200, height: 20))
        statusLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        statusLabel.textColor = .gray
        statusLabel.text = "Waiting for something..."
        return statusLabel
    }()

    let setStatusButton: UIButton = {
        var setStatusButton = UIButton(frame: CGRect(x: 16, y: 256, width: 361, height: 50))
        setStatusButton.backgroundColor = .link
        setStatusButton.setTitle("Show status", for: .normal)
        setStatusButton.layer.cornerRadius = 4
        setStatusButton.layer.shadowOpacity = 0.7
        setStatusButton.layer.shadowRadius = 4
        setStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        setStatusButton.layer.shadowColor = UIColor.black.cgColor
        return setStatusButton
    }()

    let avatarImageView: UIImageView = {
        var avatarImageView = UIImageView(frame: CGRect(x: 16, y: 114, width: 130, height: 130))
        avatarImageView.image = UIImage(named: "cat")
        avatarImageView.layer.cornerRadius = avatarImageView.frame.size.height/2
        avatarImageView.layer.masksToBounds = true
        avatarImageView.layer.borderWidth = 3
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        return avatarImageView
    }()

    let statusTextField: UITextField = {
        var statusTextField = UITextField(frame: CGRect(x: 170, y: 210, width: 200, height: 40))
        statusTextField.layer.borderColor = UIColor.black.cgColor
        statusTextField.layer.borderWidth = 1
        statusTextField.backgroundColor = .white
        statusTextField.layer.cornerRadius = 12
        statusTextField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        statusTextField.textColor = .black
        statusTextField.textAlignment = .center
        statusTextField.clearButtonMode = .whileEditing
        return statusTextField
    }()

    private var statusText: String = ""

    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.backgroundColor = .systemGray6
        getSubviews()
        createProfileHeaderViewConstraints() // +
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func getSubviews() {
        addSubview(fullNameLabel)
        addSubview(statusLabel)
        addSubview(setStatusButton)
        setStatusButton.addAction(UIAction(handler: {_ in
            print(self.statusLabel.text ?? "")
            self.statusLabel.text = self.statusText
        }), for: .touchUpInside)
        addSubview(avatarImageView)
        statusTextField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        addSubview(statusTextField)
    }

    @objc func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text ?? ""
    }
}

extension ProfileHeaderView {

    func createProfileHeaderViewConstraints() {
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        setStatusButton.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        statusTextField.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            fullNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 27),
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            statusLabel.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -54),
            statusLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16),
            setStatusButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            setStatusButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            avatarImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            avatarImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            avatarImageView.heightAnchor.constraint(equalToConstant: avatarImageView.frame.height),
            avatarImageView.widthAnchor.constraint(equalToConstant: avatarImageView.frame.width),
            statusTextField.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            statusTextField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            statusTextField.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -10)
        ])
    }
}

