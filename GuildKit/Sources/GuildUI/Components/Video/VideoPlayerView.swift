import AVFoundation
import AVKit
import UIKit

public class VideoPlayerView: UIView {
  private let playerLayer = AVPlayerLayer()
  private var previewTimer: Timer?
  public var previewLength: Double

  public init(frame: CGRect, url: URL, previewLength: Double) {
    self.previewLength = previewLength

    super.init(frame: frame)
    let player = AVPlayer(url: url)
    player.volume = 0
    player.play()

    playerLayer.player = player
    playerLayer.videoGravity = .resizeAspectFill
    playerLayer.backgroundColor = UIColor.black.cgColor

    previewTimer = Timer.scheduledTimer(withTimeInterval: previewLength, repeats: true, block: { _ in
      player.seek(to: CMTime(seconds: 0, preferredTimescale: CMTimeScale(1)))
    })

    layer.addSublayer(playerLayer)
  }

  public required init?(coder: NSCoder) {
    self.previewLength = 15
    super.init(coder: coder)
  }

  override public func layoutSubviews() {
    super.layoutSubviews()
    playerLayer.frame = bounds
  }
}
