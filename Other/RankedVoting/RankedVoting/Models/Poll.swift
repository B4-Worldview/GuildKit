import GuildKit
import SwiftUI

struct Poll: Identifiable, Equatable {
  var id: String
  var name: String
  var items: [PollItem]
}

struct PollItem: Identifiable, Equatable {
  var id: String
  var name: String
}

struct PollItemResult: Identifiable, Equatable {
  var id: String { item.id }
  var item: PollItem
  var score: Int
}

struct PollResult: Identifiable, Equatable {
  var id: String
  var name: String
  var items: [PollItem]
  var selectedItems: [PollItem]
  var unselectedItems: [PollItem]

  // TODO: different strategies
  // func scores(strategy) -> scores
  // function to calculate the scores with strategiies, instaed of computed
  var scores: [PollItemResult] {
    var score = items.count

    var results: [PollItemResult] = []

    for item in selectedItems {
      results.append(PollItemResult(item: item, score: score))
      score -= 1
    }

    return results
  }
}
