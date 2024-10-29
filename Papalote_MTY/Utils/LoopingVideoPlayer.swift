import SwiftUI
import AVKit

struct LoopingPlayerView: UIViewRepresentable {
    var fileName: String
    
    func makeUIView(context: Context) -> UIView {
        return LoopingVideoPlayerUIView(fileName: self.fileName)
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}

class LoopingVideoPlayerUIView: UIView {
    private var queuePlayer = AVQueuePlayer()
    private let playerLayer = AVPlayerLayer()
    private var playerLooper: AVPlayerLooper?
    
    init(fileName: String) {
        super.init(frame: .zero)
        
        guard let filePath = Bundle.main.path(forResource: fileName, ofType: "mp4") else {
            print("LoopingVideoPlayerUIView: file \(fileName) not found")
            return
        }
        
        let fileUrl = URL(fileURLWithPath: filePath)
        let asset = AVAsset(url: fileUrl)
        let playerItem = AVPlayerItem(asset: asset)
        
        self.queuePlayer.isMuted = true
        self.playerLayer.player = self.queuePlayer
        self.playerLayer.videoGravity = .resizeAspectFill
        
        self.playerLooper = AVPlayerLooper(player: self.queuePlayer, templateItem: playerItem)
        self.queuePlayer.addObserver(self, forKeyPath: "status", options: [.new, .initial], context: nil)
        
        self.layer.insertSublayer(self.playerLayer, at: 0)
        
        // Observe for app state changes
        NotificationCenter.default.addObserver(self, selector: #selector(reinsertPlayerLayer), name: UIApplication.willEnterForegroundNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(playWhenActive), name: UIApplication.didBecomeActiveNotification, object: nil)
    }
    
    @objc private func reinsertPlayerLayer() {
        self.playerLayer.removeFromSuperlayer()
        self.layer.insertSublayer(self.playerLayer, at: 0)
    }
    
    @objc private func playWhenActive() {
        self.queuePlayer.play()  // Resume playing when the app becomes active
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "status", let player = object as? AVQueuePlayer, player.status == .readyToPlay {
            player.play()
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = self.bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIApplication.willEnterForegroundNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIApplication.didBecomeActiveNotification, object: nil)
        queuePlayer.removeObserver(self, forKeyPath: "status")
    }
}
