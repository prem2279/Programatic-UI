//
//  Greeting.swift
//  Programatic UI
//
//  Created by Prem Kumar Gundu on 6/8/26.
//

func greetUser(name: String) -> String {
    if name.isEmpty {
        return "Hello, Guest!"
    }
    return "Hello, \(name)!"
}
