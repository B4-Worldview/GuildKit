import SwiftUI
import GuildKit

struct GameView: View {
  @ObservedObject var game: Game

  var body: some View {
    ScrollView(.horizontal) {
      HStack {
        ForEach(0..<game.total) { index in
          if index < game.lights.count {
            let light = game.lights[index]
            
            GameLight(light: light)
              .onTapGesture {
                game.lights[index].toggle()
              }
              .eraseToAnyView()
            
          } else {
            Color.gray.frame(width: 100, height: 100).eraseToAnyView()
          }
        }
      }
    }
  }
}

struct GameView_Previews: PreviewProvider {
  static var game = Game()
  
  static var previews: some View {
    GameView(game: game)
  }
}
