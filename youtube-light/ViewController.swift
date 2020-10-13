//
//  ViewController.swift
//  youtube-light
//
//  Created by Stanislav Starovoytov on 11.10.2020.
//

import UIKit

class ViewController: UIViewController, ModelDelegate {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var model = Model()
    var videos = [Video]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        model.delegate = self
        
        model.getVideos()
     
    
    }
    
    
    func videosFetched(_ videos: [Video]) {
        
        
        // set the returned videos to our video property
        self.videos = videos
        
        
        // refresh tableview
        
        tableView.reloadData()
        
        
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath)
        
        // configure cell with data
        let title = self.videos[indexPath.row].title
        cell.textLabel?.text = title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
}

