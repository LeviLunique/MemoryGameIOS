//
//  ThemeViewModel.swift
//  MemoryGame
//
//  Created by user204006 on 8/26/21.
//

import SwiftUI

class ThemeViewModel: ObservableObject {
    
    @Published
    var model = [
    
        Theme<String>(
            name: "Comedy",
            cardFaceOptions: ["🌚", "🤡", "🤔", "🙃", "🧐", "🥸", "😮", "😳", "👽", "🥲"],
            details: ["color": Color.blue, "cornerRadius": 8]
        ),
        
        Theme<String>(
            name: "Vehicles",
            cardFaceOptions: ["🚀", "✈️", "🚗", "🏍", "🚓", "🚚", "🚑", "🚁", "🛵", "🚒", "🚌"],
            details: ["color": Color.blue, "cornerRadius": 24]
        )
        
    ]
    
    var themeNames: [String]{
        model.map({$0.name})
    }
    
    func themeFor(name: String) -> Theme<String>{
        return model.first(where: {$0.name == name})!
    }
    
}

