//
//  ExternalWebView.swift
//  Africa
//
//  Created by Amin on 04/09/2023.
//

import SwiftUI

struct ExternalWebView: View {
    let animal:Animal
    var body: some View {
        GroupBox{
            Link(destination: URL(string: animal.link) ?? URL(string:"https://wikipedia.org")!) {
                HStack{
                    Label {
                        Text("Wikipedia")
                    } icon: {
                        Image(systemName: "globe")
                    }
                    .foregroundColor(.primary)
                    
                    Spacer()
                    
                    Label {
                        Text(animal.name)
                    } icon: {
                        Image(systemName: "arrow.up.right.square")
                    }

                }
            }
        }
    }
}

struct ExternalWebView_Previews: PreviewProvider {
    static let animals:[Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        ExternalWebView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
