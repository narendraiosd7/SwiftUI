//
//  DocumentAdapter.swift
//  LoginPage
//
//  Created by Vadde Narendra on 8/22/20.
//  Copyright © 2020 Narendra Vadde. All rights reserved.
//

import Foundation

enum DocumentPath: String {
    case translation = "translation"
}

class DocumentAdpter {
    static func saveToFile (_ data: Data, path: String) {
        do {
            var documentPath = getDirectoryPath()
            documentPath.append("/" + path)
            createFolderForPath(path: documentPath)
            try data.write(to: URL(fileURLWithPath: documentPath))
        } catch let error {
            print(error)
        }
    }
    
    static func createFolderForPath(path: String) {
        var folderPath = getDirectoryPath()
        var components = path.components(separatedBy: "\(folderPath)")
        components = components.last?.components(separatedBy: "/") ?? []
        
        _ = components.popLast()
        
        for each in components {
            folderPath = folderPath + "/\(each)"
            if !(FileManager().fileExists(atPath: folderPath)) {
                try? FileManager().createDirectory(atPath: folderPath, withIntermediateDirectories: true, attributes: nil)
            }
        }
    }
    
    static func getDirectoryPath() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
    static func getData(path: String) -> Data? {
        return UserDefaults.standard.value(forKey: path) as? Data
    }
    
    static func getSizeForFile(filePath: String) -> Double {
        do {
            let attr = try FileManager.default.attributesOfItem(atPath: filePath)
            
            if let size = attr[FileAttributeKey.size] as? NSNumber {
                return size.doubleValue/1000000.0
            }
        }  catch {
            
        }
        return 0
    }
}

