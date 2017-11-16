//
//  CurrentLocationViewController.swift
//  wheres_quito
//
//  Created by Rishi Goel on 11/16/17.
//  Copyright © 2017 Rishi Goel. All rights reserved.
//

import UIKit

class CurrentLocationViewController: UIViewController {
    var locationLabel: UILabel = UILabel()
    var scheduleButton: UIButton = UIButton()
    var colours = Colours()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        setUpView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setUpView() {
        let layer = CAGradientLayer()
        layer.frame = self.view.bounds
        layer.colors = [colours.purple.cgColor, colours.orange.cgColor]
        self.view.layer.addSublayer(layer)
        locationLabel.frame = CGRect(x: 0, y: self.view.bounds.height/4, width: self.view.bounds.width, height: 100)
        locationLabel.textAlignment = .center
        scheduleButton.frame = CGRect(x: 25, y: self.view.bounds.height * 3/4, width: self.view.bounds.width - 50, height: 50)
        self.view.addSubview(locationLabel)
        self.view.addSubview(scheduleButton)
    }
    
    func configureView() {
        locationLabel.text = "Where's Quito?"
        locationLabel.textColor = UIColor.white
        scheduleButton.setTitle("Who Knows", for: .normal)
        scheduleButton.layer.cornerRadius = 5.0
        scheduleButton.backgroundColor = colours.teal
    }
    
}

