//
//  ViewController.swift
//  youtube-light
//
//  Created by Stanislav Starovoytov on 11.10.2020.
//

import UIKit

class ViewController: UIViewController {
    
    var model = Model()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        model.getVideos()
        
    }


}

