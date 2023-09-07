//
//  VideoListView.swift
//  Africa
//
//  Created by Amin on 29/08/2023.
//

import SwiftUI

struct VideoListView: View {
    
    @State var videos:[Video] = Bundle.main.decode("videos.json")
    let haptic = UIImpactFeedbackGenerator(style: .soft)
    var body: some View {
        NavigationView {
            List{
                ForEach(videos) { item in
                    NavigationLink {
                        VideoPlayerView(selectedVideo: item.id, title: item.name)
                    } label: {
                        VideoListItemView(video: item)
                            .padding(.vertical,8)
                    }
                }
            }
            .navigationTitle("Videos")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        videos.shuffle()
                        haptic.impactOccurred()
                    } label: {
                        Image(systemName: "arrow.2.squarepath")
                    }

                }
            }
        } // :  Navigation
    }
}

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
