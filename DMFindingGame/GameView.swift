//
//  ViewController.swift
//  DMFindingGame
//
//  Created by Camden Studdert on 3/19/24.
//

import UIKit

class GameView: UIViewController {
    
    @IBOutlet var buttonsArr: Array<UIButton>!
    @IBOutlet weak var matchTheLetterLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timeLeftBar: UIProgressView!
    
    var timer: Timer!
    let gameBrain = GameBrain.shared
    var loopingNum = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureTimer()
        timeLeftBar.transform = timeLeftBar.transform.scaledBy(x: 1, y: 3)
        timeLeftBar.progress = 1.0
        randomize()
        gameBrain.newGame(arrayCount: buttonsArr.count)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        timer.invalidate()
    }
    
    func configureTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: fireTimer(timer:))
        RunLoop.current.add(timer, forMode: .common)
    }
    
    func fireTimer(timer: Timer) {
        let totalTime = 30
        let percentageProgress = Float(gameBrain.secondsRemaining) / Float(totalTime)
        timeLeftBar.progress = percentageProgress
        gameBrain.secondsRemaining -= 1
        
        if gameBrain.secondsRemaining <= 0 {
            timer.invalidate()
            gameBrain.score = 0
            navigationController?.popViewController(animated: true)
        }
    }
    
    func randomize(){
        loopingNum = 0
        let buttonTitles = gameBrain.newRound(newGame: buttonsArr.count)
        matchTheLetterLabel.text = buttonTitles.randomElement()
        for buttonTitle in buttonTitles {
            buttonsArr[loopingNum].setTitle("\(buttonTitle)", for: .normal)
            loopingNum += 1
        }
    }
    
    @IBAction func letterButtonTapped(_ sender: UIButton) {
        if sender.currentTitle == matchTheLetterLabel.text {
            sender.backgroundColor = .green
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                sender.backgroundColor = .clear
            })
            randomize()
            gameBrain.score += 1
            scoreLabel.text = "Score: \(gameBrain.score)"
            if gameBrain.score > gameBrain.highScore {
                gameBrain.highScore = gameBrain.score
                print(gameBrain.highScore)
            }
        } else {
            sender.backgroundColor = .red
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                sender.backgroundColor = .clear
            })
            randomize()
        }
    }
    
}

