import SwiftUI

public struct TouchUpInside: ViewModifier {
  @Binding public var isPressed: Bool
  public var action: () -> Void
  public var cancelAction: (() -> Void)?

  public init(isPressed: Binding<Bool>, action: @escaping () -> Void, cancelAction: (() -> Void)? = nil) {
    _isPressed = isPressed
    self.action = action
  }

  public func body(content: Content) -> some View {
    content
      .asButton(action: action)
      .buttonStyle(NotifyingButtonStyle(isPressed: self.$isPressed))
      .simultaneousGesture(
        DragGesture()
          .onEnded { _ in
            if !isPressed {
              self.cancelAction?()
            }
          }
      )
      .highPriorityGesture(
        TapGesture().onEnded(action)
      )
  }
}
