import SwiftUI

class AppEnvironment: ObservableObject {
  enum Sheet: Identifiable {
    case multiSelect, other(String)

    var id: String {
      switch self {
      case .multiSelect:
        return "multiSelect"
      case .other(let text):
        return "other::\(text)"
      }
    }
  }

  @Published var sheet: Sheet?

  func showMultiSelectDemo() {
    sheet = .multiSelect
  }
}
