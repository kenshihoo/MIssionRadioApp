//
//  ViewController.swift
//  MissinonRadio
//
//  Created by Kenshiro on 2021/02/15.
//

import UIKit

class RecordAudioViewController: UIViewController,FileManagerDelegate{
    let fileSetting = FileSetting()
    let recordSetting = RecordSetting()

    let dirUrl:URL! = FileSetting().dirUrl
    var fileName :String!
    var fileUrl:URL!
    
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet var playButton: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //マイクの許可を実装
        recordSetting.requestPermission{ granted in
            guard granted else { return }}
    }
    

    @IBAction func recoedButton(_ sender: Any) {
        //タイムスタンプをファイル名にする
        let timeStamp = fileSetting.getRecordTime()
        fileName = "\(timeStamp)"
        
        //音声ファイル保存用のファイルURLを作成
        fileUrl = dirUrl?.appendingPathComponent(timeStamp)
        
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
        
        //ファイル名の指定をするかを確認したい(filemanagerでurlを変更"moveitem?")
        
        dismiss(animated: true, completion: nil)
        print("タップされたよ")
    }
}
