//
//  UserService.swift
//  twitterClone
//
//  Created by Lopes, Victor Trindade on 28/10/2022.
//

import Foundation
import Firebase

struct UserService {
//    evitar ao maximo "static let"
    static let shared = UserService()
    
    func fetchUser(uid: String, completion: @escaping(User) -> Void) {
        print("DEBUG: FETCH USER DATA INFO")
        
        REF_USERS.child(uid).observeSingleEvent(of: .value) { snapshot in
            guard let dict = snapshot.value as? [String: AnyObject] else { return }
            
            let user = User(uid: uid, dictionary: dict)
            completion(user)
        }
        
    }
}
