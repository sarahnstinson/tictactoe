//
//  SquareView.swift
//  tictactoe1
//
//  Created by admin on 2/27/23.
//

import SwiftUI

struct SquareView: View {
    @EnvironmentObject var game:GameService
    let index: Int
    
    var body: some View {
        Button{
            game.makeMove(at: index)
        } label: {
            game.gameBoard[index].image
                .resizable()
                .frame(width:100, height:100)
                .border(.primary)
        }
        .disabled(game.gameBoard[index].player != nil)
    }
}

struct SquareView_Previews: PreviewProvider {
    static var previews: some View {
        SquareView(index: 1)
            .environmentObject(GameService())
    }
}
