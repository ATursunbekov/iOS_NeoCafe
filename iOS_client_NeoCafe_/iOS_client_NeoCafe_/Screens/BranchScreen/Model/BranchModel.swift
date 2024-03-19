//
//  BranchModel.swift
//  iOS_client_NeoCafe_
//
//  Created by Alikhan Tursunbekov on 19/3/24.
//

import Foundation

struct BranchModel: Codable {
    let allCount: Int
    let responses: [BranchResponses]
}

struct BranchResponses: Codable {
    let id: Int
    let number: Int
    let name: String
    let image: String?
    let address: String
    let phoneNumber: String
    let tableAmount: Int
    let gisUrl: String
    let workDays: [WorkDays]
}

struct WorkDays: Codable {
    let checked: Bool
    let day: String
    let from: String
    let to: String
}
