//
//  ExplorerControler.swift
//  twitterClone
//
//  Created by Lopes, Victor Trindade on 26/10/2022.
//

import UIKit

private let reusableIdentifier = "UserCell"

class ExploreController: UITableViewController {
//    MARK: - Properties
        
    private var users = [User]() {
        didSet{
            tableView.reloadData()
        }
    }
        
//    MARK: - Lifecycle
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        fetchUsers()
    }
        
    
//    MARK: - Api
    func fetchUsers() {
        UserService.shared.fetchUsers { users in
            self.users = users
        }
    }
//    MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .white
        
        navigationItem.title = "Explore"
        
        tableView.register(UserCell.self, forCellReuseIdentifier: reusableIdentifier)
        tableView.rowHeight = 60
        tableView.separatorStyle = .none
        
    }
}


extension ExploreController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reusableIdentifier, for: indexPath) as! UserCell
        cell.user = users[indexPath.row]
        return cell
    }
}
