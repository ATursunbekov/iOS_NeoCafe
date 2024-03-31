//
//  TableModel.swift
//  iOS_waiter_NeoCafe
//
//  Created by iPak Tulane on 19/03/24.
//

import Foundation

struct TableModel {
    let number: Int
    let status: TableStatus
    
    enum TableStatus {
        case vacant
        case reserved
        
        var isVacant: Bool {
            switch self {
            case .vacant:
                return true
            case .reserved:
                return false
            }
        }
    }
}
