//
//  Persistence.swift
//  CodeReader
//
//  Created by Ibrahim Hassan on 29/06/21.
//

import Foundation

class Persistance {
        
    func save(_ str: String) {
        let filename = String(str.prefix(10)) + ".txt"
        let fileURL = getDocumentsDirectory().appendingPathComponent(filename)

        do {
            try str.write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
        } catch {
            // failed to write file – bad permissions, bad filename, missing permissions, or more likely it can't be converted to the encoding
        }
    }
    
    func retrieve() -> [MenuItem]? {
        let documentsUrl = getDocumentsDirectory()
        do {
            // Get the directory contents urls (including subfolders urls)
            let directoryContents = try FileManager.default.contentsOfDirectory(at: documentsUrl, includingPropertiesForKeys: nil)
            let strings = directoryContents.compactMap { (fileURL) -> String?  in
                if let savedData = try? Data(contentsOf: fileURL),
                   let savedString = String(data: savedData, encoding: .utf8) {
                   return (savedString)
                }
                return nil
            }
            
            return (PersistanceHelper().createMenuItem(for: strings))
        } catch {
            print(error)
        }
        return nil
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
