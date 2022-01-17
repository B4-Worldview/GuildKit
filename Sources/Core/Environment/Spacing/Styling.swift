import SwiftUI

public struct Styling {
  public enum FormFactor: String {
    case mini, phone, tablet
  }

  public var spacing: Spacing
  public var colors: Colors
  //  public var typography: Typography

  public init(spacing: Spacing = Spacing(), colors: Colors = Colors()) {
    self.spacing = spacing
    self.colors = colors
  }
}

// MARK: - Environment(\.styling)

public struct StylingEnvironmentKey: EnvironmentKey {
  public static var defaultValue = Styling()
}

public extension EnvironmentValues {
  var styling: Styling {
    get { self[StylingEnvironmentKey.self] }
    set { self[StylingEnvironmentKey.self] = newValue }
  }
}

public extension View {
  func setStyling(_ value: Styling) -> some View {
    environment(\.styling, value)
  }
}
