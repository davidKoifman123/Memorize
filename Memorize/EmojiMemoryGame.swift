//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Work on 11/6/22.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    private static let emojis = ["🚲", "🚂", "🚁", "🚜", "🚕", "🏎", "🚑", "🚓", "🚒", "✈️", "🚀", "⛵️", "🛸", "🛶", "🚌", "🏍", "🛺", "🚠", "🛵", "🚗", "🚚", "🚇", "🛻", "🚝"]
    
    //TODO: Handle out of range
  private static func createMemoryGame() -> MemoryGame<String> {
      MemoryGame<String>(numberOfPairsOfCards: 6) { pairIndex in
        EmojiMemoryGame.emojis[pairIndex]
     }
    }
    
   @Published private var model = createMemoryGame()
    
    var cards: Array<Card> {
        return model.cards
    }
    
    //MARK: -Intent()s
    
    func choose(_ card: Card) {
        model.choose(card)
    }
    
    func shuffle() {
        model.shuffle()
    }
    
    func restart() {
        model = EmojiMemoryGame.createMemoryGame()
    }
}
