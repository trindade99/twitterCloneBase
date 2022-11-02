//
//  LogoImageView.swift
//  twitterClone
//
//  Created by Lopes, Victor Trindade on 26/10/2022.
//

import Foundation
import UIKit

class CustomImageView: UIImageView {
    
    override public init(image: UIImage?) {
        super.init(image: image)
        _init()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        _init()
    }
    
    private func _init() {
        super.backgroundColor = .mainBlue
        super.contentMode = .scaleAspectFit
        super.clipsToBounds = true
    }
}
