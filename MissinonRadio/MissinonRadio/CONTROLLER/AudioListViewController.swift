//
//  PlayAudio.swift
//  MissinonRadio
//
//  Created by Kenshiro on 2021/03/09.
//

import UIKit

class AudioListViewController:  UIViewController,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var audioList: UITableView!
    var fileUrlList :[URL] = []
    
    override func viewWillAppear(_ animated: Bool) {
        audioList.reloadData()
        fileUrlList = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        print("今のurlsは\(fileUrlList)")
    }
    
    override func viewDidLoad() {
        audioList.dataSource = self
        audioList.delegate = self
        
    }
    
    //セクションの数を指定(今回は1つ)
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // TableViewに表示するセルの数を返す
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return fileUrlList.count
    }
    
    // セルを生成する
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AudioListCell", for: indexPath) as? AudioListCell else {
            fatalError("Dequeue failed: AudioListCell.")
        }
        cell.audioNameLabel.text = fileUrlList[indexPath.row].fragment
        return cell
    }
    
//セルがタップされたときの動き
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //画面遷移
        func segueToImageSave (){
            self.performSegue(withIdentifier: "goToplay", sender: nil)
            }
        
        // セルの選択を解除
        audioList.deselectRow(at: indexPath, animated: true)
        print("タップされたよ")
    }
    
    //録音Buttonから録音画面を表示させる
    @IBAction func goRecordButton(_ sender: Any) {
        self.performSegue(withIdentifier: "goToRecord", sender: nil)
    }
    
    // Segue 準備
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if (segue.identifier == "goToplay") {
            let PlayAudio: PlayAudioVewController = (segue.destination as? PlayAudioVewController)!
            // SubViewController のselectedImgに選択された画像を設定する
            PlayAudio.fileUrl = "\(fileUrlList[1])"
        }
    }

}
