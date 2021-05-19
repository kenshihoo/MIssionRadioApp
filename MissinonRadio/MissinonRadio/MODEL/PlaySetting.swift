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
    var audioPlayer: AVAudioPlayer?
    var isPlaying: Bool { audioPlayer?.isPlaying ?? false }
    
    
   
    func setupPlayer(with url: URL) { // プレイヤーを作成
        audioPlayer = try! AVAudioPlayer(contentsOf: url)
        audioPlayer?.prepareToPlay()
    }
    
    func playAudio(url: URL){
        print(url)
        audioPlayer?.play()
//        do {
//            let audioFile = try AVAudioFile(forReading: url)
//                audioPlayerNode.stop()
//                audioPlayerNode.scheduleFile(audioFile, at: nil)
//                try audioEngine.start()
//                audioPlayerNode.play()
//            }
//            catch let error {
//                print(error)
//            }
        }
    
    func play(currentTime: Double) { // 再生位置を決めて再生
        audioPlayer?.currentTime = currentTime
        audioPlayer?.play()
    }
    func pause() { // 再生を一時停止
        audioPlayer?.pause()
    }
    func stop()  {
        audioPlayer?.stop()
    }
}
