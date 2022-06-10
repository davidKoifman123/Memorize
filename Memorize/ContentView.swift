//
//  ContentView.swift
//  Memorize
//
//  Created by Work on 6/6/22.
//

import SwiftUI

struct ContentView: View {
    var vehichles = ["🚲", "🚂", "🚁", "🚜", "🚕", "🏎", "🚑", "🚓", "🚒", "✈️", "🚀", "⛵️", "🛸", "🛶", "🚌", "🏍", "🛺", "🚠", "🛵", "🚗", "🚚", "🚇", "🛻", "🚝"]
    
    var sport = ["⚽️", "🏀", "🏈", "🏸", "🥎", "🏉", "🏓", "🥊"]
    
    var food = ["🍏", "🍈", "🍞", "🌽", "🥚", "🧇", "🥗", "🥝"]
    
    //@State var arrayCount = [Int]()
    
    @State var emojiCount = 24
    
    var body: some View {
        VStack {
            Text("Memorize!")
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                ForEach(vehichles[0..<emojiCount], id: \.self) { emoji in
                    CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                }
            }
      }
        .foregroundColor(.red)
        Spacer()
        HStack {
            vehiclesTheme
              Spacer()
            foodTheme
              Spacer()
            sportTheme
            }
            .font(.largeTitle)
            .padding(.horizontal)
    }
        .padding(.horizontal)
}
    
    
    var foodTheme: some View {
        Button(action: {
                }, label: {
                    Text("Food")
         })
    }
        
    var vehiclesTheme: some View {
        Button(action: {
                }, label: {
                    Text("Vehicle")
         })
    }
    
    var sportTheme: some View {
        Button(action: {
                }, label: {
                    Text("Sport")
         })
    }
}


struct CardView: View {
    var content: String
   @State var isFaceUp: Bool = true

    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
