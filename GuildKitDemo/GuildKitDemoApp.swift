import GuildKit
import SwiftUI

@main
struct GuildKitDemoApp: App {
  @StateObject var logService = LogService()
  @StateObject var environment = AppEnvironment()
  @StateObject var guildEnvironment = GuildEnvironment()

  var body: some Scene {
    WindowGroup {
      ContentView()
        .environmentObject(guildEnvironment)
        .environmentObject(environment)
    }
  }
}
