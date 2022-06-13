//
//  MemoryGame.swift
//  Memorize
//
//  Created by Work on 11/6/22.
//

import Foundation

struct MemoryGame<CardContent> {
   private(set) var cards: Array<Card>
    
    func choose(_ card: Card) {
        print("hello")
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = true
        var isMathched: Bool = false
        var content: CardContent
        var id: Int
    }
}
