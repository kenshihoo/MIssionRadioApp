//
//  FileManager.swift
//  MissinonRadio
//
//  Created by Kenshiro on 2021/03/05.
//

import Foundation

class FileSetting{
    let fileManager: FileManager = .default
    
    //ファイルの設定
    func fileSet(name: String) -> URL? {
        fileManager.urls(
                for: .documentDirectory,
                in: .userDomainMask
            ).first?.appendingPathComponent(name)
        
    }
}

