//
//  ToDoList.swift
//  Programatic UI
//
//  Created by Prem Kumar Gundu on 6/8/26.
//

struct TodoManager {
    var items: [String] = []
 
    mutating func addItem(_ item: String) {
        items.append(item)
    }
 
    mutating func removeItem(at index: Int) {
        items.remove(at: index)
    }
 
    var count: Int {
        return items.count
    }
}
