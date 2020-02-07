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
    
    var articles = [Article]() {
        didSet {
            DispatchQueue.main.async {
                self.newsFeedView.collectionView.reloadData()
            }
        }
    }
    
    override func loadView() {
        view = newsFeedView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchSories()
        view.backgroundColor = .systemBackground // white when dark mode is off, black when dark mode is on
        
        // setting up collection datasource and delegate
        newsFeedView.collectionView.dataSource = self
        newsFeedView.collectionView.delegate = self
        
        // register a collection view cell
        newsFeedView.collectionView.register(NewsCell.self, forCellWithReuseIdentifier: "acticleCell")
        
    }
    
    private func fetchSories(for search: String = "Technology") {
        NYTTopStoriesAPIClient.fetchTopStories(for: search) { (result) in
            switch result {
            case .failure(let appError):
                print("App Erro: \(appError)")
            case .success(let articles):
                print(articles.count)
                self.articles = articles
            }
        }
    }

}


extension NewsFeedViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articles.count
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
        let itemHeight: CGFloat = maxSize.height * 0.20
        return CGSize(width: itemWidth, height: itemHeight)
    }
}
