//
//  RecordSetting.swift
//  MissinonRadio
//
//  Created by Kenshiro on 2021/03/06.
//

import Foundation
import AVFoundation

class RecordSetting:FileManager, AVAudioRecorderDelegate{
    let session = AVAudioSession.sharedInstance()
    var recorder: AVAudioRecorder!
    
    //録音フォーマットの設定
    let formatSettig: [String: Any] = [
        // MPEG-4 AACコーデックを指定するキー
        AVFormatIDKey: kAudioFormatMPEG4AAC,
        // サンプルレート変換品質
        AVEncoderAudioQualityKey: AVAudioQuality.medium.rawValue,
        // モノラル
        AVNumberOfChannelsKey: 1,
        // サンプルレート
        AVSampleRateKey: 44100
    ]
    
    
    func requestPermission(completion: @escaping (Bool) -> Void) {
        //マイクの許可を実装
        session.requestRecordPermission{
            granted in completion(granted)}
    }
    
    func preset(){
        //録音と再生の両方を可能にする
        try! session.setCategory(.playAndRecord)
        //sessionをアクティブにする
        try! session.setActive(true)
        print("preset完了")
    }
    
    func recordSetup(url: URL){
        self.recorder = try! AVAudioRecorder(url: url, settings: self.formatSettig)
        recorder.delegate = self
    
        // 録音を準備する
        recorder!.prepareToRecord()
        print("setup完了")
    }
    
    func record()  {
        recorder.record()
    }
    
    func pause () {
        recorder.pause()
    }
    
    func stop(){
        recorder.stop()
    }
}
