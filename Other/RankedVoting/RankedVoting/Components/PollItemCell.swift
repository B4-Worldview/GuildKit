import GuildKit
import SwiftUI

public struct PollItemCell: View {
  var rank: Int
  var title: String

  public var body: some View {
    HStack {
      Text(title)
        .foregroundColor(foregroundColor)
    }
    .frame(maxWidth: .greatestFiniteMagnitude)
    .frame(height: 60)
    .background(backgroundColor)
  }

  var foregroundColor: Color {
    switch rank {
    case 0, 1, 3: return Guild.Color.white
    case 2, 4: return Guild.Color.black
    default: return Guild.Color.white
    }
  }
  var backgroundColor: Color {
    switch rank {
    case 0: return Guild.Color.blue
    case 1: return Guild.Color.red
    case 2: return Guild.Color.white
    case 3: return Guild.Color.yellow
    case 4: return Guild.Color.green
    default: return Guild.Color.gray
    }
  }
}

#if DEBUG
public struct PollItemCell_Previews: PreviewProvider {
  public static var previews: some View {
    VStack(spacing: 10) {
      PollItemCell(rank: 0, title: "ABC")
      PollItemCell(rank: 1, title: "ABC")
      PollItemCell(rank: 2, title: "ABC")
      PollItemCell(rank: 3, title: "ABC")
      PollItemCell(rank: 4, title: "ABC")
      PollItemCell(rank: 5, title: "ABC")
    }
  }
}
#endif
