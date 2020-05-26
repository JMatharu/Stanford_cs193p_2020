//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Jagdeep Matharu on 2020-05-24.
//  Copyright © 2020 jmatharu. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame {
    typealias Game = MemoryGame<String>

    private var game: Game = EmojiMemoryGame.createGame()
    
    static func createGame() -> Game {
        let emojiArray = ["👻", "🎃", "😈", "🤡", "👽"]
        let random = 5//Int.random(in: 2..<5)
        return Game(numberOfPairOfCards: random) { pairIndex in
            emojiArray[pairIndex]
        }
    }
    
    // MARK: - Access to the model
    var cards: [Game.Card] {
        return game.cards
    }
    
    var are5Cards: Bool {
        return cards.count == 5
    }
    
    // MARK: - Intents
    
    func choose(card: Game.Card) {
        game.choose(card: card)
    }
}
