import CoreGraphics

public extension CGSize {
  static func + (left: CGSize, right: CGSize) -> CGSize {
    CGSize(width: left.width + right.width, height: left.height + right.height)
  }

  static func += (left: inout CGSize, right: CGSize) {
    // swiftlint:disable:next shorthand_operator
    left = left + right
  }

  static func * (scalar: CGFloat, right: CGSize) -> CGSize {
    CGSize(width: right.width * scalar, height: right.height * scalar)
  }
}
