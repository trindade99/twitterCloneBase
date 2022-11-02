//
//  FeedControler.swift
//  twitterClone
//
//  Created by Lopes, Victor Trindade on 26/10/2022.
//

import UIKit
import EzImageLoader

private let reuseIdentifier = "TweetCell"

class FeedController: UICollectionViewController {
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
        fetchTweets()
        configureHeader()
    }
        
//    MARK: - API
    func fetchTweets() {
        TweetService.shared.fetchTweets { tweets in
            print("DEBUG: Tweets are \(tweets)")
        }
    }
    
    
//    MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .white
        
        collectionView.register(TweetCell.self, forCellWithReuseIdentifier: reuseIdentifier)
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

extension FeedController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        return cell
    }
}


extension FeedController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 120)
    }
}

