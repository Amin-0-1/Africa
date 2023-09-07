//
//  VideoPlayerView.swift
//  Africa
//
//  Created by Amin on 07/09/2023.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    var selectedVideo:String
    var title:String
    var body: some View {
        VStack{
            VideoPlayer(player: playVideo(fileName: selectedVideo, fileFormat: "mp4"))
                .overlay(alignment: .topLeading) {
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32)
                        .padding(.top,6)
                        .padding(.horizontal,8)
                }
                .navigationTitle(title)
                .navigationBarTitleDisplayMode(.inline)
                .onAppear {
                    
                }
        }
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VideoPlayerView(selectedVideo: "cheetah", title: "Cheetah")
        }
    }
}
