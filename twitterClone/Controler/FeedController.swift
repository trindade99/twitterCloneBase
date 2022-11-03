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
    
    private var tweets = [Tweet]() {
        didSet{
            collectionView.reloadData()
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
            self.tweets = tweets
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

//  MARK: - UICollectionViewDelegate/DataSource

extension FeedController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tweets.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! TweetCell
        
        cell.delegate = self
        cell.tweet = tweets[indexPath.row]
        
        return cell
    }
}


extension FeedController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 120)
    }
}

//  MARK: - Delegates

extension FeedController: TweetCellDelegate {
    func handleProfileImageTapped(_ cell: TweetCell) {
//        cell.tweet?.user
        let vc = ProfileController(collectionViewLayout: UICollectionViewFlowLayout())
        navigationController?.pushViewController(vc, animated: true)
    }
}
