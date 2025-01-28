//
//  Alphabetizer.swift
//  Alphabetizer
//
//  Created by 千々岩真吾 on 2025/01/28.
//

import Foundation

@Observable
class Alphabetizer {
    private var tileCount = 3
    private var vocab: Vocabulary

    var tiles = [Tile]()
    var score = 0
    var message: Message = .instructions

    init(vocab: Vocabulary = .oceanAnimals) {
        self.vocab = vocab
        startNewGame()
    }

    // Alternates true and flase
    private var isAlphabetized = false

    /// Checks if tiles are in alphabetical order
    func submit() {
        // Check if the tiles are alphabetized
        // TODO: Compare alphabetical order to position
        isAlphabetized.toggle()

        // If alphabetized, increment the score
        if isAlphabetized {
            score += 1
        }

        // Update the message to win or lose
        message = isAlphabetized ? .youWin : .tryAgain

        // Flip over correct tiles
        for tile in tiles {
            // TODO: Check if this tile is in the correct position
            let tileIsAlphabetized = isAlphabetized
            tile.flipped = tileIsAlphabetized
        }

        Task { @MainActor in
            // Delay 2 seconds
            try await Task.sleep(for: .seconds(2))

            // If alphabetized, generate new tiles
            if isAlphabetized {
                tiles.removeAll()
                startNewGame()
            }

            // Flip tiles back to words
            for tile in tiles {
                tile.flipped = false
            }

            // Display instructions
            message = .instructions
        }
    }

    // MARK: private implementation

    /// Updates `tiles` with a new set of unalphabetized words
    private func startNewGame() {
        let newWords = vocab.selectRandomWords(count: tileCount)
        for word in newWords {
            tiles.append(Tile(word: word))
        }
    }
}
