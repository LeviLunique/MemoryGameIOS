//
//  EmojiMemoryGame.swift
//  MemoryGame
//
//  Created by user204006 on 8/15/21.
//

import SwiftUI

//ViewModel MVVM
class EmojiMemoryGame: ObservableObject{
    
    var theme: Theme<String>
    
    init(theme: Theme<String>){
        self.theme = theme
        self.model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
    
    @Published
    var model: MemoryGame<String>

    
    static func createMemoryGame(theme: Theme<String>) -> MemoryGame<String>{
        //var emojis = ["🤔", "😮", "😳", "🙃", "🥲", "🥸", "🧐", "🌚"]
        var emojis = theme.cardFaceOptions.shuffled()
        emojis = emojis.dropLast(emojis.count - Int.random(in: 2...5))
        
        return MemoryGame (numberOfPairsOfCards: emojis.count) {emojis[$0]}
    }
    
    // MARK: - Acesso da Viewe à Model
    var cards: Array<MemoryGame<String>.Card>{
        print(model.cards)
        return model.cards
    }
    
    var gameHasEnded: Bool{
        model.gameHasEnded
    }
    
    var themeColor: Color{
        (theme.details["color"] as? Color) ?? Color.black
    }
    
    var themeCornerRadius: CGFloat{
        CGFloat(theme.details["cornerRadius"] as? Int ?? 8)
    }
    
    // MARK: - Processamento de Intenções
    func choose (card: MemoryGame<String>.Card){
        model.choose(card: card)
    }
    
    func newGame(){
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
}
