//
//  EmojiMemoryGame.swift
//  MemoryGame
//
//  Created by user204006 on 8/15/21.
//

import Foundation

//ViewModel MVVM
class EmojiMemoryGame: ObservableObject{
    
    @Published
    var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String>{
        let emojis = ["🤔", "😮", "😳", "🙃", "🥲", "🥸", "🧐", "🌚"]
        return MemoryGame (numberOfPairsOfCards: emojis.count) {emojis[$0]}
    }
    
    // MARK: - Acesso da Viewe à Model
    var cards: Array<MemoryGame<String>.Card>{
        model.cards
    }
    // MARK: - Processamento de Intenções
    func choose (card: MemoryGame<String>.Card){
        model.choose(card: card)
    }
}
