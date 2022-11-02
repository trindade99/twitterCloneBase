//
//  FeedControler.swift
//  twitterClone
//
//  Created by Lopes, Victor Trindade on 26/10/2022.
//

import UIKit
import EzImageLoader

class FeedController: UIViewController {
//    MARK: - Properties
    let profileImageButtom = ActionButton()
    var user: User? {
        didSet {
            print("DEBUG: loaded user in feedController")
        }
    }
        
//    MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureHeader()
    }
        
//    MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .white

    }
    
    func configureHeader() {
        profileImageButtom.setDimensions(width: 32, height: 32)
        profileImageButtom.changeStyle(buttonStyle: .profileImage)
        profileImageButtom.changeImage(image: ImageLoader.getASync(user?.profileImageUrl ?? "")?.withRenderingMode(.alwaysOriginal))
        profileImageButtom.layer.cornerRadius = 32/2
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: profileImageButtom)
        
        let imageView = UIImageView(image: UIImage(named: "twitter_logo_blue"))
        imageView.contentMode = .scaleAspectFit
        imageView.setDimensions(width: 44, height: 44)
        navigationItem.titleView = imageView
    }

}
