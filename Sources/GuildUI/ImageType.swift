import SwiftUI

public enum ImageType {
  case system(String)
  case named(String)

  var image: Image {
    switch self {
    case .named(let name):
      return Image(name)
    case .system(let systemName):
      return Image(systemName: systemName)
    }
  }
}
