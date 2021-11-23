//
//  FeedViewController.swift
//  iOS-MVC-Architecture
//
//  Created by Pavel Palancica on 11/23/21.
//

import UIKit

class FeedViewController: UIViewController {
    
    private lazy var feedCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        layout.itemSize = CGSize(width: 1, height: 1) // The actual size will be configured later
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.collectionViewLayout = layout
        collectionView.backgroundColor = .lightGray
        collectionView.register(FeedCell.self, forCellWithReuseIdentifier: FeedCell.identifier)
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
        configureConstraints()
    }

    func setupUI() {
        view.backgroundColor = .lightGray
        let feedCellNib = UINib(nibName: FeedCell.identifier, bundle: nil)
        feedCollectionView.register(feedCellNib, forCellWithReuseIdentifier: FeedCell.identifier)
        feedCollectionView.dataSource = self
        feedCollectionView.delegate = self
        feedCollectionView.frame = view.frame
        view.addSubview(feedCollectionView)
    }
    
    func configureConstraints() {
        feedCollectionView.translatesAutoresizingMaskIntoConstraints = false
        feedCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        feedCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        feedCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        feedCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
}

extension FeedViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let feedCell = collectionView.dequeueReusableCell(withReuseIdentifier: FeedCell.identifier, for: indexPath) as! FeedCell
        return feedCell
    }
}

extension FeedViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        // ...
    }
}

extension FeedViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 200)
    }
}
