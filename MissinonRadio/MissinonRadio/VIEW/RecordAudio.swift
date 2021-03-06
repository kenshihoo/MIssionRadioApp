//
//  ViewController.swift
//  MissinonRadio
//
//  Created by Kenshiro on 2021/02/15.
//

import UIKit
import AVFoundation

class RecordAudio: UIViewController,FileManagerDelegate{
    let fileSetting = FileSetting()
    let recordSetting = RecordSetting()
    var fileName = "record.m4a"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //sessionの準備
        recordSetting.preset()
        //マイクの許可を実装
        recordSetting.requestPermission{ granted in
            guard granted else { return }}
        //音声ファイルを用意する
        let fileUrl = fileSetting.fileSet(name:fileName)
    }
    

    @IBAction func recoedButton(_ sender: Any) {
        recordSetting.recorder?.record()
    }
    
    @IBAction func stopButton(_ sender: Any) {
        recordSetting.recorder?.stop()
    }
}
