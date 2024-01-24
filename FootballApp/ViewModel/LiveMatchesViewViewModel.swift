//
//  LiveMatchesViewViewModel.swift
//  FootballApp
//
//  Created by Muhammet Ali Yahyaoğlu on 24.01.2024.
//

import Foundation
import Combine

final class LiveMatchesViewViewModel:ObservableObject{
    var subscriptions:Set<AnyCancellable> = []
    @Published var matchDetailModel=MatchDetailModel()
    
    func getLiveMatches(){
        NetworkManager.shared.getMatchDetail()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Hata: \(error)")
                }
            },receiveValue: { matchDetailModel in
                self.matchDetailModel=matchDetailModel
            }
            ).store(in: &subscriptions)
    }
    }
