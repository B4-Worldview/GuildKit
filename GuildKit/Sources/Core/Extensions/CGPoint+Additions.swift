import CoreGraphics

public extension CGPoint {
  static func + (left: CGPoint, right: CGPoint) -> CGPoint {
    CGPoint(x: left.x + right.x, y: left.y + right.y)
  }

  static func += (left: inout CGPoint, right: CGPoint) {
    // swiftlint:disable:next shorthand_operator
    left = left + right
  }

  static func * (scalar: CGFloat, right: CGPoint) -> CGPoint {
    CGPoint(x: right.x * scalar, y: right.y * scalar)
  }
}
