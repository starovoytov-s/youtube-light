//
//  VideoTableViewCell.swift
//  youtube-light
//
//  Created by Stanislav Starovoytov on 13.10.2020.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
    
        
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBOutlet weak var dateLabel: UILabel!
    
    var video: Video?
    
    
    func setCell(_ v: Video) {
        self.video = v
        guard self.video != nil else {
            return
        }
        
        
        self.titleLabel.text = video?.title
        
        
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        self.dateLabel.text = df.string(from: video!.published)
        
        guard self.video?.thumbnail != nil else {
            return
        }
        
        // check cache before downloading data
        
        if let cachedData = CacheManager.getVideoCache(self.video!.thumbnail) {
            // set the thumbnail ImageView
            self.thumbnailImageView.image = UIImage(data: cachedData)
        }
        
        
        // download the data
        let url = URL(string: self.video!.thumbnail)
        
        
        let session = URLSession.shared
        
        
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            if error == nil && data != nil {
                
                // save data to cache
                CacheManager.setVideoCache(url!.absoluteString, data)
                
                // check that downloaded url matches the video thumbnail url that this cell is set to display
                if url?.absoluteString != self.video?.thumbnail {
                    // video cell has been recylced for another video and no longer matches the thumbnail that was downloaded
                    return
                }
                
                // create the image object
                let image = UIImage(data: data!)
                
                DispatchQueue.main.async {
                    self.thumbnailImageView.image = image
                }
            }
        }
        
        dataTask.resume()
        
    }

}
