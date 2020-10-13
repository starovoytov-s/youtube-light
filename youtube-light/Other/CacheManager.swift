//
//  CacheManager.swift
//  youtube-light
//
//  Created by Stanislav Starovoytov on 13.10.2020.
//

import Foundation



class CacheManager {
    
    static var cache = [String:Data]()
    
    static func setVideoCache(_ url: String, _ data: Data?) {
        
        // url as the key
        cache[url] = data
        
    }
    
    
    static func getVideoCache(_ url: String) -> Data? {
        
        // try to get data
        return cache[url]
    }
    
}
