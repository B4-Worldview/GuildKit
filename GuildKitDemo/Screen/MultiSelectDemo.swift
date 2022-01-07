import GuildKit
import SwiftUI

public struct Item: Identifiable, Equatable {
  public let id = UUID()

  public var name: String
  public var age: Int

  public init(name: String = "John Doe", age: Int = 0) {
    self.name = name
    self.age = age
  }
}

public struct MultiSelectDemo: View {
  @StateObject var selector = MultiSelector(
    items: [
      Item(),
      Item(),
      Item(),
      Item(),
      Item(),
      Item(),
      Item(),
      Item(),
      Item(),
      Item()
    ],
    selectedIndexes: [],
    minimumSelection: 0,
    maximumSelection: 3
  )

  public var body: some View {
    VStack {
      ForEach(0..<selector.items.count) { index in
        Button(action: {
          self.selector.toggleItem(atIndex: index)
        }, label: {
          itemRow(forIndex: index)
        })
      }
    }
  }

  func itemRow(forIndex index: Int) -> some View {
    let item = selector.items[index]

    return HStack {
      Text(selector.rankDisplay(ofIndex: index))

      Spacer()
        .frame(width: 10)

      Text(item.id.uuidString.prefix(5))

      Spacer()

      if selector.isSelected(atIndex: index) {
        Image(fromImageType: .system("checkmark"))
      }
    }
    .padding()
    .eraseToAnyView()
  }
}

#if DEBUG
public struct MultiSelectDemo_Previews: PreviewProvider {
  public static var previews: some View {
    MultiSelectDemo()
  }
}
#endif
