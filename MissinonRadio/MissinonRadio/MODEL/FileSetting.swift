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
    
    //ファイルurlの作成
    func fileSet(name: String) -> URL? {
         documentDirectoryFileURL =  fileManager.urls(for: .documentDirectory,in: .userDomainMask)
            .first?.appendingPathComponent(name)
    }
    
    // ドキュメントディレクトリの「パス」（String型）定義
        let filePath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]

       //②保存するためのパスを作成する
        func createLocalDataFile() {
            // 作成するテキストファイルの名前
            let fileName = "localData.png"

            // DocumentディレクトリのfileURLを取得
            if documentDirectoryFileURL != nil {
                // ディレクトリのパスにファイル名をつなげてファイルのフルパスを作る
                let path = documentDirectoryFileURL?.appendingPathComponent(fileName)
                documentDirectoryFileURL = path
            }
        }
    
    
    //ディレクトリ内のファイル一覧を取得
    func getFileNames(name: String) {
        
        _ = try? FileManager.default.contentsOfDirectory(atPath: name)
    }
}

