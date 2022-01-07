import SwiftUI

/// An abstract Button component that functions like UIKit's `touchUpInside` in that there is a pressed and unpressed state, and
/// actions execute only if the button is released while the user's finger is still inside the control.
/// Use $isPressed to determine when the button is pressed so you can implement cusom designs / animations
public struct GuildButton<Label: View>: View {
  @Binding public var isPressed: Bool
  public var action: () -> Void

  var label: Label
  public var body: some View {
    label.modifier(TouchUpInside(isPressed: $isPressed, action: action))
  }

  public init(isPressed: Binding<Bool>, action: @escaping () -> Void, label: () -> Label) {
    _isPressed = isPressed
    self.action = action
    self.label = label()
  }
}
