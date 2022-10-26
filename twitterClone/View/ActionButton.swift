//
//  ActionButton.swift
//  twitterClone
//
//  Created by Lopes, Victor Trindade on 26/10/2022.
//

import Foundation
import UIKit

class ActionButton: UIButton {
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        _init()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        _init()
    }
    
    private func _init() {
        super.tintColor = .white
        super.backgroundColor = .mainBlue
        super.setImage(UIImage(named: "new_tweet"), for: .normal)
    }
    
   
}
