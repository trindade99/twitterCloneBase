//
//  TweetViewModel.swift
//  twitterClone
//
//  Created by Lopes, Victor Trindade on 02/11/2022.
//

import Foundation
import UIKit

class TweetViewModel {
    
//    MARK: - Properties
    let tweet: Tweet
    let user: User
    
    var profileImageUrl: String {
        return user.profileImageUrl
    }
    var caption: String {
        return tweet.caption
    }
    
    var timestamp: String {
        let formater = DateComponentsFormatter()
        formater.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        formater.maximumUnitCount = 1
        formater.unitsStyle = .abbreviated
        let now = Date()
        return formater.string(from: tweet.timestamp, to: now) ?? ""
    }
    
    var userInfoText: NSAttributedString {
        let title = NSMutableAttributedString(string: user.fullname,
                                              attributes: [.font : UIFont.boldSystemFont(ofSize: 14)])
        title.append(NSAttributedString(string: " @\(user.username)",
                                        attributes: [.font : UIFont.systemFont(ofSize: 14),
                                                     .foregroundColor : UIColor.lightGray]))
        
        title.append(NSAttributedString(string: " • \(timestamp)",
                                        attributes: [.font : UIFont.systemFont(ofSize: 14),
                                                                                .foregroundColor : UIColor.lightGray]))
        return title
    }
    
//    MARK: - Lifecycle
    init(tweet: Tweet) {
        self.tweet = tweet
        self.user = tweet.user
    }
}
