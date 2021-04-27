//
//  FileManager.swift
//  MissinonRadio
//
//  Created by Kenshiro on 2021/03/05.
//

import Foundation

class FileSetting:FileManager{
    
    //必要だと思って作ったけど不要そうなインスタンス
    //let fileManager: FileManager = .default
    let dirUrl = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("record.m4a")
   
    
    //タイムスタンプを取得する
    func getRecordTime() -> String  {
        let format = DateFormatter()
        format.timeStyle = .medium
        format.dateStyle = .medium
        format.locale = Locale(identifier: "ja_JP")
        let now = Date()
        return(format.string(from: now))
    }
    
   
    
    //ディレクトリ内のファイル一覧を取得
    func getFileNames(name: String) {
        
        _ = try? FileManager.default.contentsOfDirectory(atPath: name)
    }
    
}

////Documentsフォルダのurlを作成
////最初に作成したDocumentsフォルダのurl作成のメソッド
//func createDirectory() -> URL? {
//    guard let dirUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
//    else {
//            fatalError("ディレクトリのULR取得時のエラー")
//        }
//    return(dirUrl)
//}
