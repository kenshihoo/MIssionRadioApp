//
//  FileManager.swift
//  MissinonRadio
//
//  Created by Kenshiro on 2021/03/05.
//

import Foundation

class FileSetting{
    let fileManager: FileManager = .default
    var documentDirectoryFileURL :URL?
    
    //タイムスタンプを取得する
    func getRecordTime() -> String  {
        let format = DateFormatter()
        format.timeStyle = .medium
        format.dateStyle = .medium
        format.locale = Locale(identifier: "ja_JP")
        let now = Date()
        return(format.string(from: now))
    }
    
    //Documentsフォルダのurlを作成
    func createDirectory() -> URL? {
        guard let dirUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        else {
                fatalError("ディレクトリのULR取得時のエラー")
            }
        return(dirUrl)
    }
    
    //ディレクトリ内のファイル一覧を取得
    func getFileNames(name: String) {
        
        _ = try? FileManager.default.contentsOfDirectory(atPath: name)
    }
}

