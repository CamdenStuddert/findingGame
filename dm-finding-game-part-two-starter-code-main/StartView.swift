//
//  StartViewController.swift
//  DMFindingGame
//
//  Created by David Ruvinskiy on 4/17/23.
//

import UIKit

class StartView: UIViewController {
    let gameBrain = GameBrain.shared
    
    @IBOutlet weak var highScoreLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        highScoreLabel.text = "High Score: \(gameBrain.highScore)"
    }
    
    @IBAction func startHerePressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToGameView", sender: self)
    }
}
