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
                GeometryReader{geometry in
                    Text(card.content)
                        .makeCard(isFaceUp: card.isFacedUp)
                        .font(.system(size: fontSize(for: geometry.size)))
                        .onTapGesture {
                            viewModel.choose(card: card)
                        }                }
            }
        }
        .font(Font.system(size: 30))
        .foregroundColor(Color.red)
    }
    
    private func fontSize(for size: CGSize) -> CGFloat{
        return min(size.width, size.height) * 0.7
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
    }
}
