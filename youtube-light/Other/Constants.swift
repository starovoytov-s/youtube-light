//
//  Constants.swift
//  youtube-light
//
//  Created by Stanislav Starovoytov on 12.10.2020.
//

import Foundation


struct Constants {
    static var API_KEY = "AIzaSyCyX-GVZqKuGnG9iDpSJvx1M2N6AzzUZXM"
    static var PLAYLIST_ID = "UU2D6eRvCeMtcF5OGHf1-trw"
    static var API_URL =   "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
    
    static var VIDEOCELL_ID = "VideoCell"
    static var YT_EMBED_URL = "http://www.youtube.com/embed/"
}


