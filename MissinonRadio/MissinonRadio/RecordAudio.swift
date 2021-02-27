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
        do {
            let fileManager = FileManager.default
            let docs = try fileManager.url(for: .documentDirectory,
                                           in: .userDomainMask,
                                           appropriateFor: nil, create: false)
            let path = docs.appendingPathComponent("ecord.m4a")
            let audio = "音声データ".data(using: .utf8)!

            fileManager.createFile(atPath: path.path,
                                   contents: audio, attributes: nil)
        } catch {
            print(error)
        }
    }
}

