//
//  ViewController.swift
//  DMFindingGame
//
//  Created by Camden Studdert on 3/19/24.
//

import UIKit

let alphabetArr = ["A", ]

class ViewController: UIViewController {

    
    var targetLetter = ""
    var randomLetters = [String]()
    var score = 0
    let letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    
    
    @IBOutlet var buttonsArr: Array<UIButton>!
    @IBOutlet weak var matchTheLetterLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }
    
    func newRound() {
        let rando = generateRandomLetters(numLetters: buttonsArr.count)
        targetLetter = rando.randomElement()!
        matchTheLetterLabel.text = targetLetter
    }
    
    func generateRandomLetters(numLetters: Int) -> [String] {
        var randomArr: [String] = []
        var loopingNum = 0
        
        while (randomArr.count < numLetters) {
            var r = letters.randomElement()!
            if !randomArr.contains(r){
                randomArr.append(r)
                buttonsArr[loopingNum].setTitle(randomArr[loopingNum], for: .normal)
                loopingNum = loopingNum + 1
            }

            
        }

        
        return randomArr
    }
    
    func calculateNewScore(selectedLetter: String) {
        if selectedLetter == targetLetter {
            score += 1
        } else {
            score = 0
        }
    }

    
    func updateScoreLabel() {
        scoreLabel.text = "\(score)"
    }

    @IBAction func letterButtonTapped(_ sender: UIButton) {
        calculateNewScore(selectedLetter: sender.currentTitle!)
        updateScoreLabel()
        newRound()
    }
    
}
