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
    let filterBarOptionsCounter = ProfileFilterOptions.allCases.count
    
    public var viewModel: ProfileHeaderViewModel? {
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
    
    private let underlineView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    private let underlineViewSelected: UIView = {
        let view = UIView()
        view.backgroundColor = .mainBlue
        return view
    }()
    
    private lazy var followingLabel: UILabel = {
       let label = UILabel()
        
        label.text = "O following"
        label.font = UIFont.systemFont(ofSize: 14)
        let followTap = UITapGestureRecognizer(target: self, action: #selector(followingTappedHandler))
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(followTap)
        return label
    }()
    
    private lazy var followersLabel: UILabel = {
       let label = UILabel()
        
        label.text = "2  followers"
        label.font = UIFont.systemFont(ofSize: 14)
        let followTap = UITapGestureRecognizer(target: self, action: #selector(followersTappedHandler))
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(followTap)
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
        
        let followStack = UIStackView(arrangedSubviews: [followingLabel,followersLabel])
        followStack.axis = .horizontal
        followStack.spacing = 8
        addSubview(followStack)
        followStack.anchor(top: stack.bottomAnchor, left: stack.leftAnchor, paddingTop: 8)
        
        addSubview(filterBar)
        filterBar.delegate = self
        filterBar.anchor(top: followStack.bottomAnchor ,left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 8)
        
        addSubview(underlineView)
        underlineView.anchor(left: leftAnchor, bottom: bottomAnchor, width: frame.width, height: 1)
        addSubview(underlineViewSelected)
        underlineViewSelected.anchor(left: leftAnchor, bottom: bottomAnchor, width: frame.width/Double(filterBarOptionsCounter), height: 2)
    }
    
    private func configureUserData() {
        guard let viewModel = viewModel else { return }
        
        imageView.configureImage(image: ImageLoader.getASync(viewModel.user.profileImageUrl)?.withRenderingMode(.alwaysOriginal) ?? UIImage())
        imageView.layer.cornerRadius = 80/2
        userFullNameLabel.text = viewModel.user.fullname
        userNameLabel.text = "@\(viewModel.user.username)"
        editFollowButton.setTitle(viewModel.actionButtonTile, for: .normal)
        
        followersLabel.attributedText = viewModel.followersString
        followingLabel.attributedText = viewModel.followingString
        
    }
    
//    MARK: - Selectors
    
    @objc func backHandler() {
        
    }
    
    @objc func editProfileFollowHandler() {
        
    }
    
    @objc func followingTappedHandler() {
        
    }
    
    @objc func followersTappedHandler() {
        
    }
}

//  MARK: - ProfileFilterViewDelegate
extension ProfileHeader: ProfileFilterViewDelegate {
    func filterView(_ view: ProfileFilterView, didSelect indexPath: IndexPath) {
        guard let cell = view.collectionView.cellForItem(at: indexPath) as? ProfileFilterCell else { return }
        let xPosition = cell.frame.origin.x
        UIView.animate(withDuration: 0.3) {
            self.underlineViewSelected.frame.origin.x = xPosition
        }
    }
}
