//
//  DetailViewController.swift
//  youtube-light
//
//  Created by Stanislav Starovoytov on 13.10.2020.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    
    @IBOutlet weak var webView: WKWebView!
    
    
    @IBOutlet weak var textView: UITextView!
    
    
    var video: Video?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        titleLabel.text = ""
        dateLabel.text = ""
        textView.text = ""
        
        
        // check if there is a video
        guard video != nil else {
            return
        }
        
        // create and set all content
        let embedUrlString = Constants.YT_EMBED_URL + video!.videoId
        
        let url = URL(string: embedUrlString)
        let request = URLRequest(url: url!)
        webView.load(request)
        
        titleLabel.text = video!.title
        
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        dateLabel.text = df.string(from: video!.published)
        
        textView.text = video!.description
        
        
    }
    


}
