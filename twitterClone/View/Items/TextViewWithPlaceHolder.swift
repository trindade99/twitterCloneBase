//
//  TextViewWithPlaceHolder.swift
//  twitterClone
//
//  Created by Lopes, Victor Trindade on 28/10/2022.
//

import Foundation
import UIKit

class TextViewWithPlaceHolder: UITextView {
    
//    MARK: - Properties
    var labelText: String?
    
    let placeHolderLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .darkGray
        return label
    }()
    

    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        _init()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        _init()
    }
    
    func configureText(labelText: String) {
        self.labelText = labelText
        _init()
    }
    
    func _init() {
        configureUI()
        super.addSubview(placeHolderLabel)
        bringSubviewToFront(placeHolderLabel)
        placeHolderLabel.text = labelText
        placeHolderLabel.anchor(top: topAnchor, left: leftAnchor,
                                right: rightAnchor, paddingTop: 8, paddingLeft: 4)
        
        NotificationCenter.default.addObserver(self, selector: #selector(handlerTextInput), name: UITextView.textDidChangeNotification, object: nil)
    }
//    MARK: - Helpers
    
    @objc func handlerTextInput() {
        placeHolderLabel.isHidden = !text.isEmpty
    }
    
    
    private func configureUI() {
        backgroundColor = .white
        font = UIFont.systemFont(ofSize: 16)
        isScrollEnabled = false
        heightAnchor.constraint(equalToConstant: 300).isActive = true
    }
}
