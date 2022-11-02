//
//  ActionButton.swift
//  twitterClone
//
//  Created by Lopes, Victor Trindade on 26/10/2022.
//

import Foundation
import UIKit

class ActionButton: UIButton {
    
    lazy var buttonStyle: style = .imageWhite
    lazy var image: UIImage? = nil
    lazy var title: String? = nil
    lazy var colorBG: UIColor? = nil
    lazy var colorTitle: UIColor? = nil
    
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
    
    func changeColors(bgColor: UIColor?, textColor: UIColor?) {
        if let bgColor = bgColor {
            self.colorBG = bgColor
        }
        if let textColor = textColor {
            self.colorTitle = textColor
        }

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
        case .titleColor:
            if let colorBG = colorBG {
                super.backgroundColor = colorBG
            }
            if let title = title {
                super.setTitle(title, for: .normal)
                if let colorTitle = colorTitle {
                    super.tintColor = colorTitle
                    super.setTitleColor(colorTitle, for: .normal)
                }
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
        case .profileImage:
            if let image = image {
                super.setImage(image, for: .normal)
                super.imageView?.contentMode = .scaleAspectFill
                super.imageView?.clipsToBounds = true
            }
            super.tintColor = .white
            super.backgroundColor = .mainBlue
            super.layoutIfNeeded()
            super.layer.cornerRadius = super.frame.size.height/2
            super.layer.masksToBounds = true
        }
        
    }
    
   
}

extension ActionButton {
    enum style {
        case imageWhite
        case titleColor
        case onlyTitle
        case profileImage
    }
}
