//
//  RegistrationController.swift
//  twitterClone
//
//  Created by Lopes, Victor Trindade on 26/10/2022.
//

import UIKit

class RegistrationController: UIViewController {
    
    //    MARK: - Properties
        
    private let avatarImageView = CustomButtonWithImage()
    private let loginButton = ActionButton()
    private let inputViewEmail = InputViewWithImageView()
    private let inputViewPassword = InputViewWithImageView()
    private let inputViewName = InputViewWithImageView()
    private let inputViewUserName = InputViewWithImageView()
    private let footerView = FooterView()

    private let imagePicker = UIImagePickerController()
    
        
    //    MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
            

//
        configureUI()
            
    }
    //    MARK: - Selectors
    @objc func loginRegisterAction() {
        navigationController?.popViewController(animated: true)
    }
        
    @objc func signupRegisterAction() {
        print("login")
    }
    
    @objc func addPhoto() {
        self.present(imagePicker, animated: true, completion: nil)
    }
        
    //    MARK: - Helpers
        
    func configureUI() {
        view.backgroundColor = .mainBlue
        navigationController?.navigationBar.barStyle = .black
            
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
            
        view.addSubview(avatarImageView)
        avatarImageView.configureImage(image: UIImage(named: "plus_photo")?.withRenderingMode(.alwaysTemplate) ?? UIImage())
        avatarImageView.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor)
        avatarImageView.setDimensions(width: 150, height: 150)
//        avatarImageView.layer.cornerRadius = 150/2
        avatarImageView.addTarget(self, action: #selector(addPhoto), for: .touchUpInside)
            
        let stack = UIStackView(arrangedSubviews: [inputViewEmail, inputViewPassword, inputViewName, inputViewUserName])
        view.addSubview(stack)
        stack.anchor(top: avatarImageView.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor,
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
            
        inputViewName.setDimensions(width: stack.frame.width, height: 50)
        inputViewName.image = UIImage(named: "ic_person_outline_white_2x")
        let nameTextField = UITextField()
        nameTextField.placeholder = "Full Name"
        inputViewName.textField = nameTextField
        inputViewName.divider = true
        inputViewName.configure()
            
        inputViewUserName.setDimensions(width: stack.frame.width, height: 50)
        inputViewUserName.image = UIImage(named: "ic_person_outline_white_2x")
        let usarNameTextField = UITextField()
        usarNameTextField.placeholder = "Username"
        inputViewUserName.textField = usarNameTextField
        inputViewUserName.divider = true
        inputViewUserName.configure()
            
        view.addSubview(loginButton)
        loginButton.centerX(inView: view, topAnchor: stack.bottomAnchor, paddingTop: 25)
        loginButton.setDimensions(width: 300, height: 50)
        loginButton.layer.cornerRadius = 5
        loginButton.addTarget(self, action: #selector(signupRegisterAction), for: .touchUpInside)
        loginButton.changeStyle(buttonStyle: .titleBlue)
        loginButton.changeTitle(title: "Sign Up")
            
        view.addSubview(footerView)
        footerView.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingLeft: 65, paddingBottom: 1, paddingRight: 65, height: 50)
        footerView.text = "Already have an account?"
        let footerButton = ActionButton()
        footerButton.changeStyle(buttonStyle: .onlyTitle)
        footerButton.changeTitle(title: "Login")
        footerButton.addTarget(self, action: #selector(loginRegisterAction), for: .touchUpInside)
        footerView.button = footerButton
        footerView.configure()
    }
    
    func updateProfileImage(image: UIImage) {
        avatarImageView.chosed = true
        avatarImageView.configureImage(image: image)
    }
    
}


extension RegistrationController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let profileImage = info[.editedImage] as? UIImage else { return }
        
        updateProfileImage(image: profileImage.withRenderingMode(.alwaysOriginal))
        dismiss(animated: true)
        
    }
}
