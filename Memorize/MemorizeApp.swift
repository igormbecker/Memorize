//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Igor Becker on 20/07/21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    private let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
