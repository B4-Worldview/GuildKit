import Lottie
import SwiftUI

public struct Lottie: UIViewRepresentable {
  public typealias UIViewType = UIView
  public var filename: String

  public init(filename: String) {
    self.filename = filename
  }

  public func makeUIView(context: UIViewRepresentableContext<Lottie>) -> UIView {
    let view = UIView(frame: .zero)

    let animationView = AnimationView()
    let animation = Animation.named(filename)
    animationView.loopMode = .repeat(.greatestFiniteMagnitude)
    animationView.animation = animation
    animationView.contentMode = .scaleAspectFit
    animationView.play()

    animationView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(animationView)

    NSLayoutConstraint.activate([
      animationView.leftAnchor.constraint(equalTo: view.leftAnchor),
      animationView.rightAnchor.constraint(equalTo: view.rightAnchor),
      animationView.topAnchor.constraint(equalTo: view.topAnchor),
      animationView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])

    return view
  }

  public func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<Lottie>) { }
}
