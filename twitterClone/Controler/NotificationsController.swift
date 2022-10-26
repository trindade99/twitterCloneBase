//
//  NotificationsController.swift
//  twitterClone
//
//  Created by Lopes, Victor Trindade on 26/10/2022.
//

import UIKit

class NotificationsController: UIViewController {
//    MARK: - Properties
        
        
//    MARK: - Lifecycle
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
        
//    MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .white
        
        navigationItem.title = "Notifications"
        
    }
}
