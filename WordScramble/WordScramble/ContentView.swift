//
//  ContentView.swift
//  WordScramble
//
//  Created by Paul Gagnon on 5/12/20.
//  Copyright © 2020 22q. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    @State private var score = 0

    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false

    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter your word", text: $newWord, onCommit: addNewWord)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .padding()

                List(usedWords, id: \.self) {
                    Image(systemName: "\($0.count).circle")
                    Text($0)
                }
                Text("Score: \(score)")
                    .font(.title)
                    .padding()
            }
        .navigationBarTitle(rootWord)
        .navigationBarItems(leading:
            Button("New Word", action: startGame))
        .onAppear(perform: startGame)
        .alert(isPresented: $showingError) {
                Alert(title: Text(errorTitle), message: Text(errorMessage), dismissButton: .default(Text("OK")))
            }
        }
    }

    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)

        guard answer.count > 0 else {
            return
        }

        guard answer.count >= 3 else {
            wordError(title: "Word too short", message: "Words must be longer than three letters")
            return
        }

        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", message: "Be more original")
            return
        }

        guard isPossible(word: answer) else {
            wordError(title: "Word not recognized", message: "You can't just make then up, you know!")
            return
        }

        guard isReal(word: answer) else {
            wordError(title: "Word not possible", message: "That isn't a real word")
            return
        }

        usedWords.insert(answer, at: 0)

        switch answer.count {
        case 6:
            score += 8
        case 7:
            score += 10
        case 8:
            score += 15
        default:
            score += answer.count
        }

        newWord = ""
    }

    func startGame() {
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL) {
                let allWords = startWords.components(separatedBy: "\n")
                rootWord = allWords.randomElement() ?? "silkworm"
                usedWords = []
                score = 0
                return
            }
        }

        fatalError("Could not load start.txt from bundle.")
    }

    func isOriginal(word: String) -> Bool {
        word.lowercased() != rootWord.lowercased() && !usedWords.contains(word)
    }

    func isPossible(word: String) -> Bool {
        var tempWord = rootWord.lowercased()

        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }

        return true
    }

    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")

        return misspelledRange.location == NSNotFound
    }

    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
