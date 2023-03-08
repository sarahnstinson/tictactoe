//
//  GameSquare.swift
//  tictactoe1
//
//  Created by admin on 2/22/23.
//

import SwiftUI

struct GameSquare{
    var id:Int //to track tiles 1 to 9
    var player:Player? // to know whether player 1 or 2
    var image:Image{
        if let player = player{
            return player.gamePiece.image
        }
        else{
            return Image("none")
        }
    }//end of image
    
    static var reset:[GameSquare]{
        var squares=[GameSquare]()
        for index in 1...9{
            squares.append(GameSquare(id:index))
        }
        return squares
    }
}
