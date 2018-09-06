//
//  ViewController.swift
//  DCFilterView
//
//  Created by vberihuete on 09/06/2018.
//  Copyright (c) 2018 vberihuete. All rights reserved.
//

import UIKit
import DCFilterView

class ViewController: UIViewController {

    @IBOutlet weak var containerSV: UIStackView!
    @IBOutlet weak var changeLabel: UILabel!
    
    var filterView: DCFilterView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       //init the filterView
        filterView = DCFilterView(items: ["Popular", "Related", "Oldest"], color: .black, selectedColor: .red, selectedIndex: 1)
        //assign the delegate in order to receive the selection change
        filterView.delegate = self
        
        changeLabel.text = "selected 1"
        
        //add it to a stack view
        self.containerSV.insertArrangedSubview(filterView, at: 0)
        
        //give it a size
        self.containerSV.addConstraint(NSLayoutConstraint(item: self.filterView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40))
    }

}

extension ViewController: DCFilterViewDelegate{
    
    func dcFilterView(selected index: Int) {
        changeLabel.text = "Selected \(index)"
    }
    
}
