//
//  PlaySetting.swift
//  MissinonRadio
//
//  Created by Kenshiro on 2021/03/07.
//

import Foundation
import AVFoundation

class PlaySetting{
    var audioEngine = AVAudioEngine()
    var audioPlayerNode = AVAudioPlayerNode()
    
    func playAudio(url: URL){
        do {
            let audioFile = try AVAudioFile(forReading: url)
                audioPlayerNode.stop()
                audioPlayerNode.scheduleFile(audioFile, at: nil)
                try audioEngine.start()
                audioPlayerNode.play()
            }
            catch let error {
                print(error)
            }
        }
}
