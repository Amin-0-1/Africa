//
//  VideoModel.swift
//  Africa
//
//  Created by Amin on 04/09/2023.
//

import Foundation

struct Video:Codable,Identifiable{
    let id:String
    let name:String
    let headline:String
    
    // computed property
    
    var thumbnail:String{
        return "video-\(id)"
    }
}
