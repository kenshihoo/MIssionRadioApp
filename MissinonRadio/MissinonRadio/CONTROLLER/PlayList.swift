//
//  PlayAudio.swift
//  MissinonRadio
//
//  Created by Kenshiro on 2021/03/09.
//

import UIKit

class Playlist:  UIViewController,UITableViewDelegate,UITableViewDataSource{
    

    @IBOutlet weak var audioList: UITableView!
    var audios: [URL] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        audioList.dataSource = self
        audioList.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return audios.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AnimalTableViewCell", for: indexPath) as? AudioListCell else {
            fatalError("Dequeue failed: AnimalTableViewCell.")
            
        }
        return cell
    }
    
    //録音Buttonから録音画面を表示させる
    @IBAction func goRecordButton(_ sender: Any) {
        self.performSegue(withIdentifier: "goToRecord", sender: nil)
    }
    
}
