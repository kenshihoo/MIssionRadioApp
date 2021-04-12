//
//  ViewController.swift
//  MissinonRadio
//
//  Created by Kenshiro on 2021/02/15.
//

import UIKit

class RecordAudio: UIViewController,FileManagerDelegate{
    let fileSetting = FileSetting()
    let recordSetting = RecordSetting()
    let fileName = "record.m4a"
    
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet var playButton: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //マイクの許可を実装
        recordSetting.requestPermission{ granted in
            guard granted else { return }}
    }
    

    @IBAction func recoedButton(_ sender: Any) {
        //音声ファイルを用意する
        let fileUrl = fileSetting.fileSet(name:fileName)!
        //録音準備
        recordSetting.preset()
        recordSetting.recordSetup(url: fileUrl)
        
        if recordSetting.recorder.isRecording == false {
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
        
        //画面遷移
        func segueToImageSave (){
            self.performSegue(withIdentifier: "backToList", sender: nil)
            }
        
        //ファイル名の指定をするかを確認(filemanagerでurlを変更"moveitem?")
        
        print("タップされたよ")
        
    }
}
