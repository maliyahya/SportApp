//
//  TeamsTableViewCell.swift
//  FootballApp
//
//  Created by Muhammet Ali Yahyaoğlu on 23.01.2024.
//

import UIKit

class TeamsTableViewCell: UITableViewCell {
    
    private let teamLogo:UIImageView={
        let teamLogo=UIImageView()
        teamLogo.translatesAutoresizingMaskIntoConstraints=false
        teamLogo.image=UIImage(systemName: "person")
        teamLogo.layer.borderWidth = 2
        teamLogo.layer.cornerRadius=10
        return teamLogo
    }()
    private let teamNameLabel:UILabel={
       let label=UILabel()
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints=false
        label.textColor = .label
        return label
    }()
    private let shortTeamNameLabel:UILabel={
        let label=UILabel()
        label.font = .systemFont(ofSize: 10,weight: .light)
        label.translatesAutoresizingMaskIntoConstraints=false
        label.textColor = .secondaryLabel
        return label
    }()
    private let stadiumLabel:UILabel={
       let label=UILabel()
        label.font = .systemFont(ofSize: 13, weight: .bold)
        label.text="Stadium:"
        label.translatesAutoresizingMaskIntoConstraints=false
        label.textColor = .label
        return label
    }()
    private let colorsLabel:UILabel={
       let label=UILabel()
        label.font = .systemFont(ofSize: 13, weight: .bold)
        label.text="Colors:"
        label.translatesAutoresizingMaskIntoConstraints=false
        label.textColor = .label
        return label
    }()
    private let createdYearLabel:UILabel={
       let label=UILabel()
        label.font = .systemFont(ofSize: 13, weight: .bold)
        label.text="Created at:"
        label.translatesAutoresizingMaskIntoConstraints=false
        label.textColor = .label
        return label
    }()
    private let stadiumNameLabel:UILabel={
        let label=UILabel()
        label.font = .systemFont(ofSize: 13, weight: .medium)
         label.translatesAutoresizingMaskIntoConstraints=false
         label.textColor = .label
         return label
    }()
    private let colorsNameLabel:UILabel={
        let label=UILabel()
        label.font = .systemFont(ofSize: 13, weight: .medium)
         label.translatesAutoresizingMaskIntoConstraints=false
         label.textColor = .label
         return label
    }()
    private let createdYearNameLabel:UILabel={
        let label=UILabel()
        label.font = .systemFont(ofSize: 13, weight: .medium)
         label.translatesAutoresizingMaskIntoConstraints=false
         label.textColor = .label
         return label
    }()
    
  



    

    static let identifier = "TeamsTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(teamLogo)
        contentView.addSubview(teamNameLabel)
        contentView.addSubview(shortTeamNameLabel)
        contentView.addSubview(stadiumLabel)
        contentView.addSubview(colorsLabel)
        contentView.addSubview(createdYearLabel)
        contentView.addSubview(stadiumNameLabel)
        contentView.addSubview(colorsNameLabel)
        contentView.addSubview(createdYearNameLabel)
        configureConstraints()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configureCells(teamName:String,shortTeamName:String,stadiumName:String,colorsName:String,createdYear:Int,photoUrl: String) {
        teamNameLabel.text=teamName
        shortTeamNameLabel.text=shortTeamName
        stadiumNameLabel.text=stadiumName
        colorsNameLabel.text=colorsName
        createdYearNameLabel.text="\(createdYear)"
        if let imageURL = URL(string: photoUrl) {
            URLSession.shared.dataTask(with: imageURL) { (data, response, error) in
                if let error = error {
                    print("Error downloading image: \(error.localizedDescription)")
                    return
                }
                guard let imageData = data else {
                    print("No data received.")
                    return
                }
                if let downloadedImage = UIImage(data: imageData) {
                    DispatchQueue.main.async {
                        self.teamLogo.image = downloadedImage
                    }
                }
            }.resume()
        }
    }

    
    private func configureConstraints(){
        NSLayoutConstraint.activate([
            teamLogo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            teamLogo.heightAnchor.constraint(equalToConstant: 100),
            teamLogo.widthAnchor.constraint(equalToConstant: 100),
            teamLogo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            
            teamNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            teamNameLabel.centerXAnchor.constraint(equalTo: teamLogo.trailingAnchor,constant: 130),
            
            shortTeamNameLabel.topAnchor.constraint(equalTo: teamNameLabel.bottomAnchor, constant: 5),
            shortTeamNameLabel.centerXAnchor.constraint(equalTo: teamLogo.trailingAnchor,constant: 130),
            
            stadiumLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 65),
            stadiumLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 140),
            
            colorsLabel.topAnchor.constraint(equalTo: stadiumLabel.bottomAnchor,constant: 10),
            colorsLabel.leadingAnchor.constraint(equalTo: stadiumLabel.leadingAnchor),
            
            createdYearLabel.topAnchor.constraint(equalTo: colorsLabel.bottomAnchor,constant: 10),
            createdYearLabel.leadingAnchor.constraint(equalTo: stadiumLabel.leadingAnchor),
            
            stadiumNameLabel.topAnchor.constraint(equalTo: stadiumLabel.topAnchor),
            stadiumNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 220),
            
            colorsNameLabel.topAnchor.constraint(equalTo: colorsLabel.topAnchor),
            colorsNameLabel.leadingAnchor.constraint(equalTo:stadiumNameLabel.leadingAnchor),
            
            
            createdYearNameLabel.topAnchor.constraint(equalTo: createdYearLabel.topAnchor),
            createdYearNameLabel.leadingAnchor.constraint(equalTo:stadiumNameLabel.leadingAnchor),
            
            
            
            
            
        ])
    }
   

}
