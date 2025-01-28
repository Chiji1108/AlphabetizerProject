//
//  MessageView.swift
//  Alphabetizer
//
//
//

import SwiftUI

struct MessageView: View {
    @Environment(Alphabetizer.self) private var alphabetizer

    var body: some View {
        Text(alphabetizer.message.rawValue)
            .font(.largeTitle)
    }
}

#Preview("Instructions") {
    MessageView()
        .environment(Alphabetizer())
}

#Preview("You win!") {
    let alphabetizer = Alphabetizer()
    alphabetizer.message = .youWin
    return MessageView()
        .environment(alphabetizer)
}

#Preview("Try again") {
    let alphabetizer = Alphabetizer()
    alphabetizer.message = .tryAgain
    return MessageView()
        .environment(alphabetizer)
}
