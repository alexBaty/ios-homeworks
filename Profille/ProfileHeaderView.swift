//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Alexander Batyshev on 02.12.2022.
//

import UIKit

class ProfileHeaderView: UIView {

    let labelName: UILabel = {
        var labelName = UILabel(frame: CGRect(x: 170, y: 130, width: 200, height: 20))
        labelName.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        labelName.text = "Hipster Cat"
        return labelName
    }()

    let labelStatus: UILabel = {
        var labelStatus = UILabel(frame: CGRect(x: 170, y: 185, width: 200, height: 20))
        labelStatus.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        labelStatus.textColor = .gray
        labelStatus.text = "Waiting for something..."
        return labelStatus
    }()

    let buttonShowStatus: UIButton = {
        var buttonShowStatus = UIButton(frame: CGRect(x: 16, y: 256, width: 361, height: 50))
        buttonShowStatus.backgroundColor = .link
        buttonShowStatus.setTitle("Show status", for: .normal)
        buttonShowStatus.layer.cornerRadius = 4
        buttonShowStatus.layer.shadowOpacity = 0.7
        buttonShowStatus.layer.shadowRadius = 4
        buttonShowStatus.layer.shadowOffset = CGSize(width: 4, height: 4)
        buttonShowStatus.layer.shadowColor = UIColor.black.cgColor
        return buttonShowStatus
    }()

    let image: UIImageView = {
        var image = UIImageView(frame: CGRect(x: 16, y: 114, width: 130, height: 130))
        image.image = UIImage(named: "cat.png")
        image.layer.cornerRadius = image.frame.size.height/2
        image.layer.masksToBounds = true
        image.layer.borderWidth = 3
        image.layer.borderColor = UIColor.white.cgColor
        return image
    }()

    let textField: UITextField = {
        var textField = UITextField(frame: CGRect(x: 170, y: 210, width: 200, height: 40))
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.textColor = .black
        textField.textAlignment = .center
        textField.clearButtonMode = .whileEditing
        return textField
    }()

    private var statusText: String = ""

    override func layoutSubviews() {
        addSubview(labelName)
        addSubview(labelStatus)
        addSubview(buttonShowStatus)
        buttonShowStatus.addAction(UIAction(handler: {_ in
            self.labelStatus.text = self.statusText
            print(self.labelStatus.text!)
        }), for: .touchUpInside)
        addSubview(image)
        textField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        addSubview(textField)
    }

    @objc func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text!
    }
}
