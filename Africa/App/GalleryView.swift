//
//  GalleryView.swift
//  Africa
//
//  Created by Amin on 29/08/2023.
//

import SwiftUI

struct GalleryView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background{
            MothionAnimationView()
                .ignoresSafeArea()
        }
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
