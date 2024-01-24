//
//  TableViewController.swift
//  FootballApp
//
//  Created by Muhammet Ali Yahyaoğlu on 20.01.2024.
//

import UIKit
import Combine

class StandingsTableViewController: UIViewController {
    var leagueName:String
    init(leagueName: String) {
           self.leagueName = leagueName
           super.init(nibName: nil, bundle: nil)
       }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    var subscriptions:Set<AnyCancellable> = []
    private let viewModel=StandingsTableViewViewModel()
   
    private let headLabel:UILabel={
        let label=UILabel()
        label.text="Sıra      Takım                               O    G    B    M      A     Y    Av    P"
        label.translatesAutoresizingMaskIntoConstraints=false
        label.font = .systemFont(ofSize: 13)
        label.textColor = . label
        return label
    }()
    private let standingsTable:UITableView={
       let table=UITableView()
        table.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        table.translatesAutoresizingMaskIntoConstraints=false
        return table
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.leftBarButtonItem=UIBarButtonItem(title: "Cancel",style:.plain, target: self, action: #selector(didTapToCancel))
        view.addSubview(standingsTable)
        view.addSubview(headLabel)
        viewModel.fetchStandingsData(leagueName: leagueName)
        standingsTable.delegate=self
        standingsTable.dataSource=self
        configureConstraints()
        bindViews()
    }
    private func bindViews(){
        viewModel.$standingsTableModel.sink { [weak self] _ in
            DispatchQueue.main.async{
                self?.standingsTable.reloadData()
            }
        }.store(in: &subscriptions)}
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        standingsTable.reloadData()
    }
    @objc private func didTapToCancel(){
        dismiss(animated: true)
    }
    
    private func configureConstraints(){
        NSLayoutConstraint.activate([
            
            headLabel.topAnchor.constraint(equalTo: view.topAnchor,constant: 120),
            headLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),

            
            standingsTable.topAnchor.constraint(equalTo: headLabel.bottomAnchor),
            standingsTable.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            standingsTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            standingsTable.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
 
}


extension StandingsTableViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.standingsTableModel?.standings?.first?.table?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier,for: indexPath) as?
                      TableViewCell else{
                  return UITableViewCell()
              }
        let  team=viewModel.standingsTableModel?.standings?.first?.table?[indexPath.row]
        cell.configureCell(
            teamName: team?.team?.name ?? "null",
            position: "\(team?.position ?? 0)",
            playedMatches:  "\(team?.playedGames ?? 0)",
            won:  "\(team?.won ?? 0)",
            lose:  "\(team?.lost ?? 0)",
            draw:  "\(team?.draw ?? 0)",
            points:  "\(team?.points ?? 0)",
            goalsFor:  "\(team?.goalsFor ?? 0)",
            goalsAgainst:  "\(team?.goalsAgainst ?? 0)",
            goalDifference:  "\(team?.goalDifference ?? 0)")
              return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = TeamDetailViewController(teamID: viewModel.standingsTableModel?.standings?.first?.table?[indexPath.row].team?.id ?? 0)
            navigationController?.pushViewController(vc, animated: true)
        }
    }
   
    
    

