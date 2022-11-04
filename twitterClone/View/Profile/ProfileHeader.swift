//
//  ProfileHeader.swift
//  twitterClone
//
//  Created by Lopes, Victor Trindade on 03/11/2022.
//

import UIKit
import EzImageLoader

class ProfileHeader: UICollectionReusableView {
    
//    MARK: - Proprieties
    
    private let filterBar = ProfileFilterView()
    
    public var user: User? {
        didSet {
            configureUserData()
        }
    }
    
    private lazy var containerView: UIView = {
       let view = UIView()
        view.backgroundColor = .mainBlue
        
        view.addSubview(backButton)
        backButton.anchor(top: view.topAnchor, left: view.leftAnchor,
                          paddingTop: 42, paddingLeft: 16)
        backButton.setDimensions(width: 30, height: 30)
        backButton.addTarget(self, action: #selector(backHandler), for: .touchUpInside)
        
        return view
    }()
    
    private lazy var backButton = BackHeaderButton(type: .system)
    
    private lazy var imageView = CustomButtonWithImage()
    
    private lazy var editFollowButton = ActionButton()
    
    private lazy var bioLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 3
        label.text = "This is a testing bio label, This is a testing bio label, This is a testing bio label"
        return label
    }()
    
    private lazy var userFullNameLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "User Full Name"
        return label
    }()
    
    private lazy var userNameLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .lightGray
        label.text = "UserName"
        return label
    }()
    
    
//    MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        ocnfigureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    MARK: - Helpers
    func ocnfigureUI() {
        
        backgroundColor = .white
        addSubview(containerView)
        containerView.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor, height: 108)
        
        containerView.addSubview(imageView)
        imageView.chosed = true
        imageView.anchor(top: containerView.bottomAnchor, left: containerView.leftAnchor, paddingTop: -24 , paddingLeft: 8)
        imageView.setDimensions(width: 80, height: 80)
        imageView.layer.cornerRadius = 80/2
        
        editFollowButton.changeStyle(buttonStyle: .follow)
        editFollowButton.changeTitle(title: "Loading..")
        editFollowButton.addTarget(self, action: #selector(editProfileFollowHandler), for: .touchUpInside)
        
        addSubview(editFollowButton)
        editFollowButton.anchor(top: containerView.bottomAnchor, right: rightAnchor, paddingTop: 12, paddingRight: 12)
        editFollowButton.setDimensions(width: 100, height: 36)
        editFollowButton.layer.cornerRadius = 36/2
        
        let stack = UIStackView(arrangedSubviews: [userFullNameLabel, userNameLabel, bioLabel])
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.spacing = 4
        addSubview(stack)
        stack.anchor(top: editFollowButton.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 12, paddingLeft: 12, paddingRight: 12)
        
        addSubview(filterBar)
//        filterBar.delegate = self
        filterBar.anchor(top: stack.bottomAnchor ,left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 8)
    }
    
    private func configureUserData() {
        guard let user = user else { return }

        imageView.configureImage(image: ImageLoader.getASync(user.profileImageUrl)?.withRenderingMode(.alwaysOriginal) ?? UIImage())
        imageView.layer.cornerRadius = 80/2
        userFullNameLabel.text = user.fullname
        userNameLabel.text = "@\(user.username)"
        
    }
    
//    MARK: - Selectors
    
    @objc func backHandler() {
        
    }
    
    @objc func editProfileFollowHandler() {
        
    }
}
