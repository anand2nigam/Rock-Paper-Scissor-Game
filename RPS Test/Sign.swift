//
//  Sign.swift
//  RPS Test
//
//  Created by Anand Nigam on 01/04/18.
//  Copyright © 2018 Anand Nigam. All rights reserved.
//

import Foundation
import GameplayKit

//to generate a random number with fixed highest and the lowest limit
let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)

//function to select any choice by the program from the random number generated
func randomSign() -> Sign {
    let sign = randomChoice.nextInt()
    if sign == 0{
        return .rock
    }
    else if sign == 1 {
        return .paper
    }
    else {
        return .scissor
    }
}


// enum to define different choices in the game and with a computed property to return string according to the choice
enum Sign {
    case rock , paper , scissor
    
    var emoji:String {
        switch self {
        case .rock:
            return "👊"
        case .paper:
            return "🖐"
        case .scissor:
            return "✌️"
        }
    }
}


// function to declare the result according to the decisions of the program and the player from a different enum for the different states of the result
func result(_ opponentsParameter: Sign) -> GameState  {
    let computersParameter: Sign = randomSign()
    if opponentsParameter == computersParameter  {
        return .Draw
    }
    else if opponentsParameter == .rock && computersParameter == .scissor {
        return .Win
    }
    else if opponentsParameter == .scissor && computersParameter == .paper {
        return .Win
    }
    else if opponentsParameter == .paper && computersParameter == .rock {
        return .Win
    }
    else {
        return .Lose
    }
}


