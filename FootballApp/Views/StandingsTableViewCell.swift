//
//  TableViewCell.swift
//  FootballApp
//
//  Created by Muhammet Ali Yahyaoğlu on 20.01.2022.
//

import UIKit

class TableViewCell: UITableViewCell {

    static let identifier="TableViewCell"
    private let label:UILabel={
        let label=UILabel()
        label.translatesAutoresizingMaskIntoConstraints=false
        label.font = .systemFont(ofSize: 11,weight: .medium)
        return label
    }()
    private let siralabel:UILabel={
        let label=UILabel()
        label.font = .systemFont(ofSize: 11,weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints=false
        return label
    }()
    private let gameCount:UILabel={
        let label=UILabel()
        label.font = .systemFont(ofSize: 11,weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints=false
        return label
    }()
    private let winCount:UILabel={
        let label=UILabel()
        label.font = .systemFont(ofSize: 11,weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints=false
        return label
    }()
    private let drawCount:UILabel={
        let label=UILabel()
        label.font = .systemFont(ofSize: 11,weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints=false
        return label
    }()
    private let loseCount:UILabel={
        let label=UILabel()
        label.font = .systemFont(ofSize: 11,weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints=false
        return label
    }()
    private let goalCount:UILabel={
        let label=UILabel()
        label.font = .systemFont(ofSize: 11,weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints=false
        return label
    }()
    private let goalCount2:UILabel={
        let label=UILabel()
        label.font = .systemFont(ofSize: 11,weight: .medium)

        label.translatesAutoresizingMaskIntoConstraints=false
        return label
    }()
    private let averageCount:UILabel={
        let label=UILabel()  
        label.font = .systemFont(ofSize: 11,weight: .medium)

        label.translatesAutoresizingMaskIntoConstraints=false
        return label
    }()
    private let pointsLabel:UILabel={
        let label=UILabel()
        label.font = .systemFont(ofSize: 11,weight: .medium)

        label.translatesAutoresizingMaskIntoConstraints=false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       contentView.addSubview(label)
        contentView.addSubview(siralabel)
        contentView.addSubview(gameCount)
        contentView.addSubview(winCount)
        contentView.addSubview(loseCount)
        contentView.addSubview(drawCount)
        contentView.addSubview(goalCount)
        contentView.addSubview(goalCount2)
        contentView.addSubview(averageCount)
        contentView.addSubview(pointsLabel)
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configureCell(teamName:String,position:String,playedMatches:String,won:String,lose:String,draw:String,points:String,goalsFor:String,goalsAgainst:String,goalDifference:String){
        label.text=teamName
        siralabel.text=position
        gameCount.text=playedMatches
        winCount.text=won
        loseCount.text=lose
        drawCount.text=draw
        pointsLabel.text=points
        goalCount.text=goalsFor
        goalCount2.text=goalsAgainst
        averageCount.text=goalDifference
    }
    
    private func configureConstraints(){
        NSLayoutConstraint.activate([
            
            siralabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            siralabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 10),
            
            label.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 20),
            label.leadingAnchor.constraint(equalTo: siralabel.trailingAnchor,constant: 20),
            
            
            gameCount.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 20),
            gameCount.leadingAnchor.constraint(equalTo: centerXAnchor,constant: -10),
            gameCount.widthAnchor.constraint(equalToConstant: 20),
            
            winCount.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 20),
            winCount.leadingAnchor.constraint(equalTo: gameCount.trailingAnchor,constant: 2),
            winCount.widthAnchor.constraint(equalToConstant: 25),

            
            drawCount.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 20),
            drawCount.leadingAnchor.constraint(equalTo: winCount.trailingAnchor,constant: 2),
            drawCount.widthAnchor.constraint(equalToConstant: 25),

            loseCount.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 20),
            loseCount.leadingAnchor.constraint(equalTo: drawCount.trailingAnchor,constant: 2),
            loseCount.widthAnchor.constraint(equalToConstant: 25),

            averageCount.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 20),
            averageCount.leadingAnchor	.constraint(equalTo: loseCount.trailingAnchor,constant: 2),
            averageCount.widthAnchor.constraint(equalToConstant: 30),

            goalCount.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 20),
            goalCount.leadingAnchor.constraint(equalTo: averageCount.trailingAnchor,constant: 2),
            goalCount.widthAnchor.constraint(equalToConstant: 25),

            goalCount2.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 20),
            goalCount2.leadingAnchor.constraint(equalTo: goalCount.trailingAnchor, constant: 2),
            goalCount2.widthAnchor.constraint(equalToConstant: 25),

            pointsLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 20),
            pointsLabel.leadingAnchor.constraint(equalTo: goalCount2.trailingAnchor, constant: 2),
            pointsLabel.widthAnchor.constraint(equalToConstant: 25),


            
            
        
        
        ])
    }
    
}

