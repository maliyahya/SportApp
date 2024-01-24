//
//  AllTeamsViewController.swift
//  FootballApp
//
//  Created by Muhammet Ali Yahyaoğlu on 23.01.2024.
//

import UIKit
import Combine

class AllTeamsViewController: UIViewController {
    var subscriptions:Set<AnyCancellable> = []
    private let viewModel=AllTeamsViewViewModel()
    private let teamTable:UITableView={
        let table=UITableView()
        table.register(TeamsTableViewCell.self, forCellReuseIdentifier: TeamsTableViewCell.identifier)
        table.translatesAutoresizingMaskIntoConstraints=false
        return table
    }()
    private let seeMoreButton:UIButton={
        let button=UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints=false
        button.setTitle("See More", for: .normal)
        button.layer.borderWidth=2
        button.layer.cornerRadius=10
        button.backgroundColor = .label
        button.clipsToBounds=true
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(teamTable)
        view.addSubview(seeMoreButton)
        seeMoreButton.addTarget(self, action: #selector(didTapSeeMore), for: .touchUpInside)
        teamTable.delegate=self
        teamTable.dataSource=self
        configureConstraints()
        bindViews()
    }
    @objc private func didTapSeeMore(){
        viewModel.limit+=10
        viewModel.getTeams(limit:viewModel.limit)
    }
    private func bindViews(){
        viewModel.$allTeamsModel.sink { [weak self] _ in
            DispatchQueue.main.async{
                self?.teamTable.reloadData()
            }
        }.store(in: &subscriptions)
    }
    override func viewWillAppear(_ animated: Bool) {
        viewModel.getTeams(limit:viewModel.limit )

    }
    
    private func configureConstraints(){
        NSLayoutConstraint.activate([
            teamTable.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            teamTable.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            teamTable.heightAnchor.constraint(equalToConstant: 650),
            teamTable.widthAnchor.constraint(equalTo: view.widthAnchor),
            
            seeMoreButton.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -150),
            seeMoreButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            seeMoreButton.heightAnchor.constraint(equalToConstant: 50),
            seeMoreButton.widthAnchor.constraint(equalToConstant: 90)
        ])
    }
    

   

}

extension AllTeamsViewController:UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.allTeamsModel.first?.teams?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TeamsTableViewCell.identifier,for: indexPath) as?
                TeamsTableViewCell else{
                  return UITableViewCell()
              }
        let model=viewModel.allTeamsModel.first?.teams?[indexPath.row]
        cell.configureCells(teamName: model?.name ?? "", shortTeamName: model?.shortName ?? "", stadiumName: model?.venue ?? "", colorsName: model?.clubColors ?? "", createdYear: model?.founded ?? 0 , photoUrl: model?.crest ?? "")
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = TeamDetailViewController(teamID: viewModel.allTeamsModel.first?.teams?[indexPath.row].id ?? 0)
            navigationController?.pushViewController(vc, animated: true)
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
            let offsetY = scrollView.contentOffset.y
            let contentHeight = scrollView.contentSize.height
            
            if offsetY > contentHeight - scrollView.frame.height {
              
                return
            }
        }
    
    
}
