//
//  ViewController.swift
//  Christian_applePie
//
//  Created by Christian Severin on 3/4/21.
//

import UIKit

class ViewController: UIViewController {

   //hello
    //backEnd
    @IBOutlet var letterButton: [UIButton]!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var listOfWords = ["jevonnie", "cassandra", "rachel", "dagoat", "bestie"]
    
    let lives = 7
    
    var totalWins = 0{
        didSet{
            newRound()
        }
    }
    
    var totalLoses = 0{
        didSet{
            newRound()
        }
    }
    
    @IBOutlet weak var imageView1: UIImageView!
    
    var currentGame: Game!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }
    
    func newRound(){
        if !listOfWords.isEmpty {
            let newWord = listOfWords.removeFirst()
                currentGame = Game(word: newWord, movesRemaning: lives, guessedLetters:[])
                enableLetterButtons(true)
                updateUI()
            }
            else {
                enableLetterButtons(false)
                }
            }
    func enableLetterButtons(_ enable: Bool){
        for button in letterButton{
            button.isEnabled = enable
            }
        }

    @IBAction func buttonPressed(_ sender: UIButton){
        sender.isEnabled = false
        
            let letterString = sender.title(for: .normal)!
            let letter = Character(letterString.lowercased())
                currentGame.playerGuessed(letter: letter)
                updateGameState()
        }
    
    func updateUI(){
        var letters = [String]()
            for letter in currentGame.formattedWord{
                letters.append(String(letter))
        }

        let wordWithSpacing = letters.joined(separator: " ")
            correctWordLabel.text = wordWithSpacing
            scoreLabel.text = "Win: \(totalWins), Loses: \(totalLoses)"
            imageView1.image = UIImage(named: "Tree \(currentGame.movesRemaning)")
        }
    
    func updateGameState(){
        if currentGame.movesRemaning == 0 {
            totalLoses += 1
            }
            else if currentGame.word == currentGame.formattedWord {
                totalWins += 1
            }
            else {
                updateUI()
                }
            }
        }

