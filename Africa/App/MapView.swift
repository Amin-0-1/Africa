//
//  MapView.swift
//  Africa
//
//  Created by Amin on 29/08/2023.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @State private var region:MKCoordinateRegion = {
        let mapCoordinate = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        return .init(center: mapCoordinate, span: mapZoomLevel)
    }()
    
    let locations:[NationalParkLocation] = Bundle.main.decode("locations.json")
    
    var body: some View {
        
        ZStack{
            // MARK: - Basci Map
//                    Map(coordinateRegion: $region)
            
            // MARK: - Advanced Map
            Map(coordinateRegion: $region, annotationItems: locations) { item in
                
                // MARK: - A olde style (always static)
//                MapPin(coordinate: item.location,tint: .accentColor)
                
                // MARK: - B Marker: New style (always static)
//            MapMarker(coordinate: item.location,tint: .accentColor)
                
                // MARK: - C Custom Basic Annotation: (it could be interactive)
//                MapAnnotation(coordinate: item.location) {
//                    Image("logo")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 32, height: 32,alignment: .center)
//                }
                // MARK: - D Custom Advanced Annotation (it could be interactive)
                MapAnnotation(coordinate: item.location) {
                    MapAnnotationView(location: item)
                }
                
            }
            .ignoresSafeArea()
            .overlay(alignment: .top) {
                HStack(spacing: 12) {
                    Image("compass")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 48, height: 48)
                    VStack(alignment: .leading, spacing: 3) {
                        HStack{
                            Text("Lattitude:")
                                .font(.footnote)
                                .fontWeight(.bold)
                                .foregroundColor(.accentColor)
                            
                            Spacer()
                            Text(String(format: "%f", region.center.latitude))
                                .font(.footnote)

                        }
                        Divider()
                        HStack{
                            Text("Longitude:")
                                .font(.footnote)
                                .fontWeight(.bold)
                                .foregroundColor(.accentColor)
                            
                            Spacer()
                            Text(String(format: "%f", region.center.longitude))
                                .font(.footnote)
                            
                        }
                    }
                }
                .padding(.vertical,12)
                .padding(.horizontal,16)
                .background{
                    Color.black.opacity(0.6)
                        .cornerRadius(8)
                }
                .padding(.horizontal)
                
            }
            
            
        }

    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
