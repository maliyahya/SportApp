//
//  TableViewViewModel.swift
//  FootballApp
//
//  Created by Muhammet Ali Yahyaoğlu on 20.01.2024.
//

import Foundation
import Combine

final class StandingsTableViewViewModel: ObservableObject {
    @Published var standingsTableModel: StandingsModel?
    var subscriptions:Set<AnyCancellable> = []
    
    func fetchStandingsData(leagueName:String) {
        NetworkManager.shared.getStandings(leagueNames: leagueName)
                .receive(on: DispatchQueue.main)
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        print("Hata: \(error)")
                    }
                }, receiveValue: { [weak self] standings in
                    self?.standingsTableModel = standings
                    print(standings)
                })
                .store(in: &subscriptions)
        }
    
  }




