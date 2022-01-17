import SwiftUI

private let iconSize: CGFloat = 40
private let buttonSize: CGFloat = 70

public  struct IconButton: View {
  @Environment(\.isEnabled) var isEnabled
  @Environment(\.styling) var styling
  @Environment(\.colorScheme) var colorScheme

  @State var isPressed = false

  public var action: () -> Void
  public var type: ImageType

  @State var viewSize: CGSize = .zero

  public var body: some View {
    GuildButton(isPressed: $isPressed, action: action) {
      ZStack {
        icon
      }
      .frame(width: buttonSize, height: buttonSize)
      .background(styling.colors.actionBackground.opacity(isEnabled ? 1 : disabledOpacity))
      .cornerRadius(.greatestFiniteMagnitude)
      .modifier(PressModifier(isPressed: $isPressed, hasShadow: isEnabled))
    }
  }

  var disabledOpacity: Double {
    colorScheme == .light ? 1 : 0.5
  }

  var icon: some View {
    image
      .resizable()
      .aspectRatio(contentMode: .fit)
      .foregroundColor(iconColor)
      .frame(width: iconSize, height: iconSize)
  }

  var iconColor: Color {
    if isEnabled {
      return styling.colors.orange
    }

    // Prefer to make this mask through
    return colorScheme == .light ? styling.colors.darkerBackground : styling.colors.background
  }

  public var image: Image {
    switch type {
    case .named(let name):
      return Image(name)
    case .system(let systemName):
      return Image(systemName: systemName)
    }
  }

  public init(_ type: ImageType = .system("star"), action: @escaping () -> Void = {}) {
    self.type = type
    self.action = action
  }
}

#if DEBUG
public struct IconButton_Previews: PreviewProvider {
  public static let styling = Styling()

  public static var previews: some View {
    HStack {
      IconButton()
        .disabled(true)

      IconButton()
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(styling.colors.background.ignoresSafeArea())
    //    .colorScheme(.dark)
  }
}
#endif
