//
//  FileManager.swift
//  MissinonRadio
//
//  Created by Kenshiro on 2021/03/05.
//

import Foundation
import AVFoundation

class FileSetting{
    let session = AVAudioSession.sharedInstance()
    var recorder: AVAudioRecorder?
    let fileManager: FileManager = .default
    
        
        //ファイルの設定
        func fileUrl(name: String) -> URL? {
            fileManager.urls(
                for: .documentDirectory,
                in: .userDomainMask
            ).first?.appendingPathComponent(name)
            
        }
        
        
    
    func record(){
        recorder?.record()
    }
    
    
    
}

