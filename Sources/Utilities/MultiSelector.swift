import SwiftUI

public class MultiSelector<T>: ObservableObject {
  @Published public var items: [T]
  @Published public var selectedIndexes: [Int]

  // Consider being redundant instead
  public var selectedItems: [T] {
    selectedIndexes.map { items[$0] }
  }

  public var unselectedIndexes: [Int] {
    var indexes = [Int]()
    for index in (0..<items.count) {
      if !selectedIndexes.contains(index) {
        indexes.append(index)
      }
    }
    return indexes
  }

  public var unselectedItems: [T] {
    unselectedIndexes.map { items[$0] }
  }

  public var minimumSelection: Int
  public var maximumSelection: Int

  public init(items: [T], selectedIndexes: [Int] = [], minimumSelection: Int = 0, maximumSelection: Int = .max) {
    self.items = items
    self.selectedIndexes = selectedIndexes
    self.minimumSelection = minimumSelection
    self.maximumSelection = maximumSelection
  }

  public func deselectItem(atIndex index: Int) {
    if selectedIndexes.count > minimumSelection {
      selectedIndexes.removeAll { $0 == index }
    }
  }

  public func selectItem(atIndex index: Int) {
    if selectedIndexes.count >= maximumSelection {
      selectedIndexes.removeLast()
    }

    selectedIndexes.append(index)
  }

  public func toggleItem(atIndex index: Int) {
    isSelected(atIndex: index) ? deselectItem(atIndex: index) : selectItem(atIndex: index)
  }

  public func isSelected(atIndex index: Int) -> Bool {
    selectedIndexes.contains { $0 == index }
  }

  public func rank(ofIndex index: Int) -> Int {
    if let index = selectedIndexes.firstIndex(where: { $0 == index }) {
      return index
    }
    return -1
  }

  public func rankDisplay(ofIndex index: Int) -> String {
    let rank = self.rank(ofIndex: index)

    if rank > -1 {
      return "\(rank)."
    }

    return ""
  }
}

public extension MultiSelector where T: Equatable {
  func isSelected(item: T) -> Bool {
    selectedItems.contains(item)
  }

  func firstIndex(of item: T) -> Int? {
    items.firstIndex(of: item)
  }

  func indices(of item: T) -> [Int] {
    selectedItems.indexes(of: [item])
  }

  func rank(ofItem item: T) -> Int? {
    firstIndex(of: item)
  }
}
