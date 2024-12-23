//
//  GlobalFunctions.swift
//  CRMSystem
//
//  Created by Ahmed beddah on 23/12/2024.
//

import Foundation

func valueOfSecret(named keyname:String) -> String {
    let filePath = Bundle.main.path(forResource: "SecretKeys", ofType: "plist")
    let plist = NSDictionary(contentsOfFile:filePath!)
    let value = plist?.object(forKey: keyname) as! String
    return value
}
