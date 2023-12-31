//
//  CreditsView.swift
//  Africa
//
//  Created by Amin on 03/12/2023.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        
        VStack {
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)
            Text("""
            Copyright © Mahmoud Amin
            All Right reserved
            Better apps ♡ less code
            """)
            .font(.footnote)
            .multilineTextAlignment(.center)
        } //: VStack
        .padding()
        .opacity(0.4)
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
