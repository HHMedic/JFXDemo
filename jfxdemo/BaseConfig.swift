//
//  BaseConfig.swift
//  jfxdemo
//
//  Created by 程言方 on 2021/8/4.
//

import UIKit

class BaseConfig: NSObject {
    private static let CacheKey = "IsDevelop"
    
    static func setDevelopState(_ isDevelop:Bool) {
        UserDefaults.standard.setValue(isDevelop, forKey: CacheKey)
    }
    
    static func developState() -> Bool {
        return UserDefaults.standard.bool(forKey: CacheKey)
    }
    
    static func registerDefault() {
        UserDefaults.standard.register(defaults: [CacheKey:true])
    }
}
