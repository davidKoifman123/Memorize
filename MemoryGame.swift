//
//  MemoryGame.swift
//  Memorize
//
//  Created by Work on 11/6/22.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    func choose(_ card: Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMathched: Bool
        var content: CardContent
    }
}
