//
//  Alphabetizer.swift
//  Alphabetizer
//
//  Created by 千々岩真吾 on 2025/01/28.
//

import Foundation

class Alphabetizer {
    private var tileCount = 3
    private var vocab: Vocabulary

    var titles = [Tile]()
    var score = 0

    init(vocab: Vocabulary = .oceanAnimals) {
        self.vocab = vocab
    }
}
