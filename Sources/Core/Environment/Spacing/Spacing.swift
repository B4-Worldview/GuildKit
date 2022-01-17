// swiftlint:disable identifier_name

import Combine
import Foundation
import SwiftUI

public struct Spacing: Hashable {
  public static let _4: CGFloat = 4
  public static let _8: CGFloat = 8
  public static let _12: CGFloat = 12
  public static let _16: CGFloat = 16
  public static let _24: CGFloat = 24
  public static let _32: CGFloat = 32
  public static let _40: CGFloat = 40
  public static let _48: CGFloat = 48
  public static let _64: CGFloat = 64
  public static let _80: CGFloat = 80

  public var formFactor: Styling.FormFactor

  public var large: CGFloat {
    switch formFactor {
    case .mini:
      return Spacing._16
    case .phone, .tablet:
      return Spacing._24
    }
  }

  public var medium: CGFloat {
    switch formFactor {
    case .mini:
      return Spacing._8
    case .phone, .tablet:
      return Spacing._12
    }
  }

  public var small: CGFloat {
    switch formFactor {
    case .mini:
      return Spacing._4
    case .phone, .tablet:
      return Spacing._8
    }
  }

  public var margin: CGFloat {
    switch formFactor {
    case .mini:
      return Spacing._16
    case .phone, .tablet:
      return Spacing._24
    }
  }

  public var innerMargin: CGFloat {
    switch formFactor {
    case .mini:
      return Spacing._12
    case .phone, .tablet:
      return Spacing._16
    }
  }

  public init(formFactor: Styling.FormFactor = .phone) {
    self.formFactor = formFactor
  }
}

public struct Icons: Hashable {
  // Icons, look at a UI System Design

  public init() {
  }
}

public struct Typography: Hashable {
  // Semantic fonts
  // Dynamic fonts enabled

  public init() {
  }
}
