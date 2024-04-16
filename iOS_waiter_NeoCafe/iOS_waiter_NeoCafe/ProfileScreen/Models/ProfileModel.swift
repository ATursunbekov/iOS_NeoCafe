//
//  ProfileModel.swift
//  iOS_waiter_NeoCafe
//
//  Created by Alikhan Tursunbekov on 4/4/24.
//

import Foundation

struct ProfileModel: Codable {
    let name: String
    let email: String
    let position: String
    let birthday: String
    let workDays: [WorkDay]
}

struct WorkDay: Codable {
    let checked: Bool
    let day: String
    let from: String
    let to: String
}
