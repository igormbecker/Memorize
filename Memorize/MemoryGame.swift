//
//  MemoryGame.swift
//  Memorize
//
//  Created by Igor Becker on 25/07/21.
//  Model

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable{
    private(set) var cards: Array<Card>
    private var indexOfTheOneAndOnlyFaceUpCard: Int?
    
    mutating func choose(_ card: Card, totalScore: inout Int) {
        //if let chosenIndex = cards.firstIndex(where: { aCardInTheCardsArray in aCardInTheCardsArray.id == card.id }) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    // MARK: add score
                    totalScore += cards[chosenIndex].score
                } else {
                    // MARK : subtract score
                    if totalScore > 0 {
                        totalScore -= 5
                    }
                }
                
                indexOfTheOneAndOnlyFaceUpCard = nil
                
            } else {
                
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                

                
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
            cards[chosenIndex].isFaceUp.toggle()
        }
        //print("\(cards)")
    }
    
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        // add numberOfPairIfCards x 2 cards to cards array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var score: Int = 10
        let content: CardContent
        let id: Int
    }
}
