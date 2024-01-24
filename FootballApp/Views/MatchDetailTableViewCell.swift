//
//  MatchDetailTableViewCell.swift
//  FootballApp
//
//  Created by Muhammet Ali Yahyaoğlu on 24.01.2024.
//

import UIKit
import SDWebImage


class MatchDetailTableViewCell: UITableViewCell {
    private let dateFormatter:DateFormatter={
        let dateFormatter=DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return dateFormatter
    }()
    private let homeTeamNameLabel:UILabel={
       let label=UILabel()
        label.text="Trabzonspor"
        label.translatesAutoresizingMaskIntoConstraints=false
        label.font = .systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    private let homeTeamLogo:UIImageView={
       let logo=UIImageView()
        logo.translatesAutoresizingMaskIntoConstraints=false
        logo.image=UIImage(systemName: "person")
        return logo
    }()
    private let awayTeamNameLabel:UILabel={
       let label=UILabel()
        label.text="Fenerbahçe"
        label.translatesAutoresizingMaskIntoConstraints=false
        label.font = .systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    private let awayTeamLogo:UIImageView={
       let logo=UIImageView()
        logo.translatesAutoresizingMaskIntoConstraints=false
        logo.image=UIImage(systemName: "person")
        return logo
    }()
    private let competitionLogo:UIImageView={
       let logo=UIImageView()
        logo.translatesAutoresizingMaskIntoConstraints=false
        logo.image=UIImage(systemName: "person")
        return logo
    }()
    private let competitionNameLabel:UILabel={
        let label=UILabel()
         label.text="Eredivise"
         label.translatesAutoresizingMaskIntoConstraints=false
         label.font = .systemFont(ofSize: 16, weight: .medium)
         return label
    }()
    private let homeTeamScoreLabel:UILabel={
        let label=UILabel()
         label.translatesAutoresizingMaskIntoConstraints=false
         label.font = .systemFont(ofSize: 16, weight: .medium)
         return label
    }()
    private let awayTeamScoreLabel:UILabel={
        let label=UILabel()
         label.translatesAutoresizingMaskIntoConstraints=false
         label.font = .systemFont(ofSize: 16, weight: .medium)
         return label
    }()
    private let matchTimeLabel:UILabel={
       let label=UILabel()
        label.translatesAutoresizingMaskIntoConstraints=false
        label.font = .systemFont(ofSize: 18, weight: .medium)
        return label
    }()


   static let identifier="MatchDetailTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(homeTeamNameLabel)
        contentView.addSubview(awayTeamNameLabel)
        contentView.addSubview(homeTeamLogo)
        contentView.addSubview(awayTeamLogo)
        contentView.addSubview(competitionNameLabel)
        contentView.addSubview(competitionLogo)
        contentView.addSubview(homeTeamScoreLabel)
        contentView.addSubview(awayTeamScoreLabel)
        contentView.addSubview(matchTimeLabel)
        configureConstraints()
        
    }
    func configureCells(homeTeamName:String,awayTeamName:String,homeTeamLogoURL:String,awayTeamLogoURL:String,competitionName:String,competitionLogoURL:String,homeTeamScore:Int,awayTeamScore:Int,matchTime:String){
        homeTeamLogo.sd_setImage(with: URL(string:homeTeamLogoURL))
        awayTeamLogo.sd_setImage(with: URL(string:awayTeamLogoURL))
        competitionLogo.sd_setImage(with: URL(string:competitionLogoURL))
        competitionNameLabel.text=competitionName
        homeTeamNameLabel.text=homeTeamName
        awayTeamNameLabel.text=awayTeamName
        homeTeamScoreLabel.text="\(homeTeamScore)"
        awayTeamScoreLabel.text="\(awayTeamScore)"
    
        let date = dateFormatter.date(from: matchTime)
        if let unwrappedDate = date {
            dateFormatter.dateFormat = "HH:mm"
            let formattedTime = dateFormatter.string(from: unwrappedDate)
            matchTimeLabel.text = formattedTime
        } else {
            matchTimeLabel.text = "Geçerli Tarih Bulunamadı"
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configureConstraints(){
        NSLayoutConstraint.activate([
            
            competitionNameLabel.leadingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -120),
            competitionNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            
            competitionLogo.trailingAnchor.constraint(equalTo: competitionNameLabel.leadingAnchor,constant: -5),
            competitionLogo.topAnchor.constraint(equalTo: competitionNameLabel.topAnchor),
            competitionLogo.heightAnchor.constraint(equalToConstant: 30),
            competitionLogo.widthAnchor.constraint(equalToConstant: 30),
            
            homeTeamLogo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 20),
            homeTeamLogo.topAnchor.constraint(equalTo: homeTeamNameLabel.topAnchor),
            homeTeamLogo.heightAnchor.constraint(equalToConstant: 30),
            homeTeamLogo.widthAnchor.constraint(equalToConstant: 30),
            
            homeTeamNameLabel.leadingAnchor.constraint(equalTo: homeTeamLogo.trailingAnchor,constant: 10),
            homeTeamNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 60),
            homeTeamNameLabel.widthAnchor.constraint(equalToConstant: 180),
            
            awayTeamNameLabel.leadingAnchor.constraint(equalTo: homeTeamNameLabel.leadingAnchor),
            awayTeamNameLabel.topAnchor.constraint(equalTo: homeTeamNameLabel.bottomAnchor, constant: 20),
            awayTeamNameLabel.widthAnchor.constraint(equalToConstant: 180),
            
            awayTeamLogo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 20),
            awayTeamLogo.topAnchor.constraint(equalTo: awayTeamNameLabel.topAnchor,constant: -5),
            awayTeamLogo.heightAnchor.constraint(equalToConstant: 30),
            awayTeamLogo.widthAnchor.constraint(equalToConstant: 30),
            
            homeTeamScoreLabel.leadingAnchor.constraint(equalTo: homeTeamNameLabel.trailingAnchor,constant: 5),
            homeTeamScoreLabel.topAnchor.constraint(equalTo: homeTeamNameLabel.topAnchor),
            
            awayTeamScoreLabel.leadingAnchor.constraint(equalTo: awayTeamNameLabel.trailingAnchor,constant: 5),
            awayTeamScoreLabel.topAnchor.constraint(equalTo: awayTeamNameLabel.topAnchor),
            
            matchTimeLabel.topAnchor.constraint(equalTo: homeTeamNameLabel.topAnchor,constant: 15),
            matchTimeLabel.leadingAnchor.constraint(equalTo: homeTeamNameLabel.trailingAnchor,constant: 50),
            
        
        ])
    }
    
}
