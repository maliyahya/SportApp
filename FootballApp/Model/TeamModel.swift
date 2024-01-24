//
//  TeamModel.swift
//  FootballApp
//
//  Created by Muhammet Ali Yahyaoğlu on 23.01.2024.
//

import Foundation

// MARK: - TeamModel
struct TeamModel: Codable {
    var count: Int?
    var filters: Filter?
    var teams: [Teams]?
}

// MARK: - Filters
struct Filter: Codable {
    var limit, offset: Int?
    var permission: String?
}

// MARK: - Team
struct Teams: Codable {
    var id: Int?
    var name, shortName, tla: String?
    var crest: String?
    var address: String?
    var website: String?
    var founded: Int?
    var clubColors, venue: String?
    var lastUpdated: String?
}
