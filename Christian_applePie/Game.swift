//
//  Game.swift
//  Christian_applePie
//
//  Created by Christian Severin on 3/9/21.
//

import Foundation

struct Game{
    var word: String
    var movesRemaning: Int
    var guessedLetters: [Character]
    var formattedWord: String{
    var guessedWord = ""
        
        for letter in word {
            if guessedLetters.contains(letter){
                guessedWord += "\(letter)"
        }
            else {
                guessedWord += "_"
                }
            }
            return guessedWord
        }

        mutating func playerGuessed(letter: Character) {
                guessedLetters.append(letter)
            if !word.contains(letter) {
                movesRemaning -= 1
                }
            }
        }
