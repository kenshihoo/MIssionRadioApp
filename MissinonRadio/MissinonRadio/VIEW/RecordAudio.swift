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
    @IBOutlet weak var startOrPause: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        recordSetting.preset()
        //マイクの許可を実装
        recordSetting.requestPermission{ granted in
            guard granted else { return }}
        //音声ファイルを用意する
        let fileUrl = fileSetting.fileSet(name:fileName)!
        //sessionの準備
        recordSetting.recordSetup(url: fileUrl)
    }
    

    @IBAction func recoedButton(_ sender: Any) {
        if recordSetting.recorder.isRecording{
            recordSetting.recorder?.record()
            startOrPause.text = "録音中"
        }
            else{
                recordSetting.recorder?.pause()
                startOrPause.text = "録音停止中"
            }
    }
    
    @IBAction func stopButton(_ sender: Any) {
        recordSetting.recorder?.stop()
        startOrPause.text = "録音"
    }
}
