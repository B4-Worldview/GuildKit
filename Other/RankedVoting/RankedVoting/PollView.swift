//
//  PollView.swift
//  RankedVoting
//
//  Created by JP McGlone on 4/24/21.
//

import SwiftUI

public struct PollView: View {
  @ObservedObject var model: PollViewModel

  public var body: some View {
    ScrollView {
      VStack(alignment: .leading, spacing: 10) {
        Text("Selected Items")
          .font(.title)

        ForEach(0..<model.selectedItems.count, id: \.self) { index in
          PollItemCell(rank: index, title: model.selectedItems[index].name)
            .onTapGesture { self.model.toggleItem(model.selectedItems[index]) }
        }

        Spacer(minLength: 0).frame(height: 20)
        Text("Unselected Items")
          .font(.title)

        ForEach(model.unselectedItems) { item in
          PollItemCell(rank: 1000, title: item.name)
            .onTapGesture { self.model.toggleItem(item) }
        }
      }
      .frame(maxWidth: .greatestFiniteMagnitude, alignment: .leading)
      .padding()
    }
  }
}

#if DEBUG
public struct PollView_Previews: PreviewProvider {
  static var model = PollViewModel(
    poll: Poll(
      id: "",
      name: "The Poll",
      items: [
        PollItem(id: "0", name: "Sound of Music"),
        PollItem(id: "1", name: "Other")
      ]
    )
  )
  public static var previews: some View {
    PollView(model: model)
  }
}
#endif
