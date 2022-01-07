import SwiftUI

public struct GameLight: View {
  var light: Light

  public var body: some View {
    VStack {
      Text("State: \(light.state)")
        .foregroundColor(light.isOn ? .black : .white)
        .animation(.none)
      Text("isOn: \(light.isOn ? "true" : "false")")
        .foregroundColor(light.isOn ? .black : .white)
        .font(.caption)
        .animation(.none)
    }
    .padding()
    .frame(width: 100, height: 100)
    .background(color)
    .animation(.easeIn(duration: 0.1), value: light.state)
  }

  var color: Color {
    switch light.state {
    case 0: return .black
    case 1: return .yellow
    case 2: return .green
    default: return .red
    }
  }
}

#if DEBUG
public struct GameLight_Previews: PreviewProvider {
  public static var previews: some View {
    GameLight(light: Light(state: 0))
  }
}
#endif
