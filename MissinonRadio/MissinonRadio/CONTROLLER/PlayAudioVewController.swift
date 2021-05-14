//
//  PlayAudio.swift
//  MissinonRadio
//
//  Created by Kenshiro on 2021/04/09.
//

import UIKit
import AVFoundation

class PlayAudioVewController: UIViewController,AVAudioPlayerDelegate,FileManagerDelegate  {
    let playSetting =  PlaySetting()
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var currentTimeLabel: UILabel!
    var fileUrl :URL!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if fileUrl != nil{
            playSetting.setupPlayer(with: fileUrl)
        }
        else{
            print("fileUrlの取得エラー")
        }
    }
    
    
    @IBAction func plyaButton(_ sender: Any) {
        if fileUrl != nil{
            playSetting.playAudio(url: fileUrl)
        }
        else{
            print("fileUrlの取得エラー")
        }
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
