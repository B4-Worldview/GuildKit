import SwiftUI

class Game: ObservableObject {
  @Published var lights = [
    Light(state: 1),
    Light(state: 1),
    Light(numberOfStates: 3)
  ]

  @Published var columns = 3
  @Published var rows = 5

  var total: Int { columns * rows }

  func touch(row: Int, column: Int) {
    // TODO: toggle lights according to the light's Strategy
    // DEFAULT: toggle SELF, one up, one down, one left, one right

    var newLights = lights
    // TODO: update the newLights

    lights = newLights
  }

  private func didWin() -> Bool {
    for light in lights {
      if light.isOn {
        return false
      }
    }

    return true
  }
}

enum LightStrategy {
  case plus, vertical, horizontal, diagonal, up, left, down, right, monster
}

struct Light: Identifiable {
  let id = UUID()

  var strategy = LightStrategy.plus

  var numberOfStates = 2
  var state: Int = 0

  var isOn: Bool { state != 0 }

  mutating func toggle() {
    let newState = state + 1

    if newState > (numberOfStates - 1) {
      state = 0
    } else {
      state = newState
    }
  }

  mutating func turnOn() {
    // if the state is 0, state += 1
  }
}
