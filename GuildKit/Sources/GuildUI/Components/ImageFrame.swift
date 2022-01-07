import SwiftUI

public struct ImageFrame<Content: View, Footer: View>: View {
  let content: Content
  let footer: Footer

  let color: SwiftUI.Color
  let borderWidth: CGFloat

  public var body: some View {
    ZStack(alignment: .bottom) {
      content
        .clipped()
        .overlay(
          Rectangle()
            .strokeBorder(color, lineWidth: borderWidth)
        )
    }
    .overlay(footerOverlay, alignment: .bottom)
  }

  private var footerOverlay: some View {
    footer
      .frame(maxWidth: .greatestFiniteMagnitude)
      .background(color)
  }

  public init(color: SwiftUI.Color = Color.red, borderWidth: CGFloat = 4, @ViewBuilder content: () -> Content, @ViewBuilder footer: () -> Footer) {
    self.color = color
    self.borderWidth = borderWidth
    self.content = content()
    self.footer = footer()
  }
}

struct ImageFrame_Previews: PreviewProvider {
  static var previews: some View {
    ImageFrame(content: {
      Image("superMarioKart", bundle: Guild.bundle)
        .resizable()
        .aspectRatio(contentMode: .fill)
        .frame(width: 200, height: 200)
    }, footer: {
      Text("Footer")
        .bold()
        .foregroundColor(.white)
        .padding()
    })
      .frame(width: 200, height: 200, alignment: .center/*@END_MENU_TOKEN@*/)
  }
}
