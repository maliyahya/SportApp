//
//  TeamDetailModel.swift
//  FootballApp
//
//  Created by Muhammet Ali Yahyaoğlu on 23.01.2024.
//

import Foundation



// MARK: - TeamDetailModel
struct TeamDetailModel: Codable {
    var area: Areas?
    var id: Int?
    var name, shortName, tla: String?
    var crest: String?
    var address: String?
    var website: String?
    var founded: Int?
    var clubColors, venue: String?
    var runningCompetitions: [RunningCompetition]?
    var coach: Coach?
    var squad: [Squad]?
    var lastUpdated: String?
}

// MARK: - Area
struct Areas: Codable {
    var id: Int?
    var name, code: String?
    var flag: String?
}

// MARK: - Coach
struct Coach: Codable {
    var id: Int?
    var firstName, lastName, name, dateOfBirth: String?
    var nationality: String?
    var contract: Contract?
}

// MARK: - Contract
struct Contract: Codable {
    var start, until: String?
}

// MARK: - RunningCompetition
struct RunningCompetition: Codable {
    var id: Int?
    var name, code, type: String?
    var emblem: String?
}

// MARK: - Squad
struct Squad: Codable {
    var id: Int?
    var name: String?
    var position: Position?
    var dateOfBirth, nationality: String?
}

enum Position: String, Codable {
    case defence = "Defence"
    case goalkeeper = "Goalkeeper"
    case midfield = "Midfield"
    case offence = "Offence"
    case midfielder = "Midfielder"
    case forward = "Forward"

}

