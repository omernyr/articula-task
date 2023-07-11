//
//  ViewController.swift
//  testcall
//
//  Created by macbook pro on 10.07.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    private let imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "artimage")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let numberTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter the number"
        textField.keyboardType = .phonePad
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let callStatusButton: UIButton = {
        let button = UIButton()
        button.configuration = .tinted()
        button.configuration?.image = UIImage(systemName: "phone.fill")
        button.layer.cornerRadius = 70
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(imageView)
        view.addSubview(numberTextField)
        view.addSubview(callStatusButton)
        callStatusButton.addTarget(self, action: #selector(voiceCallStatus), for: .touchUpInside)
        numberTextField.delegate = self
        makeConstraints()
    }

    private func makeConstraints() {
        
        imageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(50)
            make.width.equalTo(240)
            make.height.equalTo(128)
        }
        
        numberTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(50)
            make.top.equalTo(imageView.snp.bottom).offset(20)
        }
        
        callStatusButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(70)
            make.height.equalTo(70)
            make.top.equalTo(numberTextField.snp.bottom).offset(20)
        }
        
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let text = textField.text else { return }
        print(text)
    }
    
    @objc func voiceCallStatus() {
        guard let text = numberTextField.text else { return }
        APICaller(text)
    }
    
    
}
