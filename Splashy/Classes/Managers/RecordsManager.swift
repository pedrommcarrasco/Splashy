//
//  RecordsManager.swift
//  Splashy
//
//  Created by Pedro Carrasco on 18/04/2018.
//  Copyright © 2018 Pedro Carrasco. All rights reserved.
//

import Foundation

struct RecordsManager {
    
    // MARK: - CONSTANTS
    private enum Constants {
        static let recordKey = "splashy.record"
    }
    
    // MARK: - PUBLIC PROPERTIES
    var currentRecord: Int {
        return UserDefaults.standard.integer(forKey: Constants.recordKey)
    }
    
    // MARK: - PUBLIC FUNCTIONS
    func isNewRecord(_ score: Int) -> Bool {
        if score > currentRecord {
            UserDefaults.standard.set(score, forKey: Constants.recordKey)
            return true
        }
        
        return false
    }

}
