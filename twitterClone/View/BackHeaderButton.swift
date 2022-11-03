//
//  BackHeaderButton.swift
//  twitterClone
//
//  Created by Lopes, Victor Trindade on 03/11/2022.
//

import UIKit

class BackHeaderButton: UIButton {
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        _init()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        _init()
    }
    
    private func _init() {
        self.setImage(UIImage(named: "baseline_arrow_back_white_24dp")?.withRenderingMode(.alwaysTemplate), for: .normal)
        self.tintColor = .white
    }
}
