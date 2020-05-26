//
//  MemoryGame.swift
//  Memorize
//
//  Created by Jagdeep Matharu on 2020-05-24.
//  Copyright © 2020 jmatharu. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: [Card]
    
    init(numberOfPairOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = [Card]()
        for pairIndex in 0..<numberOfPairOfCards {
            let content = cardContentFactory(pairIndex)
            self.cards.append(Card(id: pairIndex * 2, content: content))
            self.cards.append(Card(id: pairIndex * 2 + 1, content: content))
        }
        self.cards.shuffle()
    }
    
    func choose(card: Card) {
        print("Card Choosen: \(card)")
    }
    
    struct Card: Identifiable {
        var id: Int
        
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
    }
}
