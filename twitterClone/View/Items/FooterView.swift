//
//  FooterView.swift
//  twitterClone
//
//  Created by Lopes, Victor Trindade on 27/10/2022.
//

import UIKit

class FooterView: UIView {
    
    var text: String? = nil
    var button: ActionButton? = nil
    
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
        if let text = text {
            let label = UILabel()
            
            label.text = text
            label.textColor = .white
            
            if let button = button {
                super.addSubview(label)
                super.addSubview(button)
                label.anchor(top: super.topAnchor, left: super.leftAnchor, height: 50)
                button.anchor(top: super.topAnchor, left: label.rightAnchor, paddingLeft: 5, height: 50)
                
            }else {
                super.addSubview(label)
                label.centerX(inView: super.superview!, topAnchor: super.safeAreaLayoutGuide.topAnchor)
            }
            
        }else {
            if let button = button {
                super.addSubview(button)
                button.centerX(inView: super.superview!, topAnchor: super.safeAreaLayoutGuide.topAnchor)
            }
        }
    }
}
