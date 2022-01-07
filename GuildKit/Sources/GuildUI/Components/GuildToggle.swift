import SwiftUI

public struct GuildToggle: View {
  @Binding public var isOn: Bool

  @State private var isPressed = false

  private var onColor: SwiftUI.Color
  private var offColor: SwiftUI.Color

  private var width: CGFloat = 60
  private var height: CGFloat = 35

  private var animationDuration: Double = 0.3

  public var body: some View {
    GuildButton(isPressed: $isPressed, action: { isOn.toggle() }) {
      color
        .frame(width: width, height: height)
        .mask(Capsule().frame(width: width, height: height))
        .overlay(indicator, alignment: isOn ? .trailing : .leading)
        .animation(.easeInOut(duration: animationDuration), value: isOn)
        .modifier(PressModifier(isPressed: $isPressed, direction: .in, hasShadow: false))
    }
  }

  private var color: some View {
    (isOn ? onColor : offColor)
      .animation(.easeInOut(duration: animationDuration), value: isOn)
  }

  private var indicator: some View {
    Indicator(isOn: $isOn)
      .frame(width: 25, height: 25)
      .padding(5)
  }

  public init(isOn: Binding<Bool>, onColor: SwiftUI.Color = SwiftUI.Color.green, offColor: SwiftUI.Color = Color.red) {
    self._isOn = isOn
    self.onColor = onColor
    self.offColor = offColor
  }
}

#if DEBUG
public struct Toggle_Previews: PreviewProvider {
  public static var previews: some View {
    GuildToggle(isOn: Binding.constant(false), onColor: .green)
  }
}
#endif
