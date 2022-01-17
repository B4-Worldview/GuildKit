import SwiftUI

public struct Avatar: View {
  @Environment(\.styling) var styling

  public var name: String

  public var body: some View {
    ZStack {
      Text(initials)
    }
    .frame(width: 100, height: 100)
    .background(styling.colors.actionBackground.cornerRadius(.infinity))
  }

  public var initials: String {
    name
      .split(separator: " ")
      .compactMap {
        $0.first?.uppercased()
      }
      .joined()
  }

  public init(name: String) {
    self.name = name
  }
}

#if DEBUG
public struct Avatar_Previews: PreviewProvider {
  public static let styling = Styling()
  public static var previews: some View {
    VStack {
      Avatar(name: "John McGlone")
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(styling.colors.background)
  }
}
#endif
