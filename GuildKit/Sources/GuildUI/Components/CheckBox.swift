import SwiftUI

private let checkBoxSize: CGFloat = 50
private let iconSize: CGFloat = 15

public struct CheckBox: View {
  @Environment(\.styling) var styling
  @Environment(\.colorScheme) var colorScheme

  @Binding public var isChecked: Bool

  @State private(set) var isPressed = false

  public var body: some View {
    GuildButton(isPressed: $isPressed, action: { self.isChecked.toggle() }) {
      imageOrEmpty
        .foregroundColor(styling.colors.actionForeground)
        .frame(width: iconSize, height: iconSize)
        .frame(width: checkBoxSize, height: checkBoxSize)
        .background(isChecked ? styling.colors.actionBackground : styling.colors.background)
        .cornerRadius(2)
        .overlay(
          RoundedRectangle(cornerRadius: 0.5, style: .circular)
            .stroke(styling.colors.actionBackground, lineWidth: 2))
    }
    .modifier(PressModifier(isPressed: $isPressed, direction: .in, hasShadow: false))
  }

  var imageOrEmpty: some View {
    if isChecked {
      return Image(systemName: "checkmark")
        .resizable()
        .font(.system(size: iconSize, weight: .bold, design: .rounded))
        .eraseToAnyView()
    } else {
      return Color.clear
        .eraseToAnyView()
    }
  }

  public init(isChecked: Binding<Bool>) {
    _isChecked = isChecked
  }
}

#if DEBUG
// Refactor
struct GuildCheckView_Preview: PreviewProvider {
  struct GuildCheckBoxViewHolder: View {
    @State var isChecked = true

    var body: some View {
      CheckBox(isChecked: $isChecked)
        .frame(width: 100, height: 100)
    }
  }

  static var previews: some View {
    GuildCheckBoxViewHolder()
  }
}

#endif
