import SwiftUI

struct PressModifier: ViewModifier {
  enum Direction {
    case `in`, out
  }

  @Binding var isPressed: Bool

  var direction: Direction
  var hasShadow: Bool

  var scale: CGFloat {
    let amount = 0.08
    return direction == .in ? CGFloat(1 - amount) : CGFloat(1 + amount)
  }

  private var shadowColor: SwiftUI.Color {
    if hasShadow {
      return Color.black.opacity(isPressed ? (direction == .in ? 0.0 : 0.2) : 0.1)
    } else {
      return Color.clear
    }
  }

  init(isPressed: Binding<Bool>, direction: Direction = .out, hasShadow: Bool = true) {
    _isPressed = isPressed
    self.direction = direction
    self.hasShadow = hasShadow
  }

  func body(content: Content) -> some View {
    content
      .shadow(color: shadowColor, radius: 4, x: 0, y: 1)
      .scaleEffect( !isPressed ? 1.0 : scale )
      .animation(.easeInOut(duration: 0.1), value: isPressed)
  }
}

extension View {
  func press(_ isPressed: Binding<Bool>) -> some View {
    self.modifier(PressModifier(isPressed: isPressed))
  }
}
