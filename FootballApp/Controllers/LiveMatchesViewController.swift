//
//  LiveMatchesViewController.swift
//  FootballApp
//
//  Created by Muhammet Ali Yahyaoğlu on 24.01.2024.
//

import UIKit
import Combine
class LiveMatchesViewController: UIViewController {
    var subcriptions:Set<AnyCancellable> = []
    let viewModel=LiveMatchesViewViewModel()
    let matchTable:UITableView={
      var table=UITableView()
        table.register(MatchDetailTableViewCell.self, forCellReuseIdentifier: MatchDetailTableViewCell.identifier)
        table.translatesAutoresizingMaskIntoConstraints=false
        return table
    }()
    let headerLabel:UILabel={
       let label=UILabel()
        label.text="Matches of the Day"
        label.translatesAutoresizingMaskIntoConstraints=false
        label.font = .systemFont(ofSize: 30, weight: .medium)
        label.textColor = .label
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(matchTable)
        view.addSubview(headerLabel)
        matchTable.delegate=self
        matchTable.dataSource=self
        configureConstraints()
        bindViews()
        viewModel.getLiveMatches()

    }
    
    private func configureConstraints(){
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: view.topAnchor,constant: 120),
            headerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            matchTable.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 30),
            matchTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            matchTable.heightAnchor.constraint(equalToConstant: 600),
            matchTable.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        
    }
    private func bindViews(){
        viewModel.$matchDetailModel.sink { _ in
            DispatchQueue.main.async{
                self.matchTable.reloadData()
            }

        }.store(in: &subcriptions)
        
    }
    
    
}
extension LiveMatchesViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.matchDetailModel.matches?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard  let cell=tableView.dequeueReusableCell(withIdentifier: MatchDetailTableViewCell.identifier, for: indexPath) as? MatchDetailTableViewCell
        else {
            return UITableViewCell()
        }
        let model=viewModel.matchDetailModel.matches?[indexPath.row]
        cell.configureCells(homeTeamName: model?.homeTeam?.name ?? "", awayTeamName: model?.awayTeam?.name ?? "", homeTeamLogoURL: model?.homeTeam?.crest ?? "", awayTeamLogoURL: model?.awayTeam?.crest ?? "",competitionName: model?.competition?.name ?? "",competitionLogoURL: model?.competition?.emblem ?? "",homeTeamScore: model?.score?.fullTime?.home ?? 0,awayTeamScore: model?.score?.fullTime?.away ?? 0,matchTime: model?.utcDate ?? "")
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
}
