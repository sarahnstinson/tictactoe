//
//  ContentView.swift
//  tictactoe1
//
//  Created by admin on 2/13/23.
//

import SwiftUI

struct StartView: View {
    //state properties: @State
    @State private var gameType: GameType = .undetermined
    //what does the above line mean?!?!
    @State private var yourName ""
    @State private var opponentName = ""
    @FocusState private var fous:Bool
    //state property can be accessed outside the structure and will reflect it later on
    @State private var starGame = false
    @EnvironmentObject var game:GameService
    
    
    //trying to figure out how to add your name and oppponents name
    var body: some View {
        VStack {
            Picker("Select Game",selection: $gameType) {
                //why did it need the $
                Text("Select Game Type").tag(GameType.undetermined)
                Text("Two players sharing a game").tag(GameType.single)
                Text("Challenge your device").tag(GameType.bot)
                Text("Challenge your friend").tag(GameType.peer)
                
                
            }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius:10,style: .continuous).stroke(style:StrokeStyle(linewidth:2)).accentColor(.primary))
        Text(gameType.description)
            .padding()
        
        VStack{
            
            switch gameType{
            case.single:
                TextField("Your Name", text: $yourName)
                TextField("Opponent Name", text: $opponentName
                )
            case.bot:
                TextField("Your Name", text: $yourName)
            
            case.peer:
                EmptyView()
                //we will fix this later
                
            case.undetermined:
                EmptyView()
            }//end for switch
    
        
    }// end for vstack
        .padding()
        .textFieldStyle(.roundedBorder)
        .focused($focus)
        .frame(width: 350)
        
        if gameType != .peer{
            
        
            Buton("Start Game"){
                game.setupGame(gameType: game, player1Name: yourName, player2Name: opponentName)
                focus = false
                startGame.toggle()
            }//end of button
        }//end of it
            .buttonStyle(.borderedProminent)
            .disabled(
                gameType == .undetermined | |
                gameType == .bot && (yourName.isEmpty) | |
                gameType == .single && (yourName.isEmpty || opponentName.isEmpty)
                //what does the && mean?
                //what does the | | mean? - it means "or"
                //why does indentation matter?
            )
        
        Image("LightModeWelcome")
    }
    Spacer()
}
    .padding()
    .fullScreenCover(isPresented: $startGame){
        GameView()
    }
    .navigationTitle("Cross Over")
    .inNavigationStack()


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
            .environmentObject (game())
    }
}
