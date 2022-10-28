//
//  AuthService.swift
//  twitterClone
//
//  Created by Lopes, Victor Trindade on 27/10/2022.
//

import Foundation
import Firebase
import UIKit

struct AuthCredentials {
    let email: String
    let password: String
    let name: String
    let userName: String
    let profileImage: UIImage
}


struct AuthService {
    static let shared = AuthService()
    
    func logUserIn(withEmail email: String, password: String, completion: @escaping(AuthDataResult?, Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password, completion: completion)
    }
    
    func registerUser(authCredentials: AuthCredentials, completion: @escaping(Error?, DatabaseReference) -> Void) {
        Auth.auth().createUser(withEmail: authCredentials.email, password: authCredentials.password) { result, error in
            if let error = error {
                print("DEBUG: ERROR \(error.localizedDescription)")
                return
            }
            
            guard let imageData = authCredentials.profileImage.jpegData(compressionQuality: 0.3) else { return }
            let filename = NSUUID().uuidString
            let storageRef = STORAGE_PROFILE_IMAGES.child(filename)
            
            storageRef.putData(imageData, metadata: nil) { meta, error in
                storageRef.downloadURL { url, error in   
                    guard let profileImageUrl = url?.absoluteString else { return }
                    guard let uid = result?.user.uid else { return }
                    
                    let values = ["email": authCredentials.email,
                                  "username": authCredentials.userName,
                                  "fullname": authCredentials.name,
                                  "profileImageUrl": profileImageUrl]
                    
                    REF_USERS.child(uid).updateChildValues(values, withCompletionBlock: completion)
                }
            }
        }
    }
}
