//
//  ContentView.swift
//  MemoryGame
//
//  Created by user204006 on 8/11/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject
    var viewModel: EmojiMemoryGame
    var body: some View {
        
        HStack {
            ForEach(viewModel.cards){ card in
                Text(card.content)
                    .makeCard(isFaceUp: card.isFacedUp)
                    .onTapGesture {
                        viewModel.choose(card: card)
                    }
            }
        }
        .font(Font.system(size: 30))
        .foregroundColor(Color.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
    }
}
