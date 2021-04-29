//
//  PlayAudio.swift
//  MissinonRadio
//
//  Created by Kenshiro on 2021/03/09.
//

import UIKit

class AudioListViewController:  UIViewController,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var audioList: UITableView!
    
    var fileNames :[String]? = nil
    
    override func viewWillAppear(_ animated: Bool) {
        
    //ファイル一覧を取得
        let names = FileSetting.getFileNames()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        audioList.dataSource = self
        audioList.delegate = self
    }
    
    //セクションの数を指定(今回は1つ)
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // TableViewに表示するセルの数を返す(本来はファイル数に合わせて出したい)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return fileNames.count
        return 1
    }
    
    // セルを生成する
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AudioListCell", for: indexPath) as? AudioListCell else {
            fatalError("Dequeue failed: AudioListCell.")
        }
        return cell
    }
    
    
//セルがタップされたときの動き
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //画面遷移
        func segueToImageSave (){
            self.performSegue(withIdentifier: "goToplay", sender: nil)
            }
        print("タップされたよ")
    }
    
    //録音Buttonから録音画面を表示させる
    @IBAction func goRecordButton(_ sender: Any) {
        self.performSegue(withIdentifier: "goToRecord", sender: nil)
    }
}
