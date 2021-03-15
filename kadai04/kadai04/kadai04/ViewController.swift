//
//  ViewController.swift
//  kadai04
//
//  Created by Kaoru Matarai on 2020/08/18.
//  Copyright © 2020 shinonome, inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    enum Hand {
        case rock
        case scissors
        case paper
    }

    enum Result: String {
        case win = "you win!"
        case lose = "you lose..."
        case draw = "you draw"
    }

    var cp: Hand = .rock
    var handNumber: Int = 0
    let jankenList: [Hand] = [.rock, .scissors, .paper]

    @IBOutlet var result: UILabel!
    @IBOutlet var cpFacialExpression: UIImageView!
    @IBOutlet var cpHand: UIImageView!

    @IBOutlet var allButton: [UIButton]!

    @IBOutlet var rockButton: UIButton!
    @IBOutlet var scissorsButton: UIButton!
    @IBOutlet var paperButton: UIButton!

    var defaultCp = Henkan().convert(text: "😃", size: 100)
    let winCp = Henkan().convert(text: "😆", size: 100)
    let drawCp = Henkan().convert(text: "😅", size: 100)
    let loseCp = Henkan().convert(text: "🥺", size: 100)

    let rockHand = Henkan().convert(text: "✊", size: 100)
    let scissorsHand = Henkan().convert(text: "✌️", size: 100)
    let paperHand = Henkan().convert(text: "✋", size: 100)

    override func viewDidLoad() {
        super.viewDidLoad()

        UIButton.appearance().isExclusiveTouch = true

        cpFacialExpression.image = defaultCp
        cpHand.animationImages = [rockHand, scissorsHand, paperHand]
        cpHand.animationDuration = 0.3
        cpHand.animationRepeatCount = 0
        cpHand.startAnimating()

        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(timerUpdate), userInfo: nil, repeats: true)

    }

    @objc private func timerUpdate() {

        cp = jankenList[handNumber]

        if handNumber == 2 {
            handNumber = 0
        } else {
            handNumber += 1
        }
    }

    func janken(you: Hand) {

        for button in allButton {
            button.isEnabled = false
            button.alpha = 0.5
        }

        cpFacialExpression.image = cpHand.image
        cpHand.stopAnimating()

        if cp == .rock {
            cpHand.image = rockHand
        } else if cp == .scissors {
            cpHand.image = scissorsHand
        } else {
            cpHand.image = paperHand
        }

        if (you == .rock) && (cp == .scissors) || (you == .scissors) && (cp ==  .paper) || (you == .paper) && (cp == .rock) {
            result.text = Result.win.rawValue
            cpFacialExpression.image = loseCp
        } else if (you == cp) {
            result.text = Result.draw.rawValue
            cpFacialExpression.image = drawCp
        } else {
            result.text = Result.lose.rawValue
            cpFacialExpression.image = winCp
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { [self] in

            for button in allButton {
                button.isEnabled = true
                button.alpha = 1
            }

            cpFacialExpression.image = defaultCp
            cpHand.startAnimating()

        }
    }

    @IBAction func  Rock(_ sender: UIButton) {
        janken(you: .rock)
    }
    @IBAction func Paper(_ sender: UIButton) {
        janken(you: .paper)
    }
    @IBAction func Scissors(_ sender: UIButton) {
        janken(you: .scissors)
    }
}

