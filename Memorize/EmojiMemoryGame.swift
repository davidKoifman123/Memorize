//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Work on 11/6/22.
//

import SwiftUI

class EmojiMemoryGame {
    static let emojis = ["🚲", "🚂", "🚁", "🚜", "🚕", "🏎", "🚑", "🚓", "🚒", "✈️", "🚀", "⛵️", "🛸", "🛶", "🚌", "🏍", "🛺", "🚠", "🛵", "🚗", "🚚", "🚇", "🛻", "🚝"]
    
   static func createMemoryGame() -> MemoryGame<String> {
    MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
        EmojiMemoryGame.emojis[pairIndex]
     }
    }
    
    private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    //MARK: -INtent()s
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
