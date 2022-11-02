//
//  TweetCell.swift
//  twitterClone
//
//  Created by Lopes, Victor Trindade on 02/11/2022.
//

import UIKit
import EzImageLoader

class TweetCell: UICollectionViewCell {
    
//    MARK: - Properties
//    let user: User?
    
    private var profileImage = CustomImageView(image: UIImage())
    
    private let captionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.text = "some text label"
        return label
    }()
    
    private let infoLabel = UILabel()
    
    private let commentButton = CustomButtonWithImage()
    private let retweetButton = CustomButtonWithImage()
    private let likeButton = CustomButtonWithImage()
    private let shareButton = CustomButtonWithImage()
    
//    MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//    MARK: - Selectors
    
//    MARK: - Helpers
    private func configureUI() {
        addSubview(profileImage)
        profileImage.anchor(top: topAnchor, left: leftAnchor, paddingTop: 12, paddingLeft: 8)
//        profileImage = CustomImageView(image: ImageLoader.getASync(user?.profileImageUrl ?? "")?.withRenderingMode(.alwaysOriginal))
        profileImage.setDimensions(width: 48, height: 48)
        profileImage.layer.cornerRadius = 48/2
        
        let stack = UIStackView(arrangedSubviews: [infoLabel, captionLabel])
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.spacing = 4
        
        addSubview(stack)
        stack.anchor(top: profileImage.topAnchor, left: profileImage.rightAnchor, right: rightAnchor, paddingLeft: 8, paddingRight: 12)
        
        infoLabel.text = "InfoLabel"
        infoLabel.font = UIFont.systemFont(ofSize: 14)
        
        configureButtons()
        
        let buttonStack = UIStackView(arrangedSubviews: [commentButton, retweetButton, likeButton, shareButton])
        buttonStack.axis = .horizontal
        buttonStack.spacing = 72
        addSubview(buttonStack)
        buttonStack.anchor(bottom: bottomAnchor, paddingBottom: 8)
        buttonStack.centerX(inView: self)
        
        let underlineView = UIView()
        underlineView.backgroundColor = .systemGroupedBackground
        addSubview(underlineView)
        underlineView.anchor(left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, height: 1)
    }
    
    private func configureButtons() {
        configureButton(button: commentButton, image: "comment", action: #selector(commentAction))
        configureButton(button: retweetButton, image: "retweet", action: #selector(retweetAction))
        configureButton(button: likeButton, image: "like", action: #selector(likeAction))
        configureButton(button: shareButton, image: "share", action: #selector(sharetAction))
    }
    
    private func configureButton(button: CustomButtonWithImage, image: String, action: Selector) {
        button.configureImage(image: UIImage(named: image)?.withRenderingMode(.alwaysTemplate) ?? UIImage())
        button.setDimensions(width: 20, height: 20)
        button.tintColor = .darkGray
        button.addTarget(self, action: action, for: .touchUpInside)
    }

    @objc func commentAction() {
        print("comment")
    }
    
    @objc func retweetAction() {
        print("retweet")
    }
    
    @objc func likeAction() {
        print("like")
    }
    
    @objc func sharetAction() {
        print("share")
    }
}
