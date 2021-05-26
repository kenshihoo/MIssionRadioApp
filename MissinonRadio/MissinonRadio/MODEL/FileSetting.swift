//
//  FileManager.swift
//  MissinonRadio
//
//  Created by Kenshiro on 2021/03/05.
//

import Foundation
import AVFoundation
class FileSetting:FileManager{
    var audioFile:AVAudioFile!
    let fileManager = FileManager()
    
    //タイムスタンプを取得する
    func getRecordTime() -> String  {
        let format = DateFormatter()
        format.timeStyle = .medium
        format.dateStyle = .medium
        format.locale = Locale(identifier: "ja_JP")
        let now = Date()
        return(format.string(from: now))
    }
    
    
    //録音データを入れるファイルのurl取得とファイル作成
    func getFileNames(fileName:String) -> URL  {
        guard let dirURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
            else {
                  fatalError("documentDirectoryのURL取得エラーでアプリをクラッシュさせました")
              }
        print("取得したdireUrlは\(dirURL)です")
        let fileURL = dirURL.appendingPathComponent(fileName)
        print("fileURL\(fileURL)を取得")
        return fileURL
        }
    
    func getFileArray() -> [String]{
        var filelist : [String] = []
        
        let dirURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            do {
                let contentUrls = try FileManager.default.contentsOfDirectory(at: dirURL, includingPropertiesForKeys: nil)
                filelist = contentUrls.map{$0.lastPathComponent}
                print(filelist)
            }
            catch let error {
                print(error)
                }
            return filelist
    }
}
