//
//  AnimalModel.swift
//  Africa
//
//  Created by Amin on 30/08/2023.
//

import SwiftUI

struct Animal:Codable,Identifiable{
    let id : String
    let name:String
    let headline:String
    let description:String
    let link:String
    let image:String
    let gallery:[String]
    let fact:[String]
    
    static func firstAnimal() -> Animal? {
        let animals: [Animal] = Bundle.main.decode("animals.json")
        return animals[0]
    }
}
