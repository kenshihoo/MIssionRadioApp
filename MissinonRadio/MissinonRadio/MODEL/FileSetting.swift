//
//  FileManager.swift
//  MissinonRadio
//
//  Created by Kenshiro on 2021/03/05.
//

import Foundation

class FileSetting:FileManager{
    
    //タイムスタンプを取得する
    func getRecordTime() -> String  {
        let format = DateFormatter()
        format.timeStyle = .medium
        format.dateStyle = .medium
        format.locale = Locale(identifier: "ja_JP")
        let now = Date()
        return(format.string(from: now))
    }
    
    
    //録音データを入れるfileのurlを取得
    func getFileNames(fileName:String) -> URL  {
        guard let dirURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
                  fatalError("documentDirectoryのURL取得エラーでアプリをクラッシュさせました")
              }
        let fileURL = dirURL.appendingPathComponent(fileName)
        return fileURL
    }
    
    //録音データを書き込む
    func writefile(fileUrl:URL,data:String){
        do {
            try data.write(to: fileUrl, atomically: true, encoding: .utf8)
            }
        catch {print("書き込み時のエラーです: \(error)")}
    }
}
