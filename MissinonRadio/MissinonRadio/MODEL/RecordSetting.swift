//
//  RecordSetting.swift
//  MissinonRadio
//
//  Created by Kenshiro on 2021/03/06.
//

import Foundation
import AVFoundation

class RecordSetting{
    let session = AVAudioSession.sharedInstance()
    var recorder: AVAudioRecorder!
    

    func preset(){
        //録音と再生の両方を可能にする
        try? session.setCategory(.playAndRecord)
        //sessionをアクティブにする
        try? session.setActive(true)
    }
    
    func recordSetup(url: URL){
        recorder = try! AVAudioRecorder(url: url, settings: formatSettig)
        recorder?.prepareToRecord() // レコーダーに収録準備させる
    }
    
    func requestPermission(completion: @escaping (Bool) -> Void) {
        //マイクの許可を実装
        session.requestRecordPermission { granted in
            completion(granted)
        }
    }
    
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
        
    
}