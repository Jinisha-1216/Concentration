//
//  PracticeFile.swift
//  Concentration
//
//  Created by Jinisha Savani on 2/9/20.
//  Copyright © 2020 Jinisha Savani. All rights reserved.
//

import Foundation

class ConcentrationModel {
    
    var cards = [CardModel]()
    var indexOfOneAndOnlyFaceUpCard: Int?
 
    func chooseCard(at index: Int) {
        
        if cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier = cards[index] {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            }
            else {
                //either no card or two card are faced up
                 
            }
        }
        
//        if cards[index].isFaceUp {
//            cards[index].isFaceUp = false
//        }
//        else {
//            cards[index].isFaceUp = true
//        }
    }
    
     init(numberOfPairsOfCards: Int) {
         for _ in 1...numberOfPairsOfCards {
             let card = CardModel()
             cards += [card, card]
         }
     }
    
    //TODO: Shuffle the Cards
}
