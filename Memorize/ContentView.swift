//
//  ContentView.swift
//  Memorize
//
//  Created by Igor Becker on 20/07/21.
//  View

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    @State var totalScore: Int = 0
    
    var body: some View {
        VStack {
            
            HStack {
                Text("Score: \(totalScore)")
                    .padding()
            }
            .padding(.horizontal)
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card, totalScore: &totalScore)
                            }
                    }
                }
            }
        }
        .foregroundColor(Color.orange)
        .padding(.horizontal)
    }
    
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 10.0)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0)
            } else {
                shape.fill()
            }
        }
//        .onTapGesture {
//            card.isFaceUp = !card.isFaceUp
//        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
//        ContentView()
//            .preferredColorScheme(.dark)
    }
}
