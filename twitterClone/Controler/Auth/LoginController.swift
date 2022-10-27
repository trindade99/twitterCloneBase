//
//  LoginController.swift
//  twitterClone
//
//  Created by Lopes, Victor Trindade on 26/10/2022.
//

import UIKit

class LoginController: UIViewController {
    
//    MARK: - Properties
    
    private let logoImageView = CustomImageView(image: UIImage(named: "TwitterLogo"))
    private let loginButton = ActionButton()
    private let inputViewEmail = InputViewWithImageView()
    private let inputViewPassword = InputViewWithImageView()
    private let footerView = FooterView()
    
//    MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }
//    MARK: - Selectors
    @objc func loginAction() {
        print("login")
    }
    
    @objc func signupAction() {
       let controller = RegistrationController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
//    MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .mainBlue
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.tintColor = .white
        
        view.addSubview(logoImageView)
        logoImageView.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor)
        logoImageView.setDimensions(width: 150, height: 150)
        
        let stack = UIStackView(arrangedSubviews: [inputViewEmail, inputViewPassword])
        view.addSubview(stack)
        stack.anchor(top: logoImageView.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor,
                     right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 25, paddingLeft: 45, paddingRight: 45)
        stack.axis = .vertical
        stack.spacing = 20

        
        inputViewEmail.setDimensions(width: stack.frame.width, height: 50)
        inputViewEmail.image = UIImage(named: "mail")
        let emailTextField = UITextField()
        emailTextField.placeholder = "Email"
        inputViewEmail.textField = emailTextField
        inputViewEmail.divider = true
        inputViewEmail.configure()
        
        inputViewPassword.setDimensions(width: stack.frame.width, height: 50)
        inputViewPassword.image = UIImage(named: "ic_lock_outline_white_2x")
        let passwordTextField = UITextField()
        passwordTextField.placeholder = "Password"
        inputViewPassword.textField = passwordTextField
        inputViewPassword.divider = true
        inputViewPassword.configure()
        
        view.addSubview(loginButton)
        loginButton.centerX(inView: view, topAnchor: stack.bottomAnchor, paddingTop: 25)
        loginButton.setDimensions(width: 300, height: 50)
        loginButton.layer.cornerRadius = 5
        loginButton.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
        loginButton.changeStyle(buttonStyle: .titleBlue)
        loginButton.changeTitle(title: "LogIn")
        
        view.addSubview(footerView)
        footerView.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingLeft: 65, paddingBottom: 1, paddingRight: 65, height: 50)
        footerView.text = "Don't have an account?"
        let footerButton = ActionButton()
        footerButton.changeStyle(buttonStyle: .onlyTitle)
        footerButton.changeTitle(title: "Sign Up")
        footerButton.addTarget(self, action: #selector(signupAction), for: .touchUpInside)
        footerView.button = footerButton
        footerView.configure()
    }
}
