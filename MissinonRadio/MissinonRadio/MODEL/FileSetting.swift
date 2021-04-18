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
    func getRecordTime()  {
        let format = DateFormatter()
        format.timeStyle = .medium
        format.dateStyle = .medium
        format.locale = Locale(identifier: "ja_JP")
        let now = Date()
        print(format.string(from: now))
    }
    
    //ディレクトリのurlを作成
    func createDirectory(name: String) -> URL? {
         documentDirectoryFileURL =  fileManager.urls(for: .documentDirectory,in: .userDomainMask)
            .first?.appendingPathComponent(name)
        
        return(documentDirectoryFileURL)
    }
    
    
       //②保存するためのパスを作成する
    func createFilePath(fileUrl:URL,fileName:String) {
        // ドキュメントディレクトリの「パス」（String型）定義
            let filePath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]

            // DocumentディレクトリのfileURLを取得 ディレクトリのパスにファイル名をつなげてファイルのフルパスを作る
                let path = fileUrl.appendingPathComponent(fileName)
        }
    
    
    //ディレクトリ内のファイル一覧を取得
    func getFileNames(name: String) {
        
        _ = try? FileManager.default.contentsOfDirectory(atPath: name)
    }
}

