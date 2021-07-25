//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Igor Becker on 25/07/21.
//

import SwiftUI

class EmojiMemoryGame {
    
    static let emojis = ["👻", "💀", "🎃", "😱", "😨", "😰", "😥", "😈", "🤡",
    "😵‍💫", "😶‍🌫️", "👿", "👺", "😵", "🥴", "👽", "👹", "🤖"] //18 emojis
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    private var model: MemoryGame<String> = createMemoryGame()

    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
}
