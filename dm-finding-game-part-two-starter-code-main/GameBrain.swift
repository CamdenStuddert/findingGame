//
//  GameBrain.swift
//  DMFindingGame
//
//  Created by David Ruvinskiy on 4/17/23.
//

import Foundation

class GameBrain {

    var targetLetter: String = ""
    var randomLetters = [String]()
    var score: Int = 0
    var highScore = 0
    var numLetters: Int = 0
    var secondsRemaining = 30
    let letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    
    func generateRandomLetters(randomLetters: Int) -> [String] {
        var randomArr: [String] = []
        var loopingNum = 0
        
        while (randomArr.count < randomLetters) {
            let r = letters.randomElement()!
            if !randomArr.contains(r){
                    randomArr.append(r)
                    loopingNum = loopingNum + 1
                }
        }
            return randomArr
    }
    
    func newRound(newGame: Int) -> [String] {
        let rando = generateRandomLetters(randomLetters: newGame)
        targetLetter = rando.randomElement()!
        return rando
    }
    
    func newGame(arrayCount: Int){
        numLetters = arrayCount
        score = 0
        secondsRemaining = 30
    }
    
    @objc func updateTimer() -> Float {
        let totalTime = 30
        var percentageProgress: Float = 0.0
        if secondsRemaining < totalTime {
            percentageProgress = Float(secondsRemaining)  / Float(totalTime)
        }
        return percentageProgress
    }

    static let shared = GameBrain()
}
