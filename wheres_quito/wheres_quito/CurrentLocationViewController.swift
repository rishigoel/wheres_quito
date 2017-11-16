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
    var scheduler = Scheduler()
    
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
        layer.colors = [colours.orange.cgColor, colours.purple.cgColor]
        self.view.layer.addSublayer(layer)
        locationLabel.frame = CGRect(x: 0, y: self.view.bounds.height/4, width: self.view.bounds.width, height: 100)
        locationLabel.textAlignment = .center
        locationLabel.numberOfLines = 0
        scheduleButton.frame = CGRect(x: 25, y: self.view.bounds.height * 3/4, width: self.view.bounds.width - 50, height: 50)
        self.view.addSubview(locationLabel)
        self.view.addSubview(scheduleButton)
    }
    
    func configureView() {
        locationLabel.text = getLocation()
        locationLabel.font = locationLabel.font.withSize(32.0)
        locationLabel.textColor = UIColor.white
        scheduleButton.setTitle("Check Quito's Schedule", for: .normal)
        scheduleButton.layer.cornerRadius = 5.0
        scheduleButton.backgroundColor = colours.teal
    }
    
    func getLocation() -> String {
        let currentDate = scheduler.date
        var listedDate: TimeInterval?
        var dateArray = [TimeInterval]()
        if currentDate.timeIntervalSince1970 < scheduler.timeStamp2018 {
            for (timeInterval, _) in scheduler.scheduleDict2017 {
                dateArray.append(timeInterval)
            }
            dateArray.sort()
            for date in dateArray {
                if currentDate.timeIntervalSince1970 >= date {
                    listedDate = date
                } else {
                    break
                }
            }
            if let quitoLocation = listedDate, let dict = scheduler.scheduleDict2017[quitoLocation] {
                return dict
            } else {
                return scheduler.unknown
            }
        } else {
            return scheduler.unknown
        }
    }
    
}

