//
//  LegitLocationViewController.swift
//  wheres_quito
//
//  Created by Rishi Goel on 11/17/17.
//  Copyright © 2017 Rishi Goel. All rights reserved.
//

import UIKit

class LegitLocationViewController: UIViewController {
    var locationLabel = UILabel()
    var location: String?
    var colours: Colours?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        if let location = location {
            locationLabel.text = location
        }

    }
    
    func setUpView() {
        let layer = CAGradientLayer()
        layer.frame = self.view.bounds
        if let colours = colours {
            layer.colors = [colours.teal.cgColor, colours.red.cgColor, colours.black.cgColor]
            self.view.layer.addSublayer(layer)
        }
        locationLabel.frame = CGRect(x: 0, y: self.view.bounds.height/4, width: self.view.bounds.width, height: 100)
        locationLabel.textAlignment = .center
        locationLabel.numberOfLines = 0
        locationLabel.font = locationLabel.font.withSize(32.0)
        locationLabel.textColor = UIColor.white
        self.view.addSubview(locationLabel)
    }
}
