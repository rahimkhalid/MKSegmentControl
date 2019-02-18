//
//  ViewController.swift
//  MKSegmentControl
//
//  Created by Rahim on 11/19/18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segmentControlContainer: UIView!
    var segment:MKSegmentControl?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        setupSegmentControl()
    }
    
    func setupSegmentControl (){
        
        segment = MKSegmentControl(presenter: segmentControlContainer, configuration: MKSegmentControlConfiguration())
        
        segment?.setSectionTitles(titles: ["I am third","I am third third third","I am third","I am third third third"])
    }


}


