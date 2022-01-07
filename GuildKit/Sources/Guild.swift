import SwiftUI

// This is used to get the bundle for GuildKit
private class GuildClass { }

public enum Guild {
  public static let bundle = Bundle(for: GuildClass.self)

  // Consider Swiftgen?
  // Move to Environment?
  public static var version: String { "1.0.0" }
}
