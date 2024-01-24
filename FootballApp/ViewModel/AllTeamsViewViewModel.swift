//
//  AllTeamsViewViewModel.swift
//  FootballApp
//
//  Created by Muhammet Ali Yahyaoğlu on 23.01.2024.
//

import Foundation
import Combine


final class AllTeamsViewViewModel:ObservableObject{
    var subscriptions:Set<AnyCancellable>=[]
    @Published var allTeamsModel:[TeamModel]=[]
    @Published var limit:Int=10
    func getTeams(limit:Int){
        NetworkManager.shared.getTeams(limit: limit)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Hata: \(error)")
                }
            },receiveValue: { teamModel in
                self.allTeamsModel=[teamModel]
            }

            )  .store(in: &subscriptions)}
    
}
