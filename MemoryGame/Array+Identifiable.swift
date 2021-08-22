//
//  Array+Identifiable.swift
//  MemoryGame
//
//  Created by user204006 on 8/15/21.
//

import Foundation

extension Array where Element: Identifiable{
    
    func firstIndex(matching: Element) -> Int?{
        for index in 0..<count {
            if self[index].id == matching.id{
                return index
            }
        }
        return nil
    }
}
