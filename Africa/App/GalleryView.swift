//
//  GalleryView.swift
//  Africa
//
//  Created by Amin on 29/08/2023.
//

import SwiftUI

struct GalleryView: View {
    @State private var selectedAnimal:String = "lion"
    @State private var sliderValue:Float = 0.5
    private var haptic:UIImpactFeedbackGenerator = .init(style: .soft)
    let animals:[Animal] = Bundle.main.decode("animals.json")

    
    // MARK: - Effecient grid defination
    // let gridLayout:[GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    // MARK: - dynamic grid
    @State private var gridLayout:[GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Double = 3.0
    
    func gridSwitch(){
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
    }
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            // MARK: - Grid
            VStack(spacing: 30) {
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white,lineWidth: 8))
                
                Slider(value: $gridColumn, in: 2...4,step:1)
                    .onChange(of: gridColumn, perform: { value in
                        withAnimation {
                            gridSwitch()
                        }
                    })
                
                LazyVGrid(columns: gridLayout,spacing: 10) {
                    ForEach(animals) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(.white,lineWidth: 1))
                            .onTapGesture {
                                haptic.impactOccurred()
                                selectedAnimal = item.image
                            }
                    }
                }
                .onAppear(perform: {
                    gridSwitch()
                })
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
