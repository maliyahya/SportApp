//
//  StandingsSelectionViewController.swift
//  FootballApp
//
//  Created by Muhammet Ali Yahyaoğlu on 22.01.2024.
//

import UIKit

class StandingsSelectionViewController: UIViewController {
    
    
    private let buttonPL=SelectionButton(image: "PL")
    private let buttonSerieA=SelectionButton( image: "SA")
    private let buttonBundesLiga=SelectionButton( image: "BL1")
    private let buttonPrimeiraLiga=SelectionButton( image: "PPL")
    private let buttonPrimeraDivision=SelectionButton( image: "PD")
    private let buttonEredivisie=SelectionButton( image: "DED")
    private let buttonLigue1=SelectionButton( image: "FL1")
    private let buttonChampionship=SelectionButton( image:"ELC")

    @objc private func didTabSelectionButton(_ sender: UIButton) {
        let leagueName: String
        switch sender.tag {
        case 1:
            leagueName = "PL"
        case 2:
            leagueName = "SA"
        case 3:
            leagueName = "FL1"
        case 4:
            leagueName = "DED"
        case 5:
            leagueName = "ELC"
        case 6:
            leagueName = "BL1"
        case 7:
            leagueName = "PD"
        case 8:
            leagueName = "PPL"
        default:
            leagueName = "00"
        }
        
        let vc = StandingsTableViewController(leagueName: leagueName)
        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(buttonPL)
        view.addSubview(buttonSerieA)
        view.addSubview(buttonLigue1)
        view.addSubview(buttonEredivisie)
        view.addSubview(buttonBundesLiga)
        view.addSubview(buttonPrimeraDivision)
        view.addSubview(buttonChampionship)
        view.addSubview(buttonPrimeiraLiga)
        configureConstraints()
        buttonTags()
    }
    private func buttonTags(){
        buttonPL.tag=1
        buttonSerieA.tag=2
        buttonLigue1.tag=3
        buttonEredivisie.tag=4
        buttonChampionship.tag=5
        buttonBundesLiga.tag=6
        buttonPrimeiraLiga.tag=7
        buttonPrimeraDivision.tag=8
        buttonPL.addTarget( self, action: #selector(didTabSelectionButton), for: .touchUpInside)
        buttonSerieA.addTarget(self, action: #selector(didTabSelectionButton), for: .touchUpInside)
        buttonLigue1.addTarget(self, action: #selector(didTabSelectionButton), for: .touchUpInside)
        buttonEredivisie.addTarget(self, action: #selector(didTabSelectionButton), for: .touchUpInside)
        buttonChampionship.addTarget(self, action: #selector(didTabSelectionButton), for: .touchUpInside)
        buttonBundesLiga.addTarget(self, action: #selector(didTabSelectionButton), for: .touchUpInside)
        buttonPrimeiraLiga.addTarget(self, action: #selector(didTabSelectionButton), for: .touchUpInside)
        buttonPrimeraDivision.addTarget(self, action: #selector(didTabSelectionButton), for: .touchUpInside)
    }
    private func configureConstraints(){
        NSLayoutConstraint.activate([
            buttonPL.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            buttonPL.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 35),
            buttonPL.heightAnchor.constraint(equalToConstant: 150),
            buttonPL.widthAnchor.constraint(equalToConstant: 150),
            
            buttonSerieA.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            buttonSerieA.leadingAnchor.constraint(equalTo: buttonPL.trailingAnchor,constant: 20),
            buttonSerieA.heightAnchor.constraint(equalToConstant: 150),
            buttonSerieA.widthAnchor.constraint(equalToConstant: 150),
            
            buttonLigue1.topAnchor.constraint(equalTo: buttonPL.bottomAnchor, constant: 20),
            buttonLigue1.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant:35),
            buttonLigue1.heightAnchor.constraint(equalToConstant: 150),
            buttonLigue1.widthAnchor.constraint(equalToConstant: 150),
            
            buttonBundesLiga.topAnchor.constraint(equalTo: buttonSerieA.bottomAnchor,constant: 20),
            buttonBundesLiga.leadingAnchor.constraint(equalTo: buttonLigue1.trailingAnchor, constant: 20),
            buttonBundesLiga.heightAnchor.constraint(equalToConstant: 150),
            buttonBundesLiga.widthAnchor.constraint(equalToConstant: 150),
            
            buttonPrimeraDivision.topAnchor.constraint(equalTo: buttonLigue1.bottomAnchor, constant: 20),
            buttonPrimeraDivision.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 35),
            buttonPrimeraDivision.heightAnchor.constraint(equalToConstant: 150),
            buttonPrimeraDivision.widthAnchor.constraint(equalToConstant: 150),
            
            buttonEredivisie.topAnchor.constraint(equalTo: buttonBundesLiga.bottomAnchor, constant: 20),
            buttonEredivisie.leadingAnchor.constraint(equalTo: buttonPrimeraDivision.trailingAnchor,constant: 20),
            buttonEredivisie.heightAnchor.constraint(equalToConstant: 150),
            buttonEredivisie.widthAnchor.constraint(equalToConstant: 150),
            
            
            buttonPrimeiraLiga.topAnchor.constraint(equalTo: buttonPrimeraDivision.bottomAnchor, constant: 20),
            buttonPrimeiraLiga.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 35),
            buttonPrimeiraLiga.heightAnchor.constraint(equalToConstant: 150),
            buttonPrimeiraLiga.widthAnchor.constraint(equalToConstant: 150),
            
            buttonChampionship.topAnchor.constraint(equalTo: buttonEredivisie.bottomAnchor, constant: 20),
            buttonChampionship.leadingAnchor.constraint(equalTo: buttonPrimeiraLiga.trailingAnchor, constant: 20),
            buttonChampionship.heightAnchor.constraint(equalToConstant: 150),
            buttonChampionship.widthAnchor.constraint(equalToConstant: 150),
            
        ])
    }


}





class SelectionButton: UIButton {
    init( image: String?) {
        super.init(frame: .zero)
        setImage(UIImage(named: image ?? "PL"), for: .normal)
        setTitleColor(.label, for: .normal)
        backgroundColor = .systemBackground
        layer.shadowRadius=20
        layer.cornerRadius = 20
        clipsToBounds = true
        layer.borderWidth = 2.0
        layer.borderColor = UIColor.black.cgColor
        translatesAutoresizingMaskIntoConstraints = false
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
