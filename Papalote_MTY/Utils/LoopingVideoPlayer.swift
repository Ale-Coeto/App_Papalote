//
//  LoopingVideoPlayer.swift
//  Papalote_MTY
//
//  Created by José Guerrero  on 17/10/24.
//

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
        
        // Load the asset
        let fileUrl = URL(fileURLWithPath: filePath)
        let asset = AVAsset(url: fileUrl)
        let playerItem = AVPlayerItem(asset: asset)
        
        // Set up the player
        self.queuePlayer.isMuted = true
        self.playerLayer.player = self.queuePlayer
        self.playerLayer.videoGravity = .resizeAspectFill
        
        // Setup the playerLooper which takes care of the looping for us
        self.playerLooper = AVPlayerLooper(player: self.queuePlayer, templateItem: playerItem)
        self.queuePlayer.play()
        
        // Insert the player layer to our view's layer
        self.layer.insertSublayer(self.playerLayer, at: 0)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = self.bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



