//
//  Theme.swift
//  MemoryGame
//
//  Created by user204006 on 8/26/21.
//

import SwiftUI
struct Theme<CardContent>: Identifiable where CardContent: Equatable{
    
    var id = UUID()
    
    let name: String
    let cardFaceOptions: [CardContent]
    let details: [String:Any]
    
}
