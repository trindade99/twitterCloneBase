//
//  HeaderViewModel.swift
//  twitterClone
//
//  Created by Lopes, Victor Trindade on 04/11/2022.
//

import Foundation

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
