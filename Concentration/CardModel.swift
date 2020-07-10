//
//  CardModel.swift
//  Concentration
//
//  Created by Jinisha Savani on 2/9/20.
//  Copyright © 2020 Jinisha Savani. All rights reserved.
//

import Foundation

struct CardModel {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identfierFactory = 0
    static func getUniqueIdentifier() -> Int {
        identfierFactory += 1
        return identfierFactory
    }
    
    init() {
        self.identifier = CardModel.getUniqueIdentifier()
    }
}
