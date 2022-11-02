//
//  TweetService.swift
//  twitterClone
//
//  Created by Lopes, Victor Trindade on 02/11/2022.
//

import Foundation
import Firebase

struct TweetFormat {
    let uid: String
    let timestamp = Int(NSDate().timeIntervalSince1970)
    let likes: Int
    let retweets: Int
    let caption: String
    
    
    
    var dictionary: [String: Any] {
        return ["uid": uid,
                "timestamp": timestamp,
                "likes": likes,
                "retweets": retweets,
                "caption": caption]
    }
//    var nsDictionary: NSDictionary {
//        return dictionary as NSDictionary
//    }
}

struct TweetService {
    static let shared = TweetService()
    
    func uploadTweet(caption: String, completion: @escaping(Error?, DatabaseReference?) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let tweet = TweetFormat(uid: uid, likes: 0, retweets: 0, caption: caption)
        let values = tweet.dictionary as [String : Any]
        
        REF_TWEETS.childByAutoId().updateChildValues(values, withCompletionBlock: completion)
    }
}
