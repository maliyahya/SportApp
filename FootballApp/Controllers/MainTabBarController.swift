//
//  MainTabBarController.swift
//  FootballApp
//
//  Created by Muhammet Ali Yahyaoğlu on 20.01.2024.
//

import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        createTabBar()
        view.backgroundColor = .systemBackground
    }
    func createTabBar(){
          let vc1=UINavigationController(rootViewController: StandingsSelectionViewController())
          let vc2=UINavigationController(rootViewController: AllTeamsViewController())
          let vc3=UINavigationController(rootViewController: LiveMatchesViewController())
          vc1.tabBarItem.image=UIImage(systemName: "football")
          vc1.tabBarItem.selectedImage=UIImage(systemName: "football.fill")
          vc2.tabBarItem.image=UIImage(systemName: "sportscourt")
        vc2.tabBarItem.selectedImage=UIImage(systemName: "sportscourt.fill")
          vc3.tabBarItem.image=UIImage(systemName: "tablecells")
          vc3.tabBarItem.selectedImage=UIImage(systemName: "tablecells.fill")
          setViewControllers([vc1,vc2,vc3], animated: true)
          


      }

}
