import Foundation

public extension Array where Element: Equatable {
  func indexes(of items: [Element]) -> [Int] {
    var result: [Int] = []

    for (index, element) in enumerated() {
      if items.contains(element) {
        result.append(index)
      }
    }
    return result
  }
}
