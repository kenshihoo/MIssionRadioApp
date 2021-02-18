//
//  ViewController.swift
//  MissinonRadio
//
//  Created by Kenshiro on 2021/02/15.
//

import UIKit
import AVFoundation

class RecordAudio: UIViewController {
    let session = AVAudioSession.sharedInstance()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //マイクの許可を実装
        func requestPermission(completion: @escaping (Bool) -> Void) {
            session.requestRecordPermission { granted in
                completion(granted)
            }
        }
    }
}

