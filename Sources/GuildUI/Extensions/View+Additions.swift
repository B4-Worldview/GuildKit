import SwiftUI

public extension View {
  /// Bind any `CGFloat` value within a `GeometryProxy` value
  /// to an external binding.
  func bindGeometry(
    to binding: Binding<CGRect>,
    reader: @escaping (GeometryProxy) -> CGRect
  ) -> some View {
    self.background(GeometryBinding(reader: reader))
      .onPreferenceChange(GeometryPreference.self) {
        binding.wrappedValue = $0
      }
  }
}

// CGRect
private struct GeometryBinding: View {
  let reader: (GeometryProxy) -> CGRect

  var body: some View {
    GeometryReader { geo in
      Color.clear.preference(
        key: GeometryPreference.self,
        value: self.reader(geo)
      )
    }
  }
}

private struct GeometryPreference: PreferenceKey {
  typealias Value = CGRect

  static var defaultValue: CGRect = .zero

  static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
    value = nextValue()
  }
}

public extension View {
  func eraseToAnyView() -> AnyView { AnyView(self) }

  func inverseMask<M: View>(_ mask: M) -> some View {
    // exchange foreground and background
    let inversed = mask
      .foregroundColor(.black)  // hide foreground
      .background(Color.white)  // let the background stand out
      .compositingGroup()       // composite all layers
      .luminanceToAlpha()       // turn luminance into alpha (opacity)
    return self.mask(inversed)
  }
}

public extension View {
  func asButton(action: @escaping () -> Void) -> SwiftUI.Button<Self> {
    SwiftUI.Button<Self>(action: action, label: {
      self
    })
  }
}
