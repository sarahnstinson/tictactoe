//
//  GameModels.swift
//  tictactoe1
//
//  Created by admin on 2/13/23.
//

import SwiftUI

enum GameType {
case single, bot, peer, undetermined
    
    var description: String {
        switch self {
            //automatically made the cases itself because it remembers
        case .single:
            return "Share your device to play against a friend "
        case .bot:
            return "play with your device"
        case .peer:
            return "Invite with the app near you and play"
        case .undetermined:
            return " "
        }
    }
}
enum GamePieve: String{
    case x,o
    var image:Image{
        image(self,rawValue)
    }
}
struct Player{
    let gamePiece:GamePiece
    var name:String
    var moves:[Int] = []
    var isCurrent = false
    var isWinner:Bool{
        for moves in Moves.winningMoves{
            if moves.allSatisfy(self.moves.contains){
                return true
            }
        }
        return false
    }
    
}

enum Moves{
    //array called all and make it static and put in all the numbers
    static var all = [1,2,3,4,5,6,7,8,9]
    //arrays can be multi dimensional
    //static in order so hackers can't come in and change this
    static var winningMoves = [
    [1,2,3],
    [4,5,6],
    [7,8,9],
    [1,4,7],
    [2,5,8],
    [3,6,9],
    [1,5,9],
    [3,5,7],
}
