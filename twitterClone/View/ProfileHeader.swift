//
//  ProfileHeader.swift
//  twitterClone
//
//  Created by Lopes, Victor Trindade on 03/11/2022.
//

import UIKit

class ProfileHeader: UICollectionReusableView {
    
//    MARK: - Proprieties
//    MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    MARK: - Helpers
    func ocnfigureUI() {
        
    }
}
