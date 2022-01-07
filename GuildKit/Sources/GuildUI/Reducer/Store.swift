import Combine
import SwiftUI

public typealias Reducer<State, Action, Environment> =
  (inout State, Action, Environment) -> AnyPublisher<Action, Never>?

public final class Store<State, Action, Environment>: ObservableObject {
  @Published public private(set) var state: State

  private let environment: Environment
  private let reducer: Reducer<State, Action, Environment>
  private var effectCancellables: Set<AnyCancellable> = []

  public init(
    initialState: State,
    reducer: @escaping Reducer<State, Action, Environment>,
    environment: Environment
  ) {
    self.state = initialState
    self.reducer = reducer
    self.environment = environment
  }

  public func callAsFunction(action: Action) {
    send(action)
  }

  private func send(_ action: Action) {
    guard let effect = reducer(&state, action, environment) else {
      return
    }

    effect
      .receive(on: DispatchQueue.main)
      .sink(receiveValue: send)
      .store(in: &effectCancellables)
  }

  public func binding<Value>(
    for keyPath: KeyPath<State, Value>,
    toAction: @escaping (Value) -> Action
  ) -> Binding<Value> {
    Binding<Value>(
      get: { self.state[keyPath: keyPath] },
      set: { self.send(toAction($0)) }
    )
  }
}
