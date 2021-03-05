//
//  ViewController.swift
//  MissinonRadio
//
//  Created by Kenshiro on 2021/02/15.
//

import UIKit
import AVFoundation

class RecordAudio: UIViewController,FileManagerDelegate{
    let session = AVAudioSession.sharedInstance()
    var recorder: AVAudioRecorder?
    var fileSetting = FileSetting()
    var fileName = "record.m4a"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //マイクの許可を実装
        func requestPermission(completion: @escaping (Bool) -> Void) {
            session.requestRecordPermission { granted in
                completion(granted)
            }
        }
        //録音と再生の両方を可能にする
        try? session.setCategory(.playAndRecord)
        
        //音声ファイルを用意する
        fileSetting.fileUrl(name:fileName)
    }
}
