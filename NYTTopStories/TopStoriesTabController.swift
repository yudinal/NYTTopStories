//
//  TopStoriesTabController.swift
//  NYTTopStories
//
//  Created by Lilia Yudina on 2/6/20.
//  Copyright © 2020 Lilia Yudina. All rights reserved.
//

import UIKit

class TopStoriesTabController: UITabBarController {

    
    private lazy var newsFeedVC: NewsFeedViewController = {
       let viewController = NewsFeedViewController()
        viewController.tabBarItem = UITabBarItem(title: "News Feed", image: UIImage(named: "eyeglasses"), tag: 0)
        return viewController
    }()
    
    private lazy var savedArticlesVC: SavedArticleViewController = {
         let viewController = SavedArticleViewController()
          viewController.tabBarItem = UITabBarItem(title: "Saved Articles", image: UIImage(named: "folder"), tag: 1)
          return viewController
      }()
    
    private lazy var settingsVC: SettingsViewController = {
         let viewController = SettingsViewController()
          viewController.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(named: "gear"), tag: 2)
          return viewController
      }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .yellow
        
        viewControllers = [newsFeedVC, savedArticlesVC, settingsVC]
    }
    


}
