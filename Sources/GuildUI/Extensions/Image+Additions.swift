//
//  Image+Additions.swift
//  GuildKit
//
//  Created by JP McGlone on 1/28/21.
//

import SwiftUI

public extension Image {
  init(fromImageType imageType: ImageType) {
    switch imageType {
    case .named(let name):
      self.init(name)
    case .system(let systemName):
      self.init(systemName: systemName)
    }
  }
}
