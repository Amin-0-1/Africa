//
//  VideoPlayerHelper.swift
//  Africa
//
//  Created by Amin on 07/09/2023.
//

import Foundation
import AVKit

var player:AVPlayer?

func playVideo(fileName:String,fileFormat:String)->AVPlayer{
    guard let url = Bundle.main.url(forResource: fileName, withExtension: fileFormat) else {
        return .init()
    }
    let player = AVPlayer(url: url)
    player.play()
    return player
}
