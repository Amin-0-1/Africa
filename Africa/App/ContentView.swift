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
    
    var body: some View {
        NavigationView {
            Group{
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
                    Text("show grid")
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
                        .font(.title2)
                        .foregroundStyle(isGridViewActive ? .primary : Color.accentColor)
                        
                        Button(action: {
                            isGridViewActive = true
                            haptics.impactOccurred()
                        }, label: {
                            Image(systemName: "square.grid.2x2")
                        })
                        .font(.title2)
                        .foregroundStyle(isGridViewActive ? Color.accentColor : .primary )
                    }
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
