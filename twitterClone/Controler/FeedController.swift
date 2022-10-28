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
    var user: User? 
        
//    MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
        
//    MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .white
        
        profileImageButtom.setDimensions(width: 32, height: 32)
        profileImageButtom.changeStyle(buttonStyle: .profileImage)
        profileImageButtom.changeImage(image: ImageLoader.getASync(user?.profileImageUrl ?? ""))
        profileImageButtom.layer.cornerRadius = 32/2
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: profileImageButtom)
        
        
        let imageView = UIImageView(image: UIImage(named: "twitter_logo_blue"))
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
//        imageView.centerX(inView: navigationItem.titleView ?? self.view, topAnchor: navigationItem.titleView?.safeAreaLayoutGuide.topAnchor, paddingTop: 0)
        
        
    }

}
