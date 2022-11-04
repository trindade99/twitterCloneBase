//
//  ProfileFilterCell.swift
//  twitterClone
//
//  Created by Lopes, Victor Trindade on 04/11/2022.
//

import UIKit

class ProfileFilterCell: UICollectionViewCell {
//    MARK: - Properties
    
    private var option: ProfileFilterOptions? {
        didSet {
            titleLabel.text = option?.description
        }
    }

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
        
    override var isSelected: Bool {
        didSet {
            titleLabel.font = isSelected ? UIFont.systemFont(ofSize: 16) : UIFont.systemFont(ofSize: 14)
            titleLabel.textColor = isSelected ? .mainBlue : .lightGray
        }
    }
//    MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(titleLabel)
        titleLabel.center(inView: self)
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//    MARK: - Helpers
    func setOption(option: ProfileFilterOptions?) {
        guard let option = option else { return }
        self.option = option
    }
}

