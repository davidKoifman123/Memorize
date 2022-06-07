//
//  ContentView.swift
//  Memorize
//
//  Created by Work on 6/6/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView()
            CardView()
            CardView()
            CardView()
        }
        .padding(.horizontal)
        .foregroundColor(.red)
    }
}

struct CardView: View {
  //  var isFaceUp: Bool { return false }
    
    var body: some View {
        ZStack {
            //if isFaceUp {
                RoundedRectangle(cornerRadius: 20)
                    .fill()
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 20)
                    .stroke(lineWidth: 3)
                Text("🎾")
                    .font(.largeTitle)
          //  } else {
             //   RoundedRectangle(cornerRadius: 20)
                 //   .fill()
            //}
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
