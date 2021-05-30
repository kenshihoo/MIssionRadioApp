//
//  PlayAudio.swift
//  MissinonRadio
//
//  Created by Kenshiro on 2021/03/09.
//

import UIKit

class AudioListViewController:  UIViewController,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var audioList: UITableView!
    var fileUrlList :[String] = []
    var selectedFilePath :String!
    let filesetting = FileSetting()
    
    override func viewWillAppear(_ animated: Bool) {
        audioList.dataSource = self
        audioList.delegate = self
        audioList.reloadData()
        print("今のurlsは\(fileUrlList)")
    }
    
    //セクションの数を指定(今回は1つ)
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // TableViewに表示するセルの数を返す
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        fileUrlList = filesetting.getFileArray()
        print("セルの数は\(fileUrlList.count)個です")
        return fileUrlList.count
    }
    
    // セルを生成する
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AudioListCell", for: indexPath) as? AudioListCell else {
            fatalError("Dequeue failed: AudioListCell.")
        }
        cell.audioNameLabel.text = fileUrlList[indexPath.row]
        return cell
    }
    
    // Segue 準備
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if (segue.identifier == "goToplay") {
            let PlayAudio: PlayAudioVewController = (segue.destination as? PlayAudioVewController)!
            PlayAudio.filePath =  selectedFilePath
        }
    }
    
//セルがタップされたときの動き
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedFilePath = fileUrlList[indexPath.row]
        //画面遷移
        func segueToImageSave (){
            self.performSegue(withIdentifier: "goToplay", sender: nil)
            }
        
        // セルの選択を解除
        audioList.deselectRow(at: indexPath, animated: true)
        print("セルがタップされたよ")
    }
    
    //録音Buttonから録音画面を表示させる
    @IBAction func goRecordButton(_ sender: Any) {
        self.performSegue(withIdentifier: "goToRecord", sender: nil)
    }
    
    

}
