//
//  Persistence+Helper.swift
//  CodeReader
//
//  Created by Ibrahim Hassan on 29/06/21.
//

class PersistanceHelper {
    
    func getFileName(for content: String) -> String {
        String(content.prefix(10)) + ".txt"
    }
    
    func createMenuItem(for texts: [String]) -> [MenuItem] {
        return texts.map { text in
            MenuItem.init(title: getFileName(for: text), content: text)
        }
    }
}
