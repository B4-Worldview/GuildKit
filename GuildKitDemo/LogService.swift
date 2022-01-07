import Combine
import GuildKit

class LogService: ObservableObject {
  var cancellables = Set<AnyCancellable>()
  let logger = Logger()

  init() {
    Logger.register(logger: logger)

    setupPrintLogger()
  }

  func setupPrintLogger() {
    logger.publisher
      .filter { $0.level >= .debug }
      .sink {
        print($0.message)
      }
      .store(in: &cancellables)
  }
}
