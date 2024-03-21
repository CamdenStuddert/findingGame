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
    
    @IBOutlet weak var topLeftButton: UIButton!
    @IBOutlet weak var topMidButton: UIButton!
    @IBOutlet weak var topRightButton: UIButton!
    @IBOutlet weak var midLeftButton: UIButton!
    @IBOutlet weak var midMidButton: UIButton!
    @IBOutlet weak var midRightButton: UIButton!
    @IBOutlet weak var botLeftButton: UIButton!
    @IBOutlet weak var botMidButton: UIButton!
    @IBOutlet weak var botRightButton: UIButton!
    @IBOutlet weak var matchTheLetterLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }
    
    func newRound() {
        let rando = generateRandomLetters(numLetters: 9)
        targetLetter = rando[Int.random(in: 0...8)]
        matchTheLetterLabel.text = targetLetter
        updateTargetLetterLabel()
        updateLetterButtons()
    }
    
    func generateRandomLetters(numLetters: Int) -> [String] {
        
        var randomArr: [String] = []
        while (randomArr.count < numLetters) {
            var r = Int.random(in: 0...25)
            if !randomArr.contains(letters[r]){
                randomArr.append(letters[r])
            }
        }
        topLeftButton.setTitle(randomArr[0], for: .normal)
        topMidButton.setTitle(randomArr[1], for: .normal)
        topRightButton.setTitle(randomArr[2], for: .normal)
        midLeftButton.setTitle(randomArr[3], for: .normal)
        midMidButton.setTitle(randomArr[4], for: .normal)
        midRightButton.setTitle(randomArr[5], for: .normal)
        botLeftButton.setTitle(randomArr[6], for: .normal)
        botMidButton.setTitle(randomArr[7], for: .normal)
        botRightButton.setTitle(randomArr[8], for: .normal)
        return randomArr
    }
    
    func calculateNewScore(selectedLetter: String) {
        if selectedLetter == targetLetter {
            score += 1
        } else {
            score = 0
        }
    }
    
    func updateTargetLetterLabel() {
        
    }
    
    func updateScoreLabel() {
        scoreLabel.text = "\(score)"
    }
    
    func updateLetterButtons() {
        
    }

    @IBAction func letterButtonTapped(_ sender: UIButton) {
        calculateNewScore(selectedLetter: sender.currentTitle!)
        updateScoreLabel()
        newRound()
    }
    
}
