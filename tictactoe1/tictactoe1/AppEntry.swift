//
//  AppEntry.swift
//  tictactoe1
//
//  Created by admin on 2/22/23.
//

import SwiftUI

@main
struct AppEntry: App {
    @StateObject var game = GameService()
    var body: some Scene{
        WindowGroup{
            StartView()
                .environmentObject(game)
        }
    }
}
