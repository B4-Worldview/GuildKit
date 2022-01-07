import SwiftUI

let exampleItems = [
  PollItem(id: "0", name: "Sound of Music"),
  PollItem(id: "1", name: "When a man loves a woman"),
  PollItem(id: "2", name: "Bring it on"),
  PollItem(id: "3", name: "Another thing"),
  PollItem(id: "10", name: "Other")
]

struct ContentView: View {
  @StateObject var model = PollViewModel(
    poll: Poll(
      id: "0",
      name: "My first poll",
      items: exampleItems
    )
  )
  var body: some View {
    VStack {
      Button(action: {
        self.model.items = exampleItems.shuffled()
      }) {
        Text("SHUFFLE")
          .padding()
      }
      PollView(model: model)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
