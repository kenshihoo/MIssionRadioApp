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
    let fileManager: FileManager = .default
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
        
        //ファイルの設定
        func fileUrl(fileName: String) -> URL? {
            fileManager.urls(
                for: .documentDirectory,
                in: .userDomainMask
            ).first?.appendingPathComponent(fileName)
            
        }
        
        func setting(){
            // 音声ファイルを用意する
            fileUrl(fileName: fileName)

        }
        
    }
    
    
    func record(){
        recorder?.record()
    }
    
    
    
}

