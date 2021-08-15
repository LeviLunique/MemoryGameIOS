import Foundation
//Model do MVVM
struct MemoryGame<CardContent> where CardContent: Equatable{
    var cards: Array<Card>
    
    private var indexOfPreviousChosenCard: Int?
    
    /*
     1- Gerar cartas - criar partida
     2- Função para escolher uma carta
     3- Detectar fim do jogo
     */
    
    init(numberOfPairsOfCards: Int, cardFactory: (Int) -> CardContent){
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards{
            let content = cardFactory(pairIndex)
            cards.append(Card(id: pairIndex * 2, content: content))
            cards.append(Card(id: pairIndex * 2 + 1, content: content))
        }
    }
    
    mutating func choose(card: Card){
        print ("Carta escolhida: \(card)")
        if let chosenCardIndex = cards.firstIndex(matching: card){
            if let possibleMatch = indexOfPreviousChosenCard{
                if cards[chosenCardIndex].content == cards[possibleMatch].content{
                    cards[chosenCardIndex].isMatched = true
                    cards[possibleMatch].isMatched = true
                }
                
            } else {
                indexOfPreviousChosenCard = chosenCardIndex
            }
            
            cards[chosenCardIndex].isFacedUp = true
            
        }
    }
    
    struct Card: Identifiable{
        var id: Int
        var isFacedUp: Bool = false
        
        var isMatched: Bool = false
        
        var content: CardContent
    }
}
