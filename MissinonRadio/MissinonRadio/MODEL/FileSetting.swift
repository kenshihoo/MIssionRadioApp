//
//  FileManager.swift
//  MissinonRadio
//
//  Created by Kenshiro on 2021/03/05.
//

import Foundation

class FileSetting{
    let fileManager: FileManager = .default
    
    //ファイルの作成
    func fileSet(name: String) -> URL? {
        fileManager.urls(for: .documentDirectory,in: .userDomainMask)
            .first?.appendingPathComponent(name)
    }
    
    
    //ディレクトリ内のファイル一覧を取得
    func getFileNames(name: String) {
        
        _ = try? FileManager.default.contentsOfDirectory(atPath: name)
    }
}

