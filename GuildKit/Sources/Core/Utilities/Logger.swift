import Combine

public class Logger {
  public enum Level: Int, Comparable {
    case verbose = 0, debug, info, warning, error

    public static func < (lhs: Logger.Level, rhs: Logger.Level) -> Bool {
      lhs.rawValue < rhs.rawValue
    }
  }

  public struct LogItem {
    public let message: String
    public let level: Level
  }

  public static var registeredLogger: Logger?
  public let publisher = PassthroughSubject<LogItem, Never>()

  public init() { }

  public static func register(logger: Logger) {
    registeredLogger = logger
  }

  public static func log(_ message: String, _ level: Level = .debug) {
    registeredLogger?.log(message, level)
  }

  public func log(_ message: String, _ level: Level = .debug) {
    let item = LogItem(message: message, level: level)
    publisher.send(item)
  }
}
