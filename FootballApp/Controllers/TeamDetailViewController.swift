//
//  TeamDetailViewController.swift
//  FootballApp
//
//  Created by Muhammet Ali Yahyaoğlu on 22.01.2024.
//

import UIKit
import Combine
import SDWebImage


class TeamDetailViewController: UIViewController {
    
    let teamID:Int
    var subscriptions:Set<AnyCancellable>=[]
    private let viewModel=TeamDetailViewViewModel()
    init(teamID: Int) {
        self.teamID = teamID
        super.init(nibName: nil
                   , bundle: nil)
    }
    private let playerTable:UITableView={
       let table=UITableView()
        table.register(PlayerInfoTableViewCell.self, forCellReuseIdentifier: PlayerInfoTableViewCell.identifier)
        table.translatesAutoresizingMaskIntoConstraints=false
        return table
    }()
   
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.getTeamDetail(teamID: teamID)

    }
    private lazy var headerView=TeamDetailHeaderView(frame: CGRect(x: 0, y: 0, width: playerTable.frame.width, height: 220))

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        print(teamID)
      
        view.addSubview(playerTable)
        playerTable.delegate=self
        playerTable.dataSource=self
        playerTable.tableHeaderView = headerView
        configureConstraints()
        bindViews()
    }
    private func bindViews(){
        viewModel.$teamDetailModel.sink { _ in
                    DispatchQueue.main.async {
                        self.headerView.teamLogo.sd_setImage(with: URL(string:self.viewModel.teamDetailModel.crest ?? ""))
                        self.headerView.coachNameLabel.text=self.viewModel.teamDetailModel.coach?.name
                        self.headerView.coachNationality.text=self.viewModel.teamDetailModel.coach?.nationality
                        if let start = self.viewModel.teamDetailModel.coach?.contract?.start,
                           let until = self.viewModel.teamDetailModel.coach?.contract?.until {
                            self.headerView.coachContractLabel.text = "\(start)-\(until)"
                        } else {
                            self.headerView.coachContractLabel.text = "Contract information not available"
                        }
                        self.playerTable.reloadData()
                    }
                
            
        }.store(in: &subscriptions)
    }
    private func configureConstraints(){
        NSLayoutConstraint.activate([
           
            
            playerTable.topAnchor.constraint(equalTo: view.topAnchor),
            playerTable.widthAnchor.constraint(equalTo: view.widthAnchor),
            playerTable.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ])
    }
    
 

}
extension TeamDetailViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.teamDetailModel.squad?.count ?? 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PlayerInfoTableViewCell.identifier, for: indexPath) as?
                PlayerInfoTableViewCell else{
            return UITableViewCell()
            
        }
        cell.configureCells(playerName: viewModel.teamDetailModel.squad?[indexPath.row].name ?? "", playerPosition: viewModel.teamDetailModel.squad?[indexPath.row].position?.rawValue ?? "", playerNationality: viewModel.teamDetailModel.squad?[indexPath.row].nationality ?? "")
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = PlayerDetailViewController(playerID: viewModel.teamDetailModel.squad?[indexPath.row].id ?? 0)
            navigationController?.pushViewController(vc, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
}
