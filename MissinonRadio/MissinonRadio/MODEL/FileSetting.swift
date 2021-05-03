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
    
    
    //録音データを入れるファイルのurl取得とファイル作成
    func getFileNames(fileName:String) -> URL  {
        guard let dirURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
                  fatalError("documentDirectoryのURL取得エラーでアプリをクラッシュさせました")
              }
        print("取得したdireUrlは\(dirURL)です")
        let fileURL = dirURL.appendingPathComponent(fileName)
        print("fileURL\(fileURL)を取得")
        
        // fileNameのファイルが作成されていない場合には、新規でファイルを作成する
        if FileManager.default.fileExists(atPath: fileURL.path) == true {
            print("すでにあるファイルがあるので新規作成しません")
        } else {
            print("ファイルを新規作成します")
            // ファイルが存在しないため、新規に作成する
            if FileManager.default.createFile(atPath: fileURL.path,contents: nil,attributes: nil) == true {
               print( "ファイルを新規作成")
            } else {
                print("ファイルの新規作成に失敗")
            }
        }
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
