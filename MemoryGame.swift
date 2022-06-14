//
//  MemoryGame.swift
//  Memorize
//
//  Created by Work on 11/6/22.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
   private(set) var cards: Array<Card>
   private var indexOfTheOneAndOnlyFaceUpCard: Int?
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMathched
        {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMathched = true
                    cards[potentialMatchIndex].isMathched = true
                }
                indexOfTheOneAndOnlyFaceUpCard = nil
            } else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
             cards[chosenIndex].isFaceUp.toggle()
        }
        print("\(cards)")
    }
     
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = []// Array<Card>()
        
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp = false
        var isMathched = false
        let content: CardContent
        let id: Int
    }
}
