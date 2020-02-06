//
//  NewsFeedViewController.swift
//  NYTTopStories
//
//  Created by Lilia Yudina on 2/6/20.
//  Copyright © 2020 Lilia Yudina. All rights reserved.
//

import UIKit

class NewsFeedViewController: UIViewController {

    private let newsFeedView = NewsFeedView()
    
    override func loadView() {
        view = newsFeedView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground // white when dark mode is off, black when dark mode is on
        
        // setting up collection datasource and delegate
        newsFeedView.collectionView.dataSource = self
        newsFeedView.collectionView.delegate = self
        
        // register a collection view cell
        newsFeedView.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "acticleCell")
    }

}


extension NewsFeedViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "acticleCell", for: indexPath)
        cell.backgroundColor = .white
        return cell
    }
    
}

extension NewsFeedViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let maxSize: CGSize = UIScreen.main.bounds.size
        let itemWidth: CGFloat = maxSize.width
        let itemHeight: CGFloat = maxSize.height * 0.30
        return CGSize(width: itemWidth, height: itemHeight)
    }
}
