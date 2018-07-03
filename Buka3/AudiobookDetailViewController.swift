//
//  AudiobookDetailViewController.swift
//  Buka3
//
//  Created by mzk on 28/05/2017.
//
//

import UIKit
import AVFoundation

class AudiobookDetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var toolbar: UIToolbar!
    @IBOutlet weak var slider: UISlider!
    
    var playButton: UIBarButtonItem!
    var pauseButton: UIBarButtonItem!
    
    var player: AVAudioPlayer?
    
    var audiobook: Audiobook?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coverImageView.image = audiobook?.cover
        titleLabel.text = audiobook?.title
        descriptionLabel.text = audiobook?.description
        categoryLabel.text = audiobook?.category

        playButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.play, target: self, action: #selector(AudiobookDetailViewController.playButtonTapped))
        pauseButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.pause, target: self, action: #selector(AudiobookDetailViewController.pauseButtonTapped))
        
        if let trackName = audiobook?.track, let track = NSDataAsset(name: trackName) {
            do {
                player = try AVAudioPlayer(data: track.data, fileTypeHint: AVFileType.mp3.rawValue)
                player?.prepareToPlay()
            } catch let error {
                toolbar.isHidden = true
                print(error.localizedDescription)
            }
            toolbar.items = [playButton];
            
            // setup slider
            if let duration = player?.duration {
                slider.maximumValue = Float(duration)
            } else {
                slider.isHidden = true
            }
            playButtonTapped()
            var _ = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateSlider), userInfo: nil, repeats: true)
        } else {
            slider.isHidden = true
            toolbar.isHidden = true
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        playButtonTapped()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        pauseButtonTapped()
    }
    
    @objc func playButtonTapped() {
        player?.play()
        toolbar?.items = [pauseButton];
    }
    
    @objc func pauseButtonTapped() {
        player?.stop()
        toolbar?.items = [playButton];
    }
    
    @IBAction func changeTrackTime(_ sender: Any) {
        player?.currentTime = TimeInterval(slider.value)
    }
    
    @objc func updateSlider() {
        if let currentTime = player?.currentTime {
            slider.value = Float(currentTime)
        }
    }
    
}
