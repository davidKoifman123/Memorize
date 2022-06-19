//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Work on 6/6/22.
//

import SwiftUI

struct EmojiMemoryGameView: View {
   @ObservedObject var game: EmojiMemoryGame
    
    var body: some View {
        VStack {
            gameBody
            shuffle
        }
        .padding()
    }
    
    @State private var dealt = Set<Int>()
    
    private func deal(_ card: EmojiMemoryGame.Card) {
        dealt.insert(card.id)
    }
    
    private func isUnDealt(_ card: EmojiMemoryGame.Card) -> Bool {
         !dealt.contains(card.id)
    }
    
    var gameBody: some View {
        AspectVGrid(items: game.cards, aspectRatio: 2/3) { card in
            if isUnDealt(card) || (card.isMatched && !card.isFaceUp) {
                Color.clear
            } else {
            CardView(card: card)
                .padding(4)
                .transition(AnyTransition.asymmetric(insertion: .scale,  removal: .opacity).animation(.easeInOut(duration: 3)))
                            
                .onTapGesture {
                    withAnimation {
                    game.choose(card)
                    }
                 }
               }
        }
        .onAppear {
            withAnimation {
                for card in game.cards {
                    deal(card)
                }
            }
        }
        .foregroundColor(.red)
    }
    
    var shuffle: some View {
        Button("Shuffle") {
            withAnimation {
            game.shuffle()
            }
        }
    }
}

struct CardView: View {
    let card: EmojiMemoryGame.Card

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                    Pie(startAngle: Angle(degrees: 0 - 90), endAngle: Angle(degrees: 110 - 90))
                        .padding(5).opacity(0.5)
                Text(card.content).rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
                    .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
                    .font(Font.system(size: DrawingConstants.fontSize))
                    .scaleEffect(scale(thatFits: geometry.size))
            }
            .cardify(isFaceUp: card.isFaceUp)
        }
    }
    
   private func scale(thatFits size: CGSize) -> CGFloat {
        min(size.width, size.height) / (DrawingConstants.fontSize / DrawingConstants.fontScale)
}

  private struct DrawingConstants {
    static let fontScale: CGFloat = 0.7
    static let fontSize: CGFloat = 32
   }
}

  struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(game.cards.first!)
        return EmojiMemoryGameView(game: game)
    }
}
