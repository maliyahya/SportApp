//
//  MatchDetailsModel.swift
//  FootballApp
//
//  Created by Muhammet Ali Yahyaoğlu on 24.01.2024.
//

import Foundation



// MARK: - MatchDetailModel
struct MatchDetailModel: Codable {
    var filters: MatchFilters?
    var resultSet: ResultSet?
    var matches: [Match]?
}

// MARK: - Filters
struct MatchFilters: Codable {
    var dateFrom, dateTo, permission: String?
}

// MARK: - Match
struct Match: Codable {
    var area: MatchArea?
    var competition: MatchCompetition?
    var season: MatchSeason?
    var id: Int?
    var utcDate: String?
    var status: String?
    var matchday: Int?
    var stage: String?
    var lastUpdated: String?
    var homeTeam, awayTeam: Team?
    var score: Score?
    var odds: Odds?
    var referees: [Referee]?
}

// MARK: - Area
struct MatchArea: Codable {
    var id: Int?
    var name, code: String?
    var flag: String?
}

// MARK: - Team
struct MatchTeam: Codable {
    var id: Int?
    var name, shortName, tla: String?
    var crest: String?
}

// MARK: - Competition
struct MatchCompetition: Codable {
    var id: Int?
    var name, code, type: String?
    var emblem: String?
}

// MARK: - Odds
struct Odds: Codable {
    var msg: String?
}

// MARK: - Referee
struct Referee: Codable {
    var id: Int?
    var name, type, nationality: String?
}

// MARK: - Score
struct Score: Codable {
    var winner: String?
    var duration: String?
    var fullTime, halfTime: Time?
}

// MARK: - Time
struct Time: Codable {
    var home, away: Int?
}

// MARK: - Season
struct MatchSeason: Codable {
    var id: Int?
    var startDate, endDate: String?
    var currentMatchday: Int?
}

// MARK: - ResultSet
struct ResultSet: Codable {
    var count: Int?
    var competitions, first, last: String?
    var played: Int?
}

