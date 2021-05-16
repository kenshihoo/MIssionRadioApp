//
//  ViewController.swift
//  MissinonRadio
//
//  Created by Kenshiro on 2021/02/15.
//

import UIKit
import AVFoundation

class RecordAudioViewController: UIViewController,FileManagerDelegate, AVAudioRecorderDelegate{
    let fileSetting = FileSetting()
    let recordSetting = RecordSetting()
    var fileName : String!
    var fileUrl : URL!
    
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet var playButton: UIView!
    @IBOutlet weak var fileNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //マイクの許可を実装
        recordSetting.requestPermission{ granted in
            guard granted else { return }}
        
    }

    @IBAction func recoedButton(_ sender: Any) {
        if fileUrl == nil {
        //タイムスタンプをファイル名にする
        let timeStamp = fileSetting.getRecordTime()
        fileName = "\(timeStamp).mp4a"
        fileNameLabel.text = timeStamp
        //音声ファイル保存用のファイルURLを作成
        fileUrl = fileSetting.getFileNames(fileName: fileName)
        }
        //録音準備
        recordSetting.preset()
        recordSetting.recordSetup(url: fileUrl)
        recordSetting.recorder.delegate = self
        
        
        if recordSetting.recorder.isRecording == false {
            
            recordSetting.record()
            statusLabel.text = "録音中"}
            else{
                recordSetting.pause()
                statusLabel.text = "録音停止中"}
    }
    
    @IBAction func stopButton(_ sender: Any) {
        recordSetting.stop()
        statusLabel.text = "録音"
        
        //ファイル名の指定をするかを確認したい(filemanagerでurlを変更"moveitem?")
        
        dismiss(animated: true, completion: nil)
        print("録音を修了したよ")
    }
}
