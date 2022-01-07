import AVFoundation
import AVKit
import SwiftUI

public struct Video: UIViewRepresentable {
  public var videoURL: URL
  public var previewLength: Double

  public init(videoURL: URL, previewLength: Double) {
    self.videoURL = videoURL
    self.previewLength = previewLength
  }

  public func makeUIView(context: Context) -> UIView {
    VideoPlayerView(frame: .zero, url: videoURL, previewLength: previewLength)
  }

  public func updateUIView(_ uiView: UIView, context: Context) {
  }
}

#if DEBUG
struct VideoView_Previews: PreviewProvider {
  static var url = URL(string: "https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8")!

  static var previews: some View {
    Video(videoURL: url, previewLength: 15)
  }
}
#endif
