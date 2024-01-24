//
//  PlayerInfoTableViewCell.swift
//  FootballApp
//
//  Created by Muhammet Ali Yahyaoğlu on 23.01.2024.
//

import UIKit

class PlayerInfoTableViewCell: UITableViewCell {

    static let identifier = "PlayerInfoTableViewCell"
    
    private let playerNameLabel:UILabel={
       let playerName=UILabel()
        playerName.textColor = .label
        playerName.translatesAutoresizingMaskIntoConstraints=false
        playerName.font = .systemFont(ofSize: 12, weight: .medium)
        playerName.numberOfLines=2
        return playerName
    }()
    private let playerPositionLabel:UILabel={
       let playerName=UILabel()
        playerName.textColor = .label
        playerName.translatesAutoresizingMaskIntoConstraints=false
        playerName.font = .systemFont(ofSize: 12, weight: .medium)
        return playerName
    }()
    private let playerNationalityLabel:UILabel={
       let playerName=UILabel()
        playerName.textColor = .label
        playerName.translatesAutoresizingMaskIntoConstraints=false
        playerName.font = .systemFont(ofSize: 12, weight: .medium)
        return playerName
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(playerNameLabel)
        contentView.addSubview(playerPositionLabel)
        contentView.addSubview(playerNationalityLabel)
        configureConstraints()
    }
    
    func configureCells(playerName:String,playerPosition:String,playerNationality:String){
        playerNameLabel.text=playerName
        playerPositionLabel.text=playerPosition
        playerNationalityLabel.text=playerNationality
        
    }
    private func configureConstraints(){
        NSLayoutConstraint.activate([
            playerNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 2),
            playerNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            playerNameLabel.widthAnchor.constraint(equalToConstant: 150),
            
            playerPositionLabel.leadingAnchor.constraint(equalTo: playerNameLabel.trailingAnchor, constant: 2),
            playerPositionLabel.topAnchor.constraint(equalTo: playerNameLabel.topAnchor),
            playerPositionLabel.widthAnchor.constraint(equalToConstant: 120),
            
            playerNationalityLabel.leadingAnchor.constraint(equalTo: playerPositionLabel.trailingAnchor,constant: 2),
            playerNationalityLabel.topAnchor.constraint(equalTo: playerNameLabel.topAnchor),
            
            
        
            
            
            
            
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
