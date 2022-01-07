import GuildKit
import SwiftUI

struct ContentView: View {
  @EnvironmentObject var environment: AppEnvironment
  @Environment(\.styling) var styling

  @State var isChecked = false
  @State var isOn = false
  @State var spacing: CGFloat = 10

  var body: some View {
    VStack(spacing: 15) {
      ImageFrame(content: {
        Image("superMarioKart")
          .resizable()
          .aspectRatio(contentMode: .fill)
          .frame(width: 200, height: 200)
      }, footer: {
        Text("Footer")
          .bold()
          .foregroundColor(.white)
          .padding()
      })

      Text("GuildKit Demo")
        .font(.title)

      VStack {
        HStack(spacing: spacing) {
          IconButton(.system("textbox")) {
            Logger.log("1")
          }
          .disabled(true)

          IconButton {
            Logger.log("2", .verbose)
          }
          CheckBox(isChecked: $isChecked)
        }

        HStack(spacing: spacing) {
          IconTextButton("Options") {
            Logger.log("3")
          }

          GuildToggle(isOn: $isOn)
        }

        Lottie(filename: "sample-lottie")
          .frame(width: 100, height: 100)
      }

      Slider(value: $spacing, in: 0...50)
        .padding()

      IconButton(.system("list.dash"), action: environment.showMultiSelectDemo)
    }
    .frame(maxWidth: .greatestFiniteMagnitude, maxHeight: .greatestFiniteMagnitude)
    .ignoresSafeArea()
    .background(styling.colors.background.ignoresSafeArea())
    .sheet(item: $environment.sheet) { sheet in
      switch sheet {
      case .multiSelect:
        MultiSelectDemo().eraseToAnyView()
      case .other(let text):
        Text(text).eraseToAnyView()
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var environment = AppEnvironment()

  static var previews: some View {
    ContentView()
      .environmentObject(environment)
      .preferredColorScheme(.dark)
  }
}
