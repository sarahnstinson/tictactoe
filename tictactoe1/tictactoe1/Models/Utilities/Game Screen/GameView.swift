//
//  GameView.swift
//  tictactoe1
//
//  Created by admin on 2/15/23.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var game:GameService
    @Environment(\.dismiss) var dismiss
    var body: some View {
    }
    VStack {
        if[game.player1.isCurrent, game.player2.isCurrent].allSatisfy{$0 == false}{
        Text("Select A Player to Start")
    }
        
        HStack{
            Button(game.player1.name){
                game.player1.isCurrent = true
            }
            .buttonStyle(PlayerButtonStyle(isCurrent: game.player1.isCurrent))
            
            
            Button(game.player2.name){
                game.player2.isCurrent = true
            }
            .buttonStyle(PlayerButtonStyle(isCurrent:game.player1.isCurrent))
        }// end of hstack
        .disabled(game.gameStarted)
        
        //create a gameboard
        VStack{
            HStack{
                ForEach(0...2, id:\.self){
                    index in SquareView(index: index)
            }//end of hstack
                
                HStack{
                    ForEach(3...5, id:\.self){
                        index in SquareView(index: index)
                        }//end of hstack
                    
                    HStack{
                        ForEach(6...8, id:\.self){
                            index in SquareView(index: index)
                            }//end of hstack
                        
                        
                    }//end of vstack
                    .disabled(game.boardDisabled)
                    
                    VStack{
                        //results of game
                        if game.gameOver{
                            Text("Game Over")
                            if game.possibleMoves.isEmpty{
                                Text("It's a draw!")
                            
                            }//end of is empty check
                            else{
                                Text(("\(game.currentPlayer.name) wins"))
                            }//end of else
                            Button("New Game") {
                                game.reset()
                            }//end of button
                            .buttonStyle(.borderedProminent)
                        }//end of gameOver check
                    }//end of vstack
                    .font(.largeTitle)
            
                    
        Spacer()
    
    var body: some View {
        Vstack{
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }.toolbar{
            ToolbarItem(placement: .navigationBarTrailing)
        }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
        struct PlayerButtonStyle:ButtonStyle{
            let isCurrent:Bool
            func makeBody(configuration: Configuration) -> some View {
                configuration.label
                .padding(8)
                .background(RoundedRectangle(cornerRadius: 8))
                .fill(isCurrent ? Color.green:Color.purple)
                .foregroundColor(.white)
            }
            
