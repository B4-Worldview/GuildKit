import UIKit

public enum HapticType {
  case light, medium, heavy, warning, error, success
}

public enum Haptic {
  private static let lightGenerator = UIImpactFeedbackGenerator(style: .light)
  private static let mediumGenerator = UIImpactFeedbackGenerator(style: .medium)
  private static let heavyGenerator = UIImpactFeedbackGenerator(style: .heavy)
  private static let notificationFeedbackGenerator = UINotificationFeedbackGenerator()

  public static func feedback(_ type: HapticType) {
    switch type {
    case .light:
      lightGenerator.impactOccurred()
    case .medium:
      mediumGenerator.impactOccurred()
    case .heavy:
      heavyGenerator.impactOccurred()
    case .warning:
      notificationFeedbackGenerator.notificationOccurred(.warning)
    case .error:
      notificationFeedbackGenerator.notificationOccurred(.error)
    case .success:
      notificationFeedbackGenerator.notificationOccurred(.success)
    }
  }
}
