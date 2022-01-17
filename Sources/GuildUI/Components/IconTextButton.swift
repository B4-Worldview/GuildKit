import SwiftUI

public struct IconTextButton: View {
  @Environment(\.styling) var styling
  @Environment(\.colorScheme) var colorScheme

  @State var isPressed = false

  public var iconColor: SwiftUI.Color

  private var iconBackgroundColor: SwiftUI.Color {
    colorScheme == .light ? styling.colors.gray : styling.colors.white
  }

  public var text: String
  public var type: ImageType
  public var action: () -> Void

  public var body: some View {
    GuildButton(isPressed: $isPressed, action: action) {
      HStack {
        Image(fromImageType: type)
          .aspectRatio(contentMode: .fit)
          .frame(width: 20, height: 20)
          .padding(2)
          .background(iconBackgroundColor)
          .cornerRadius(.greatestFiniteMagnitude)
          .press($isPressed)
          .foregroundColor(iconColor)

        Text(text)
          .font(.title3)
          .offset(x: isPressed ? -3 : 0, y: 0)
          .animation(.linear(duration: 0.1), value: isPressed)
      }
      .foregroundColor(iconBackgroundColor)
      .padding(5)
    }
  }

  // If no iconColor is set, uses `styling.colors.background`
  public init(_ text: String, type: ImageType = .system("plus"), action: @escaping () -> Void = {}) {
    self.init(text, type: type, iconColor: .clear, action: action)

    self.iconColor = styling.colors.background
  }

  public init(_ text: String, type: ImageType = .system("plus"), iconColor: SwiftUI.Color, action: @escaping () -> Void = {}) {
    self.text = text
    self.type = type
    self.iconColor = iconColor
    self.action = action
  }
}

#if DEBUG
struct IconText_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      IconTextButton("Options")
        .preferredColorScheme(.dark)
      IconTextButton("Options")
        .preferredColorScheme(.light)
    }
  }
}
#endif
