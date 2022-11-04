//
//  MainTabBarController.swift
//  twitterClone
//
//  Created by Lopes, Victor Trindade on 26/10/2022.
//

import UIKit
import Firebase

class MainTabBarController: UITabBarController {
    
//    MARK: - Properties
    
    var user: User? {
        didSet {
            configureUI()
            dismissOlderController()
            configureTabBar()
            configureViewControlers()
        }
    }
    let actionButton = ActionButton()
    
    
    
//    MARK: - Lifecycle
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        logUSerOut()
//        view.backgroundColor = .mainBlue
        authenticateUserAndConfigUI()
    }
//    MARK: - API
    
    func fetchUser() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        UserService.shared.fetchUser(uid: uid) { user in
            self.user = user
        }
    }
    
    func authenticateUserAndConfigUI() {
        if Auth.auth().currentUser == nil {
            print("DEBUG: User not logged in")
            DispatchQueue.main.async {
                let nav = UINavigationController(rootViewController: LoginController())
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: true, completion: nil)
            }
        }else {
            print("DEBUG: User logged in")
            fetchUser()
        }
    }
    
    func logUSerOut() {
        do {
            try Auth.auth().signOut()
        } catch let error {
            print("DEBUG: failed to sign out with error \(error.localizedDescription)")

        }
    }
    
    
//    MARK: - Selectors
    
    @objc func actionButtonTapped() {
        guard let user = self.user else { return }
        let vc = UploadTweetController(user: user)
        let nav = navigationControlerNavigationController(fullScreen: true, rootViewController: vc)
        present(nav, animated: true, completion: nil)
    }
    
//    MARK: - Helpers
    
    func dismissOlderController() {
        let scenes = UIApplication.shared.connectedScenes
        for scene in scenes {
            let windowScene = scene as? UIWindowScene
            let window = windowScene?.windows.first
            let rootVC = window?.rootViewController
            rootVC?.dismiss(animated: true)
        }
    }
    
    func configureUI() {
        view.addSubview(actionButton)
        actionButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingBottom: 64, paddingRight: 16, width: 56, height: 56)
        actionButton.layer.cornerRadius = 56/2
        actionButton.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
        actionButton.changeStyle(buttonStyle: .imageWhite)
        actionButton.changeImage(image: UIImage(named: "new_tweet"))
    }
    
    func configureTabBar() {
        let standardAppearance = UITabBarAppearance()
        standardAppearance.backgroundColor = .white
        tabBar.scrollEdgeAppearance = standardAppearance
        tabBar.isTranslucent = false
    }
    
    func configureViewControlers() {
        
        guard let user = self.user else { return }

        let feed = FeedController(user: user)
        let navFeed = feed.templateNavigationController(image: UIImage(named: "home_unselected"), rootViewController: feed)
        
        let explore = ExploreController()
        let navExplore = explore.templateNavigationController(image: UIImage(named: "search_unselected"), rootViewController: explore)
        
        let notifications = NotificationsController()
        let navNotifications = notifications.templateNavigationController(image: UIImage(named: "like_unselected"), rootViewController: notifications)

        let conversations = ConversationsController()
        let navConversations = conversations.templateNavigationController(image: UIImage(named: "ic_mail_outline_white_2x-1"), rootViewController: conversations)
        
        viewControllers = [navFeed, navExplore, navNotifications, navConversations]
    }
    
//    func templateNavigationController(image: UIImage?, rootViewController: UIViewController) -> UINavigationController {
//        let nav = UINavigationController(rootViewController: rootViewController)
//        nav.navigationBar.isTranslucent = false
//        nav.tabBarItem.image = image
//
//        let standardAppearance = UINavigationBarAppearance()
//        standardAppearance.backgroundColor = .white
//        nav.navigationBar.scrollEdgeAppearance = standardAppearance
//
//        return nav
//    }

}
