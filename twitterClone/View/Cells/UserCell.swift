//
//  UserCell.swift
//  twitterClone
//
//  Created by Lopes, Victor Trindade on 07/11/2022.
//

import UIKit
import EzImageLoader

class UserCell: UITableViewCell {
//    MARK: - Properties
    
    var user: User? {
        didSet {
            populateUserData()
        }
    }
    
    private lazy var profileImage = CustomImageView(image: UIImage())
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.text = "userName"
        return label
    }()
    
    private let fullNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "fullName"
        return label
    }()
    
//    MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        ocnfigureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
//    MARK: - Helpers
    
    func ocnfigureUI() {
        addSubview(profileImage)
        profileImage.centerY(inView: self, leftAnchor: leftAnchor, paddingLeft: 12)
        profileImage.setDimensions(width: 48, height: 48)
        profileImage.layer.cornerRadius = 48/2
        
        let stack = UIStackView.init(arrangedSubviews: [userNameLabel,fullNameLabel])
        stack.axis = .vertical
        stack.spacing = 2
        addSubview(stack)
        stack.centerY(inView: self, leftAnchor: profileImage.rightAnchor, paddingLeft: 12)
    }
    
    func populateUserData() {
        guard let user = user else { return }
        profileImage.image = ImageLoader.getASync(user.profileImageUrl)?.withRenderingMode(.alwaysOriginal)
        profileImage.layer.cornerRadius = 48/2
        
        userNameLabel.text = user.username
        fullNameLabel.text = user.fullname
        
    }
    
}
