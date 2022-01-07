import SwiftUI

public struct NotifyingButtonStyle: ButtonStyle {
  @Binding public var isPressed: Bool

  init(isPressed: Binding<Bool>) {
    _isPressed = isPressed
  }

  public func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .onChange(of: configuration.isPressed) { isPressed in
        self.isPressed = isPressed
      }
  }
}
