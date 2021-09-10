//
//  ThemeView.swift
//  MemoryGame
//
//  Created by user204006 on 8/26/21.
//

import SwiftUI

struct ThemeView: View {
    
    @ObservedObject
    var viewModel: ThemeViewModel
    
    var body: some View{
        NavigationView{
            
            List(viewModel.themeNames){ themeName in
                
                NavigationLink(destination: EmojiMemoryGameView(viewModel: EmojiMemoryGame(theme: viewModel.themeFor(name: themeName)), theme: themeName)){
                    Text(themeName)
                }
                
            }
            .navigationTitle("Game Theme")
            
        }
    }
}

extension String: Identifiable{
    public var id: String{
        return self
    }
}
