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
    @IBOutlet weak var statusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //マイクの許可を実装
        recordSetting.requestPermission{ granted in
            guard granted else { return }}
        
        //音声ファイルを用意する
        let fileUrl = fileSetting.fileSet(name:fileName)!
        
        //録音準備
        recordSetting.preset()
        recordSetting.recordSetup(url: fileUrl)
    }
    

    @IBAction func recoedButton(_ sender: Any) {
        if recordSetting.recorder.isRecording{
            recordSetting.recorder?.record()
            statusLabel.text = "録音中"
        }
            else{
                recordSetting.recorder?.pause()
                statusLabel.text = "録音停止中"
            }
    }
    
    @IBAction func stopButton(_ sender: Any) {
        recordSetting.recorder?.stop()
        statusLabel.text = "録音"
    }
}
