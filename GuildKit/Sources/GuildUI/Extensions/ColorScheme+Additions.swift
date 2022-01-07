import SwiftUI

public extension ColorScheme {
  var inverse: ColorScheme {
    switch self {
    case .dark:
      return .light
    case .light:
      return .dark
    @unknown default:
      fatalError("An unrecognized ColorScheme was inverted")
    }
  }
}

public extension SwiftUI.Color {
  func withColorScheme(_ colorScheme: ColorScheme) -> SwiftUI.Color {
    self.colorScheme(colorScheme) as! Color
  }
}
