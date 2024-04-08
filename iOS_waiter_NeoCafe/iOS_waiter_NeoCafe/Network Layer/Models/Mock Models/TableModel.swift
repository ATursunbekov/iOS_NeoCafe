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

class MockTable {
    static let shared = MockTable()
    var mockTable: TableModel?
    var mockTables: [TableModel]
    
    private init() {
        mockTable = TableModel(number: 1, status: .reserved)
        
        mockTables = [
            TableModel(number: 1, status: .reserved),
            TableModel(number: 2, status: .vacant),
            TableModel(number: 3, status: .reserved),
            TableModel(number: 4, status: .vacant),
            TableModel(number: 5, status: .reserved),
            TableModel(number: 6, status: .vacant),
            TableModel(number: 7, status: .reserved),
            TableModel(number: 8, status: .vacant),
            TableModel(number: 9, status: .reserved),
            TableModel(number: 10, status: .vacant),
            TableModel(number: 11, status: .reserved),
            TableModel(number: 12, status: .vacant),
            TableModel(number: 13, status: .reserved),
            TableModel(number: 14, status: .vacant),
            TableModel(number: 15, status: .reserved),
        ]
    }
}
