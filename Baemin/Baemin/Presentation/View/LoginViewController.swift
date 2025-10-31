//
//  LoginViewController.swift
//  Baemin
//
//  Created by 진소은 on 10/28/25.
//

import UIKit

import SnapKit
import Then

class LoginViewController: UIViewController {
        
    // MARK: - UI Components
    
    private let navigationBar = CustomNavigationBar(title: "이메일 또는 아이디로 계속")
    private let idTextField = UITextField()
    private let passwordTextField = UITextField()
    private let loginButton = CTAButton()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
        setTextFieldActions()
    }
    
    // MARK: - Set UI
    
    private func setUI() {
        view.backgroundColor = .white
        
        idTextField.do {
            $0.textColor = .baeminBlack
            $0.font = .pretendard(.body_r_14)
            $0.addPadding(10)
            $0.placeholder = "이메일 아이디"
            $0.setPlaceholder(color: .baeminGray200)
            $0.borderStyle = .none
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor(.baeminGray200).cgColor
            $0.layer.cornerRadius = 4
        }
        
        passwordTextField.do {
            $0.textColor = .baeminBlack
            $0.font = .pretendard(.body_r_14)
            $0.addPadding(10)
            $0.placeholder = "비밀번호"
            $0.setPlaceholder(color: .baeminGray200)
            $0.borderStyle = .none
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor(.baeminGray200).cgColor
            $0.layer.cornerRadius = 4
            $0.isSecureTextEntry = true
        }
        
        loginButton.configure(style: .inactive, title: "로그인")
    }
    
    // MARK: - Set Layout
    
    private func setLayout() {
        view.addSubviews(navigationBar, idTextField, passwordTextField, loginButton)
        
        navigationBar.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(42)
        }
        
        idTextField.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(66)
            $0.height.equalTo(46)
            $0.horizontalEdges.equalToSuperview().inset(16)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(12)
            $0.height.equalTo(46)
            $0.horizontalEdges.equalToSuperview().inset(16)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(20)
            $0.height.equalTo(46)
            $0.horizontalEdges.equalToSuperview().inset(16)
        }
    }
    
    // MARK: - Actions
    
    private func setTextFieldActions() {
        [idTextField, passwordTextField].forEach {
            $0.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
            $0.addTarget(self, action: #selector(textFieldEditingDidBegin), for: .editingDidBegin)
            $0.addTarget(self, action: #selector(textFieldEditingDidEnd), for: .editingDidEnd)
        }
    }
    
    @objc
    func textFieldDidChange(_ textField: UITextField) {
        let idText = idTextField.text ?? ""
        let pwText = passwordTextField.text ?? ""
        loginButton.isEnabled = !idText.isEmpty && !pwText.isEmpty
    }
    
    @objc
    func textFieldEditingDidBegin(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.baeminBlack.cgColor
    }
    
    @objc
    func textFieldEditingDidEnd(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.baeminGray200.cgColor
    }
}

#Preview {
    LoginViewController()
}
