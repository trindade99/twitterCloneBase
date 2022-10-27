//
//  CustomButtonWithImage.swift
//  twitterClone
//
//  Created by Lopes, Victor Trindade on 27/10/2022.
//

import Foundation
import UIKit


class CustomButtonWithImage: UIButton {
    
    var chosed = false
    var image: UIImage? = nil
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        _init()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        _init()
    }
    
    func configureImage(image: UIImage){
        self.image = image
        _init()
    }
    
    private func _init() {
        if let image = image {
            super.setImage(image, for: .normal)
            super.tintColor = .white
            super.layer.cornerRadius = super.frame.width/2
            super.layer.masksToBounds = true
            super.imageView?.contentMode = .scaleAspectFill
            super.imageView?.clipsToBounds = true
            if chosed {
                super.layer.borderColor = UIColor.white.cgColor
                super.layer.borderWidth = 3
            }
        }
        
    }
}
