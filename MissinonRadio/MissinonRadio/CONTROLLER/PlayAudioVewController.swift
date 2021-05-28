//
//  PlayAudio.swift
//  MissinonRadio
//
//  Created by Kenshiro on 2021/04/09.
//

import UIKit
import AVFoundation

class PlayAudioVewController: UIViewController,AVAudioPlayerDelegate,FileManagerDelegate  {
    let filesetting = FileSetting()
    let playSetting =  PlaySetting()
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var currentTimeLabel: UILabel!
    var filePath :String!
    var fileUrl :URL!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(filePath as Any)
        if filePath != nil{
            fileUrl = filesetting.getFileNames(fileName: filePath)
            playSetting.setupPlayer(with: fileUrl)
        }
        else{
            print("fileUrlの取得エラー")
        }
    }
    
    
    @IBAction func plyaButton(_ sender: Any) {
        if  playSetting.audioPlayer?.isPlaying != true{
        if fileUrl != nil{
            playSetting.playAudio(url: fileUrl)
            statusLabel.text = "一時停止"
        }
        else{
            print("fileUrlの取得エラー")
        }
        }else{
            playSetting.pause()
            statusLabel.text = "再生"
        }
    }
    
    @IBAction func stopButton(_ sender: Any) {
        playSetting.stop()
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
