//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Alexander Batyshev on 02.12.2022.
//

import UIKit

class ProfileHeaderView: UIView, UITextFieldDelegate {

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

    private lazy var avatarSize = CGFloat(130)

    lazy var avatarImageView: UIImageView = {
        var avatarImageView = UIImageView()
        avatarImageView.image = UIImage(named: "cat")
        avatarImageView.layer.cornerRadius = avatarSize/2
        avatarImageView.layer.masksToBounds = true
        avatarImageView.layer.borderWidth = 3
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.isUserInteractionEnabled = true
        return avatarImageView
    }()

    lazy var statusTextField: UITextField = {
        var statusTextField = UITextField(frame: CGRect(x: 170, y: 210, width: 200, height: 40))
        statusTextField.layer.borderColor = UIColor.black.cgColor
        statusTextField.layer.borderWidth = 1
        statusTextField.backgroundColor = .white
        statusTextField.layer.cornerRadius = 12
        statusTextField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        statusTextField.textColor = .black
        statusTextField.textAlignment = .center
        statusTextField.clearButtonMode = .whileEditing
        statusTextField.delegate = self
        return statusTextField
    }()

    let transparentView: UIView = {
        var transparentView = UIView(frame: CGRect(x: 0, y: -100, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height + 100))
        transparentView.backgroundColor = .black
        transparentView.alpha = 0.0
        return transparentView
    }()

    let returnButton: UIButton = {
        var returnButton = UIButton()
        returnButton.alpha = 0
        returnButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        returnButton.tintColor = .white
        return returnButton
    }()

    private var statusText: String = ""

    private lazy var avatarCenter = avatarImageView.center
    private lazy var avatarBounds = avatarImageView.layer.bounds

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
            if self.statusText == "" {
                self.statusTextField.shakeField()
                self.statusTextField.changeColor(self.statusTextField)
            } else {
                self.statusLabel.text = self.statusText
            }
        }), for: .touchUpInside)
        addSubview(avatarImageView)
        statusTextField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        avatarImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTap)))
        returnButton.addTarget(self, action: #selector(returnBack), for: .touchUpInside)
        addSubview(statusTextField)
        addSubview(transparentView)
        addSubview(avatarImageView)
        addSubview(returnButton)
    }

    @objc func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text ?? ""
    }

    @objc func onTap(_ tapRecognizer: UITapGestureRecognizer) {

        avatarCenter = avatarImageView.center
        avatarBounds = avatarImageView.bounds

        UIView.animate(withDuration: 0.5){ [self] in
            transparentView.alpha = 0.6
            avatarImageView.layer.cornerRadius = 0
            avatarImageView.layer.borderWidth = 0
            avatarImageView.layer.bounds = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
            avatarImageView.center = transparentView.center
        } completion: { _ in
            UIView.animate(withDuration: 0.3) { [self] in
                returnButton.alpha = 1
            }
        }
    }

    @objc func returnBack() {
        UIView.animate(withDuration: 0.3) { [self] in
            returnButton.alpha = 0
        } completion: { _ in
            UIView.animate(withDuration: 0.5) { [self] in
                transparentView.alpha = 0
                avatarImageView.layer.borderWidth = 3
                avatarImageView.layer.cornerRadius = avatarSize / 2
                avatarImageView.center = avatarCenter
                avatarImageView.bounds = avatarBounds
            }
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        statusTextField.shakeField()
        statusTextField.changeColor(statusTextField)
        return false
    }
}

extension ProfileHeaderView {

    func createProfileHeaderViewConstraints() {
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        setStatusButton.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        returnButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            fullNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 27),
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            statusLabel.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -54),
            statusLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16),
            setStatusButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            setStatusButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            setStatusButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            avatarImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            avatarImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            avatarImageView.heightAnchor.constraint(equalToConstant: avatarSize),
            avatarImageView.widthAnchor.constraint(equalToConstant: avatarSize),
            statusTextField.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            statusTextField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            statusTextField.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -10),
            returnButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            returnButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
    }
}

