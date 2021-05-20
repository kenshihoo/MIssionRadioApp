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
        let path = Bundle.main.bundlePath
        do {
            let files = try fileManager.contentsOfDirectory(atPath: path)
            
            for file in files {
                // ファイル名の後方が.pngであればtrueとなる
                if file.hasSuffix(".m4a") {
                    filelist.append(file)
                }
            }
    }
    catch let error {
        print(error)
        }
        return filelist
    }
}
///fileNameのファイルが作成されていない場合には、新規でファイルを作成する
//        if FileManager.default.fileExists(atPath: fileURL.path) == true {
//            print("すでにあるファイルがあるので新規作成しません")
//        } else {
//            print("ファイルを新規作成します")
//
////             ファイルが存在しないため、新規に作成する
//            do{
//
//                 try audioFile = AVAudioFile(forWriting:fileURL,settings: RecordSetting().formatSettig)}
//            catch{print("ファイル作成エラー")}
//
//            if FileManager.default.createFile(atPath: fileURL.path,contents: nil,attributes: nil) == true{
//               print( "ファイルを新規作成")
//            } else {
//                print("ファイルの新規作成に失敗")
//            }
//        }
