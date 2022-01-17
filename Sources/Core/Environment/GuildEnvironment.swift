import SwiftUI

public class GuildEnvironment: ObservableObject {
  @Published public var styling: Styling

  public init(styling: Styling = Styling()) {
    self.styling = styling
  }
}
