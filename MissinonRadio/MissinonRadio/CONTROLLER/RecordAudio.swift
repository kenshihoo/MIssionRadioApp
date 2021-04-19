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
    let appDelegate = AppDelegate()
    var fileName :String!
    
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
        fileName = "\(fileSetting.getRecordTime())"
        
        //ディレクトリを作成
        //本当は同じurlのディレクトリが無い場合だけに呼び出したいメソッド
        let dirUrl :URL! = appDelegate.dirUrl
        
        //音声ファイル保存用のファイルURLを作成
        let fileUrl = dirUrl.appendingPathComponent(fileName)
        
        
        
        //録音準備
        recordSetting.preset()
        recordSetting.recordSetup(url: dirUrl)
        
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
        
        //ファイル名の指定をするかを確認(filemanagerでurlを変更"moveitem?")
        
        print("タップされたよ")
        
    }
}
