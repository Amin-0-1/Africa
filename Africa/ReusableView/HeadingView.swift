//
//  HeadingView.swift
//  Africa
//
//  Created by Amin on 01/09/2023.
//

import SwiftUI

struct HeadingView: View {
    
    var headingImage:String
    var headingText:String
    
    var body: some View {
        HStack {
            Image(systemName: headingImage)
                .foregroundColor(.accentColor)
            Text(headingText)
                .font(.title3)
                .fontWeight(.bold )
        }
        .padding(.vertical)
        
    }
}

struct HeadingView_Previews: PreviewProvider {
    static var previews: some View {
        HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
