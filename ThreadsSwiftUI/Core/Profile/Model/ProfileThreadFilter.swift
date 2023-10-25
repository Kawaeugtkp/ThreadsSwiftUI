//
//  ProfileThreadFilter.swift
//  ThreadsSwiftUI
//
//  Created by 川尻辰義 on 2023/09/03.
//

import Foundation

enum ProfileThreadFilter: Int, CaseIterable, Identifiable { // CaseIterableはallCasesが使うため、それが使えるということが利点みたい
    case threads
    case replies
    
    var title: String {
        switch self {
        case .threads: return "Threads"
        case .replies: return "Replies"
        }
    }
    
    var id: Int { return self.rawValue }
}
