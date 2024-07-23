//
//  Array.swift
//  Learnable
//
//  Created by Bryan Mina on 7/23/24.
//

import Foundation

extension Array where Element: Equatable {
    var unique: [Element] {
        var uniqueValues: [Element] = []
        forEach { item in
            guard !uniqueValues.contains(item) else { return }
            uniqueValues.append(item)
        }
        
        return uniqueValues
    }
}
