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
    var recorder: AVAudioRecorder?

    
    func preset(){
        //録音と再生の両方を可能にする
        try? session.setCategory(.playAndRecord)
        //sessionをアクティブにする
        try? session.setActive(true, options: [])
    }
    
    func requestPermission(completion: @escaping (Bool) -> Void) {
        //マイクの許可を実装
        session.requestRecordPermission { granted in
            completion(granted)
        }
    }
}
