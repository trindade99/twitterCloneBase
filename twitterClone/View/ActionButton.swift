//
//  ActionButton.swift
//  twitterClone
//
//  Created by Lopes, Victor Trindade on 26/10/2022.
//

import Foundation
import UIKit

class ActionButton: UIButton {
    
    var buttonStyle: style = .imageWhite
    var image: UIImage? = nil
    var title: String? = nil
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        _init()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        _init()
    }
    
    func changeStyle(buttonStyle: style) {
        self.buttonStyle = buttonStyle
        _init()
    }
    
    func changeImage(image: UIImage?) {
        self.image = image
        _init()
    }
    
    func changeTitle(title: String?) {
        self.title = title
        _init()
    }
    
    private func _init() {
        switch buttonStyle {
        case .imageWhite:
            super.tintColor = .white
            super.backgroundColor = .mainBlue
            if let image = image {
                super.setImage(image, for: .normal)
            }
        case .titleBlue:
            super.tintColor = .mainBlue
            super.backgroundColor = .white
            if let title = title {
                super.setTitle(title, for: .normal)
                super.setTitleColor(.mainBlue, for: .normal)
                super.titleLabel?.adjustsFontSizeToFitWidth = true
                
            }
        case .onlyTitle:
            super.tintColor = .white
            super.backgroundColor = .mainBlue
            if let title = title {
                super.setTitle(title, for: .normal)
                super.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
                super.setTitleColor(.white, for: .normal)
                super.titleLabel?.adjustsFontSizeToFitWidth = true
                
            }
        }
        
    }
    
   
}

extension ActionButton {
    enum style {
        case imageWhite
        case titleBlue
        case onlyTitle
    }
}
