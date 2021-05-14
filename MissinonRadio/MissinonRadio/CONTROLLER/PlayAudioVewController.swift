//
//  PlayAudio.swift
//  MissinonRadio
//
//  Created by Kenshiro on 2021/04/09.
//

import UIKit
import AVFoundation

class PlayAudioVewController: UIViewController,AVAudioPlayerDelegate,FileManagerDelegate  {

    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var currentTimeLabel: UILabel!
    
    var fileUrl :String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func plyaButton(_ sender: Any) {
        
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
