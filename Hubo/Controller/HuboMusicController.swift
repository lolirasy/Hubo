//
//  HuboMusicController.swift
//  Hubo
//
//  Created by ភី ម៉ារ៉ាសុី on 2/17/18.
//  Copyright © 2018 ភី ម៉ារ៉ាសុី. All rights reserved.
//

import UIKit
import AVFoundation

class HuboMusicController: UIViewController, NibIntializable {

    @IBOutlet weak var endTime: UILabel!
    @IBOutlet weak var startTime: UILabel!
    @IBOutlet weak var musicSlider: UISlider!
    @IBOutlet weak var playButton: UIButton!

    private var isPlaying: Bool = false {
        didSet {
            isPlaying ? playButton.setImage(#imageLiteral(resourceName: "ic_pause_circle_filled"), for: .normal) : playButton.setImage(#imageLiteral(resourceName: "ic_play_circle_filled"), for: .normal)
        }
    }

    @IBAction func onMusicDurationChanged(_ sender: Any) {
        startTime.text = musicPlayer.currentTime.toString()
    }

    @IBAction func actionPlay(_ sender: Any) {
        isPlaying = !isPlaying
        if isPlaying {
            Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(trackAudio), userInfo: nil, repeats: true)
            musicPlayer.play()
            return
        }
        musicPlayer.pause()
    }

    var musicPlayer = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareSong()

    }

    private func prepareSong() {
        do {
            musicPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: "Happier", ofType: "mp3")!))
            musicPlayer.prepareToPlay()
            endTime.text = musicPlayer.duration.toString()
            let audioSession = AVAudioSession.sharedInstance()
            do {
                try audioSession.setCategory(AVAudioSessionCategoryPlayback)
            } catch let error {
                print(error)
            }
        }
    }

    @objc private func trackAudio() {
        let normalizedTime = Float(musicPlayer.currentTime * 100.0 / musicPlayer.duration)
        musicSlider.value = normalizedTime
        startTime.text = musicPlayer.currentTime.toString()
    }

}
