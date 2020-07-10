//
//  ViewController.swift
//  Concentration
//
//  Created by Jinisha Savani on 2/8/20.
//  Copyright © 2020 Jinisha Savani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var model = ConcentrationModel(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }

    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender){
        
            model.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = model.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }
            else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ?  #colorLiteral(red: 1, green: 0.557774961, blue: 0.3087428212, alpha: 0) : #colorLiteral(red: 0.9994052052, green: 0.5836589336, blue: 0.01041303948, alpha: 1)
            }
        }
    }
    
    var emojiChoices = ["👻", "🤡", "🤑", "😍", "🧞‍♀️", "🐶", "🐒", "🐬"]
    var emoji = [Int:String]()
    
    func emoji(for card: CardModel) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
}

