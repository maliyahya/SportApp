// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let tableModel = try? JSONDecoder().decode(TableModel.self, from: jsonData)

import Foundation

// MARK: - TableModel
struct StandingsModel: Codable {
    let filters: Filters?
    let area: Area?
    let competition: Competition?
    let season: Season?
    let standings: [Standing]?
}

// MARK: - Area
struct Area: Codable {
    let id: Int?
    let name, code: String?
    let flag: String?
}

// MARK: - Competition
struct Competition: Codable {
    let id: Int?
    let name, code, type: String?
    let emblem: String?
}

// MARK: - Filters
struct Filters: Codable {
    let season: String?
}

// MARK: - Season
struct Season: Codable {
    let id: Int?
    let startDate, endDate: String?
    let currentMatchday: Int?
    let stages: [String]?
}

// MARK: - Standing
struct Standing: Codable {
    let stage, type: String?
    let table: [Table]?
}

// MARK: - Table
struct Table: Codable {
    let position: Int?
    let team: Team?
    let playedGames: Int?
    let form: String?
    let won, draw, lost, points: Int?
    let goalsFor, goalsAgainst, goalDifference: Int?
}

// MARK: - Team
struct Team: Codable {
    let id: Int?
    let name, shortName, tla: String?
    let crest: String?
}

