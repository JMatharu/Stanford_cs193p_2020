//
//  MemoryGame.swift
//  Memorize
//
//  Created by Jagdeep Matharu on 2020-05-24.
//  Copyright © 2020 jmatharu. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable{
    var cards: [Card]
    
    var indexOfTheOneAndTheOnlyFaceUpCard: Int? {
        get { cards.indices.filter { cards[$0].isFaceUp }.only }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    init(numberOfPairOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = [Card]()
        for pairIndex in 0..<numberOfPairOfCards {
            let content = cardContentFactory(pairIndex)
            self.cards.append(Card(id: pairIndex * 2, content: content))
            self.cards.append(Card(id: pairIndex * 2 + 1, content: content))
        }
        self.cards.shuffle()
    }
    
    mutating func choose(card: Card) {
        print("Card Choosen: \(card)")
        if let choosenIndex = cards.firstIndex(matching: card),
            !cards[choosenIndex].isFaceUp,
            !cards[choosenIndex].isMatched {
            
            if let potentialMatchIndex = indexOfTheOneAndTheOnlyFaceUpCard {
                if cards[choosenIndex].content == cards[potentialMatchIndex].content {
                    cards[choosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                self.cards[choosenIndex].isFaceUp = true
            } else {
                indexOfTheOneAndTheOnlyFaceUpCard = choosenIndex
            }
        }
    }
    
    struct Card: Identifiable {
        var id: Int
        
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
}
