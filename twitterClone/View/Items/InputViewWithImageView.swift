//
//  InputViewWithImageView.swift
//  twitterClone
//
//  Created by Lopes, Victor Trindade on 26/10/2022.
//

import Foundation
import UIKit

class InputViewWithImageView: UIView {
    
    var image: UIImage? = nil
    var textField: UITextField? = nil
    var divider: Bool = false
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        _init()
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        _init()
    }
    
    func configure() {
        _init()
    }
    
    private func _init() {
        if let image = image , let textField = textField {
            let imageView = CustomImageView(image: image)
            super.addSubview(imageView)
            imageView.tintColor = .white
            imageView.anchor(left: super.safeAreaLayoutGuide.leftAnchor, width: 32, height: 32)
            
            super.addSubview(textField)
            textField.textColor = .white
            textField.attributedPlaceholder = NSAttributedString(string: textField.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
            textField.anchor(left: imageView.rightAnchor, bottom: imageView.bottomAnchor ,right: super.superview?.safeAreaLayoutGuide.rightAnchor, paddingLeft: 8, height: 32)
            
            if divider {
                let dividerView = UIView()
                super.addSubview(dividerView)
                dividerView.backgroundColor = .white
                dividerView.anchor(top: imageView.bottomAnchor ,left: imageView.leftAnchor, right: super.superview?.safeAreaLayoutGuide.rightAnchor, paddingTop: 8, height: 1)
            }
        }
        

    }
    
    func inputViewValidator() -> String? {
        if let inputViewText = self.textField?.text, inputViewText != "" {
            return inputViewText
        }else {
            self.textField?.attributedPlaceholder = NSAttributedString(string: self.textField?.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
            return nil
        }
    }
}
