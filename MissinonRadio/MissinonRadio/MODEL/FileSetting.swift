//
//  FileManager.swift
//  MissinonRadio
//
//  Created by Kenshiro on 2021/03/05.
//

import Foundation

class FileSetting:FileManager{
    
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
    func getFileNames() -> [String] {
        let documentPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].absoluteString
        
        guard let fileNames = try? FileManager.default.contentsOfDirectory(atPath: documentPath) else {
            return ["ファイル一覧取得エラー"]
        }
        return fileNames
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
