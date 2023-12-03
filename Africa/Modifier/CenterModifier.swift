//
//  CenterModifier.swift
//  Africa
//
//  Created by Amin on 03/12/2023.
//

import SwiftUI

struct CenterModifier: ViewModifier{
    func body(content: Content) -> some View {
        HStack{
            Spacer()
            content
            Spacer()
        }
    }
}
