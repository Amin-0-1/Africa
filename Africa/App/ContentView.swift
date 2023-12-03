 //
//  ContentView.swift
//  Africa
//
//  Created by Amin on 28/08/2023.
//

import SwiftUI

struct ContentView: View {
    let animals:[Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .soft)
    @State private var isGridViewActive = false
    @State private var gridLayout: [GridItem] = [.init(.flexible())]
    @State private var gridColumn: Int = 0
    @State private var toolbarIcon = "square.grid.2x2"
    
    func gridSwitcher() {
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count
        print("grid number \(gridColumn)")
        switch gridColumn {
            case 2:
                toolbarIcon = "square.grid.3x2"
            case 3:
                toolbarIcon = "rectangle.grid.1x2"
            default:
                toolbarIcon = "square.grid.2x2"
                
        }
    }
    
    var body: some View {
        NavigationView {
            Group {
                if !isGridViewActive {
                    List{
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
                        ForEach(animals) { animal in
                             
                            NavigationLink {
                                AnimalDetailView(animal: animal)
                            } label: {
                                AnimalListItemView(animal: animal)
                            }
                        }
                    }
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals) { animal in
                                NavigationLink {
                                    AnimalDetailView(animal: animal)
                                } label: {
                                    AnimalGridItemView(animal: animal)
                                }

                            }
                        }
                        .padding(10)
                        .animation(.easeIn,value: gridColumn)
                    }
//                    Text("Grid View is active")
                }
            }
            .listStyle(.plain)
            .navigationTitle("Africa")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    HStack(spacing: 15) {
                        Button(action: {
                            isGridViewActive = false
                            haptics.impactOccurred()
                        }, label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                        })
                        .foregroundStyle(isGridViewActive ? .primary : Color.accentColor)
                        
                        Button(action: {
                            isGridViewActive = true
                            haptics.impactOccurred()
                            gridSwitcher()
                        }, label: {
                            Image(systemName: toolbarIcon)
                        })
                        .foregroundStyle(isGridViewActive ? Color.accentColor : .primary )
                    }
                    .font(.title2)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
