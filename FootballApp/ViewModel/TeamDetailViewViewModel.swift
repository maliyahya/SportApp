//
//  TeamDetailViewViewModel.swift
//  FootballApp
//
//  Created by Muhammet Ali Yahyaoğlu on 23.01.2024.
//

import Foundation
import Combine

final class TeamDetailViewViewModel:ObservableObject{
    
    @Published var teamDetailModel=TeamDetailModel()
    var subscriptions:Set<AnyCancellable> = []
    
    func getTeamDetail(teamID:Int){
        NetworkManager.shared.getTeamDetail(teamID: teamID)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Hata: \(error)")
                }
            },receiveValue: { model in
            self.teamDetailModel=model
                print(self.teamDetailModel)
        }
            ).store(in: &subscriptions)
    }
}
