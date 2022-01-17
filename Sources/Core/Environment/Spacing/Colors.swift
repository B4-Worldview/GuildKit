import SwiftUI

public struct Colors: Hashable {
  // MARK: - Constant
  public let trueBlack = Color(0x000000)
  public let trueWhite = Color(0xffffff)

  // MARK: - Static, Updatable
  public var white = Colors.named("GuildColor.white")
  public var black = Colors.named("GuildColor.black")
  public var gray = Colors.named("GuildColor.gray")

  public var lightGray = Color(0xF0F1F2)
  public var lightGray2 = Color(0xE4E5E7)

  public var green = Colors.named("GuildColor.green")
  public var lightGreen = Color(0xE9FCF2)
  public var darkGreen = Color(0x0D5933)

  public var orange = Colors.named("GuildColor.orange")
  public var lightOrange = Color(0xFEF2E7)
  public var darkOrange = Color(0x914C08)

  public var red = Colors.named("GuildColor.red")
  public var lightRed = Color(0xFCE9E9)
  public var darkRed = Color(0x861313)

  public var yellow = Colors.named("GuildColor.yellow")
  public var lightYellow = Color(0xFFFBE5)
  public var darkYellow = Color(0x665500)

  public var purple = Color(0x835AF6)
  public var lightPurple = Color(0xF2EBF9)
  public var darkPurple = Color(0x662E9E)

  public var blue = Colors.named( "GuildColor.blue")

  // MARK: - Semantic

  public var actionBackground = Colors.named("GuildColor.actionBackground")
  public var actionForeground = Colors.named("GuildColor.actionForeground")

  public var actionPrimary = Color(0x0076CC)
  public var actionSecondary = Color(0x3D73CD)
  public var actionCancel = Color(0x61666B)

  // Backgrounds
  public var background = Colors.named("GuildColor.background")
  public var darkerBackground = Colors.named("GuildColor.darkerBackground")
  public var darkestBackground = Colors.named("GuildColor.darkestBackground")
  public var lightestBackground = Colors.named("GuildColor.lightestBackground")

  public var contentBackground = Color(0xffffff)
  public var text = Color(0x181A1B)
  public var subText = Color(0x94999E)
  public var lyftPurple = Color(0x835AF6)

  public init() {
  }

  private static func named(_ name: String) -> SwiftUI.Color {
    SwiftUI.Color(name, bundle: .module)
  }
}
