import Combine
import GuildKit
import SwiftUI

class PollViewModel: ObservableObject {
  @Published var poll: Poll
  @Published private var selector: MultiSelector<PollItem>

  var items: [PollItem] {
    set {
      selector.items = newValue
    }
    get {
      selector.items
    }
  }

  var cancellables = Set<AnyCancellable>()
  var selectedIndexes: [Int] {
    selector.selectedIndexes
  }

  var selectedItems: [PollItem] {
    selector.selectedItems
  }

  var unselectedItems: [PollItem] {
    selector.unselectedItems
  }

  init(poll: Poll) {
    self.poll = poll
    self.selector = MultiSelector(
      items: poll.items,
      selectedIndexes: [],
      minimumSelection: 0,
      maximumSelection: poll.items.count
    )

    selector
      .$selectedIndexes
      .sink { [weak self] _ in
      self?.objectWillChange.send()
    }.store(in: &cancellables)

    selector
      .$items
      .sink { [weak self] _ in
      self?.objectWillChange.send()
    }.store(in: &cancellables)
  }

  func toggleIndex(_ index: Int) {
    selector.toggleItem(atIndex: index)
  }

  func toggleItem(_ item: PollItem) {
    if let index = selector.firstIndex(of: item) {
      selector.toggleItem(atIndex: index)
    }
  }
}
