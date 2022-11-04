//
//  HeaderViewModel.swift
//  twitterClone
//
//  Created by Lopes, Victor Trindade on 04/11/2022.
//

import Foundation
import UIKit

enum ProfileFilterOptions: Int, CaseIterable {
    case tweets
    case replies
    case likes
    
    var description: String {
        switch self {
        case .tweets: return "Tweets"
        case .replies: return "Tweets e Replies"
        case .likes: return "Likes"
        }
    }
}


struct ProfileHeaderViewModel {
    
//    MARK: - Properties
    let user: User
    
    var followersString: NSAttributedString? {
        return attributedText(withValue: 0, text: "Followers")
    }
    
    var followingString: NSAttributedString? {
        return attributedText(withValue: 2, text: "Following")
    }
    
    var actionButtonTile: String {
        if user.isCurrentUser {
            return "Edit Profile"
        }else {
            return "Follow"
        }
    }
    
//    MARK: - Lifecycle
    init(user: User) {
        self.user = user
    }
    
    fileprivate func attributedText(withValue value: Int, text: String) -> NSAttributedString {
        let attributedTitle = NSMutableAttributedString(string: "\(value)",
                                                        attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 14)])
        attributedTitle.append(NSMutableAttributedString(string: " \(text)",
                                                         attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14) , NSAttributedString.Key.foregroundColor : UIColor.lightGray ]))
        return attributedTitle
    }
    
}
