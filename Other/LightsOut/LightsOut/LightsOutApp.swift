//
//  LightsOutApp.swift
//  LightsOut
//
//  Created by JP McGlone on 2/13/21.
//

import SwiftUI

@main
struct LightsOutApp: App {
  @StateObject var game: Game = Game()

  var body: some Scene {
    WindowGroup {
      GameView(game: game)
    }
  }
}
