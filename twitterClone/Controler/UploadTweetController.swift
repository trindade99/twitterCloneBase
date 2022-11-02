//
//  UploadTweetController.swift
//  twitterClone
//
//  Created by Lopes, Victor Trindade on 28/10/2022.
//

import UIKit
import EzImageLoader

class UploadTweetController: UIViewController {
//    MARK: - Properties
    let user: User?
    
    let cancelButton = ActionButton()
    let postButton = ActionButton()
    var profileImage = CustomImageView(image: UIImage())
    let textView = TextViewWithPlaceHolder()
    
//    MARK: - Lifecycle
    init(user: User) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHeader()
        configureUI()
    }
//    MARK: - Selectors
    
//    MARK: - API
    
//    MARK: - Helpers
    
    @objc func cancelPressed(){
        self.dismiss(animated: true)
    }
    
    @objc func postPressed(){
        print("DEBUG: Upload logic here...")
    }
    
    func configureProfileImage() {
        profileImage = CustomImageView(image: ImageLoader.getASync(user?.profileImageUrl ?? "")?.withRenderingMode(.alwaysOriginal))
    }
    
    func configureUI() {
        view.backgroundColor = .white
        configureProfileImage()
        
        let stack = UIStackView(arrangedSubviews: [profileImage,textView])
        stack.axis = .horizontal
        stack.alignment = .top
        stack.spacing = 12
        view.addSubview(stack)
        stack.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: view.keyboardLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingTop: 16, paddingLeft: 16, paddingRight: 10)
        
        profileImage.setDimensions(width: 42, height: 42)
        profileImage.layer.cornerRadius = 42/2
        
        textView.anchor(top: stack.topAnchor, left: profileImage.rightAnchor, bottom: stack.bottomAnchor, right: stack.keyboardLayoutGuide.rightAnchor,paddingLeft: 10, paddingRight: 5)
        textView.configureText(labelText: "What's happenig?")
    }
    
    func configureHeader() {
        cancelButton.setDimensions(width: 64, height: 32)
        cancelButton.changeStyle(buttonStyle: .titleColor)
        cancelButton.changeColors(bgColor: .white, textColor: .mainBlue)
        cancelButton.changeTitle(title: "Cancel")
        cancelButton.addTarget(self, action: #selector(cancelPressed), for: .touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: cancelButton)
        
        postButton.setDimensions(width: 64, height: 32)
        postButton.changeStyle(buttonStyle: .titleColor)
        postButton.changeColors(bgColor: .mainBlue, textColor: .white)
        postButton.changeTitle(title: "Post")
        postButton.layer.cornerRadius = 32/2
        postButton.addTarget(self, action: #selector(postPressed), for: .touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: postButton)
        
    }
}
