//
//  MainTabBarController.swift
//  twitterClone
//
//  Created by Lopes, Victor Trindade on 26/10/2022.
//

import UIKit

class MainTabBarController: UITabBarController {
    
//    MARK: - Properties
    
    let actionButton = ActionButton()
    
    
//    MARK: - Lifecycle
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
        configureTabBar()
        configureViewControlers()
    }
    
//    MARK: - Selectors
    
    @objc func actionButtonTapped() {
        print(123)
    }
    
//    MARK: - Helpers
    
    func configureUI() {
        view.addSubview(actionButton)
        actionButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingBottom: 64, paddingRight: 16, width: 56, height: 56)
        actionButton.layer.cornerRadius = 56/2
        actionButton.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
    }
    
    func configureTabBar() {
        let standardAppearance = UITabBarAppearance()
        standardAppearance.backgroundColor = .white
        tabBar.scrollEdgeAppearance = standardAppearance
        tabBar.isTranslucent = false
    }
    
    func configureViewControlers() {
        
        let feed = FeedController()
        let navFeed = templateNavigationController(image: UIImage(named: "home_unselected"), rootViewController: feed)
        
        let explore = ExploreController()
        let navExplore = templateNavigationController(image: UIImage(named: "search_unselected"), rootViewController: explore)
        
        let notifications = NotificationsController()
        let navNotifications = templateNavigationController(image: UIImage(named: "like_unselected"), rootViewController: notifications)

        let conversations = ConversationsController()
        let navConversations = templateNavigationController(image: UIImage(named: "ic_mail_outline_white_2x-1"), rootViewController: conversations)
        
        viewControllers = [navFeed, navExplore, navNotifications, navConversations]
    }
    
    func templateNavigationController(image: UIImage?, rootViewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.navigationBar.isTranslucent = false
        nav.tabBarItem.image = image
        
        let standardAppearance = UINavigationBarAppearance()
        standardAppearance.backgroundColor = .white
        nav.navigationBar.scrollEdgeAppearance = standardAppearance
        
        return nav
    }

}
