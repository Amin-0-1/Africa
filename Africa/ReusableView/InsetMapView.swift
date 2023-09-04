//
//  InsetMapView.swift
//  Africa
//
//  Created by Amin on 04/09/2023.
//

import SwiftUI
import MapKit

struct InsetMapView: View {
    @State private var region = MKCoordinateRegion(center: .init(latitude: 6.600286, longitude: 16.4377599), span: .init(latitudeDelta: 60.0, longitudeDelta: 60.0))
    var body: some View {
        Map(coordinateRegion: $region)
            .overlay(alignment:.topTrailing,content: {
                NavigationLink {
                    MapView()
                } label: {
                    HStack{
                        Image(systemName: "mappin.circle")
                            .foregroundColor(.white)
                            .imageScale(.large)
                        
                        Text("Locations")
                            .foregroundColor(.accentColor)
                            .fontWeight(.bold)
                    }
                    .padding(.vertical,10)
                    .padding(.horizontal,14)
                    .background(){
                        Color.black
                            .opacity(0.4)
                            .cornerRadius(8)
                    }
                }
                .padding(12)

            })
            .frame(height: 256)
            .cornerRadius(12)
    }
}

struct InsetMapView_Previews: PreviewProvider {
    static var previews: some View {
        InsetMapView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
