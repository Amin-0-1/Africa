//
//  GalleryView.swift
//  Africa
//
//  Created by Amin on 29/08/2023.
//

import SwiftUI

struct GalleryView: View {
    @State private var selectedAnimal:String = "lion"
    let animals:[Animal] = Bundle.main.decode("animals.json")
    
    // MARK: - Simple grid defination
   //let gridLayout : [GridItem] = [
   //    GridItem(.flexible()),
   //    GridItem(.flexible()),
   //    GridItem(.flexible()),
   //]
    
    // MARK: - Effecient grid defination
    let gridLayout:[GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            // MARK: - Grid
            VStack(spacing: 30) {
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white,lineWidth: 8))
                
                LazyVGrid(columns: gridLayout,spacing: 10) {
                    ForEach(animals) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(.white,lineWidth: 1))
                            .onTapGesture {
                                selectedAnimal = item.image
                            }
                    }
                }
            }
            .padding(.horizontal,10)
            .padding(.vertical,50)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background{
            MothionAnimationView()
                .ignoresSafeArea(edges: .top)
        }
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
