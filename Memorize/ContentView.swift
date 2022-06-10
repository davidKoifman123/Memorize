//
//  ContentView.swift
//  Memorize
//
//  Created by Work on 6/6/22.
//

import SwiftUI

struct ContentView: View {
    
    //TODO: deal with redudncay
   @State var vehichles = ["🚲", "🚂", "🚁", "🚜", "🚕", "🏎", "🚑", "🚓", "🚒", "✈️", "🚀", "⛵️", "🛸", "🛶", "🚌", "🏍", "🛺", "🚠", "🛵", "🚗", "🚚", "🚇", "🛻", "🚝"]
    
   @State var sport = ["⚽️", "🏀", "🏈", "🏸", "🥎", "🏉", "🏓", "🥊"]
    
   @State var food = ["🍏", "🍈", "🍞", "🌽", "🥚", "🧇", "🥗", "🥝"]
    
  @State var mainArray = ["🚲", "🚂", "🚁", "🚜", "🚕", "🏎", "🚑", "🚓", "🚒", "✈️", "🚀", "⛵️", "🛸", "🛶", "🚌", "🏍", "🛺", "🚠", "🛵", "🚗", "🚚", "🚇", "🛻", "🚝"]
    
    
    //@State var arrayCount = [Int]()
    //TODO: add main array
    //TODO: improve this array
    
    @State var emojiCount = [24, 8, 8]
    @State var indexCounter = 0
    
    var body: some View {
        //mainArray = vehichles
        VStack {
            Text("Memorize!").font(.title)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                ForEach(mainArray[0..<emojiCount[indexCounter]], id: \.self) { emoji in
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
    
    
    var vehiclesTheme: some View {
        Button(action: {
            indexCounter = 0
            mainArray = vehichles.shuffled()
            }, label: {
                VStack {
                Text("Vehicle").font(.custom("Helvetica Neue", size: 20))
                  //  Image(systemName: "car.fill")
                }
        })
   }
    
    var foodTheme: some View {
        Button(action: {
            indexCounter = 1
            self.mainArray = food.shuffled()
                }, label: {
                    Text("Food").font(.custom("Helvetica Neue", size: 20))
                     Image(systemName: "")
         })
    }
    
    var sportTheme: some View {
        Button(action: {
           indexCounter = 2
            self.mainArray = sport.shuffled()
                }, label: {
                    Text("Sport").font(.custom("Helvetica Neue", size: 20))
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
