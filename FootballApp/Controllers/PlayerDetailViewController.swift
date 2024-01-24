//
//  PlayerDetailViewController.swift
//  FootballApp
//
//  Created by Muhammet Ali Yahyaoğlu on 23.01.2024.
//

import UIKit

class PlayerDetailViewController: UIViewController {

    var playerID:Int
    
    init(playerID: Int) {
        self.playerID = playerID
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        print(playerID)

    }
    

 
}
