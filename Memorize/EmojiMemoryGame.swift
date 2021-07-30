//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Igor Becker on 25/07/21.
//  ViewModel

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    private static let emojis = ["👻", "💀", "🎃", "😱", "😨", "😰", "😥", "😈", "🤡",
    "😵‍💫", "😶‍🌫️", "👿", "👺", "😵", "🥴", "👽", "👹", "🤖"] //18 emojis
    
    
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 10) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    //@Published private var model: MemoryGame<String> = createMemoryGame()
    @Published private var model = createMemoryGame()

    var cards: Array<Card> {
        model.cards
    }
    
    // MARK:  - Intent(s)
    
    func choose(_ card: Card, totalScore: inout Int) {
        model.choose(card, totalScore: &totalScore)
    }
}
