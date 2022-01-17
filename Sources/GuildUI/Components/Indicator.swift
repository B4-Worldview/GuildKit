//
//  Indicator.swift
//  GuildKit
//
//  Created by JP McGlone on 2/6/21.
//

import SwiftUI

public struct Indicator: View {
  @Binding public var isOn: Bool

  public var body: some View {
    Circle()
      .strokeBorder(Color.white, lineWidth: isOn ? 20 : 5)
  }
}
