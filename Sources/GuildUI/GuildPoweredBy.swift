import SwiftUI

public struct GuildPoweredBy: View {
  public var body: some View {
    Text("Powered by GuildKit")
  }
}

#if DEBUG
public struct PoweredBy_Previews: PreviewProvider {
  public static var previews: some View {
    GuildPoweredBy()
  }
}
#endif
