//
//  NetworkManager.swift
//  FootballApp
//
//  Created by Muhammet Ali Yahyaoğlu on 20.01.2024.
//

import Foundation
import Combine

class NetworkManager {

    static let shared = NetworkManager()
    private init() {}
    func getStandings(leagueNames:String) -> AnyPublisher<StandingsModel, Error> {
          guard let url = URL(string: "https://api.football-data.org/v4/competitions/\(leagueNames)/standings") else {
              return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
          }
          var request = URLRequest(url: url)
          request.httpMethod = "GET"
          request.addValue("f294ce4e5c86448fa4504c3a412c2eb7", forHTTPHeaderField: "X-Auth-Token")
          return URLSession.shared.dataTaskPublisher(for: request)
              .map(\.data)
              .decode(type: StandingsModel.self, decoder: JSONDecoder())
              .eraseToAnyPublisher()
      }
    func getTeams(limit:Int) -> AnyPublisher<TeamModel, Error> {
          guard let url = URL(string: "https://api.football-data.org/v4/teams?limit=\(limit)") else {
              return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
          }
          var request = URLRequest(url: url)
          request.httpMethod = "GET"
          request.addValue("f294ce4e5c86448fa4504c3a412c2eb7", forHTTPHeaderField: "X-Auth-Token")
          return URLSession.shared.dataTaskPublisher(for: request)
              .map(\.data)
              .decode(type: TeamModel.self, decoder: JSONDecoder())
              .eraseToAnyPublisher()
      }
    func getTeamDetail(teamID:Int) -> AnyPublisher<TeamDetailModel, Error> {
          guard let url = URL(string: "https://api.football-data.org/v4/teams/\(teamID)") else {
              return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
          }
          var request = URLRequest(url: url)
          request.httpMethod = "GET"
          request.addValue("f294ce4e5c86448fa4504c3a412c2eb7", forHTTPHeaderField: "X-Auth-Token")
          return URLSession.shared.dataTaskPublisher(for: request)
              .map(\.data)
              .decode(type: TeamDetailModel.self, decoder: JSONDecoder())
              .eraseToAnyPublisher()
      }
    func getMatchDetail() -> AnyPublisher<MatchDetailModel, Error> {
          guard let url = URL(string: "https://api.football-data.org/v4/matches")else {
              return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
          }
          var request = URLRequest(url: url)
          request.httpMethod = "GET"
          request.addValue("f294ce4e5c86448fa4504c3a412c2eb7", forHTTPHeaderField: "X-Auth-Token")
          return URLSession.shared.dataTaskPublisher(for: request)
              .map(\.data)
              .decode(type: MatchDetailModel.self, decoder: JSONDecoder())
              .eraseToAnyPublisher()
      }

}


