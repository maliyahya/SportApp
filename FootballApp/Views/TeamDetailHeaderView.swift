//
//  TableHeaderView.swift
//  FootballApp
//
//  Created by Muhammet Ali Yahyaoğlu on 20.01.2024.
//

import Foundation
import UIKit



class TeamDetailHeaderView: UIView {
    
    let teamLogo: UIImageView = {
        let teamLogo = UIImageView()
        teamLogo.translatesAutoresizingMaskIntoConstraints = false
        teamLogo.layer.borderWidth = 2
        teamLogo.layer.cornerRadius = 10
        return teamLogo
    }()
    
    
   let countryLogo: UIImageView = {
        let countryLogo = UIImageView()
        countryLogo.translatesAutoresizingMaskIntoConstraints = false
        return countryLogo
    }()
    let coachInfosLabel:UILabel={
       let label=UILabel()
        label.text="Coach İnfos"
        label.translatesAutoresizingMaskIntoConstraints=false
        label.font = .systemFont(ofSize: 15, weight: .black)
        return label
    }()
    let coachNameLabel:UILabel={
       let label=UILabel()
        label.translatesAutoresizingMaskIntoConstraints=false
        label.font = .systemFont(ofSize: 14, weight: .bold)
        return label
    }()
  
    let coachNationality:UILabel={
       let label=UILabel()
        label.translatesAutoresizingMaskIntoConstraints=false
        label.font = .systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    let coachContractLabel:UILabel={
       let label=UILabel()
        label.translatesAutoresizingMaskIntoConstraints=false
        label.font = .systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    let playerDetailHeaderLabel:UILabel={
       let label=UILabel()
        label.text="Player Name                           Position                        Nationality "
        label.translatesAutoresizingMaskIntoConstraints=false
        label.font = .systemFont(ofSize: 12, weight: .black)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(teamLogo)
        addSubview(coachInfosLabel)
        addSubview(coachNameLabel)
        addSubview(coachContractLabel)
        addSubview(coachNationality)
        addSubview(playerDetailHeaderLabel)
        configureConstraints()
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            teamLogo.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            teamLogo.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 5),
        
            coachInfosLabel.topAnchor.constraint(equalTo: topAnchor,constant: 15),
            coachInfosLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 260),
            
            coachNameLabel.topAnchor.constraint(equalTo: coachInfosLabel.bottomAnchor, constant: 20),
            coachNameLabel.leadingAnchor.constraint(equalTo: teamLogo.trailingAnchor,constant: 15),
            
            
            coachNationality.topAnchor.constraint(equalTo: coachNameLabel.bottomAnchor,constant: 10),
            coachNationality.leadingAnchor.constraint(equalTo: coachNameLabel.leadingAnchor),
            
            coachContractLabel.topAnchor.constraint(equalTo: coachNationality.bottomAnchor, constant: 10),
            coachContractLabel.leadingAnchor.constraint(equalTo: coachNameLabel.leadingAnchor),
            
            playerDetailHeaderLabel.topAnchor.constraint(equalTo: teamLogo.bottomAnchor,constant: 10),
            
            playerDetailHeaderLabel.bottomAnchor.constraint(equalTo: bottomAnchor,constant: 10),
            playerDetailHeaderLabel.leadingAnchor.constraint(equalTo: leadingAnchor)
            
            
            
            
            
            
          
            
            
            
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


