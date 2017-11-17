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
    var liveLocationButton: UIButton = UIButton()
    var colours = Colours()
    var scheduler = Scheduler()
    var dateArray = [TimeInterval]()
    var randomizr = Randomizr()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stylizeNavBar()
        configureView()
        setUpView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func stylizeNavBar() {
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    func setUpView() {
        let layer = CAGradientLayer()
        layer.frame = self.view.bounds
        layer.colors = [colours.orange.cgColor, colours.purple.cgColor, colours.black.cgColor]
        self.view.layer.addSublayer(layer)
        locationLabel.frame = CGRect(x: 0, y: self.view.bounds.height/4, width: self.view.bounds.width, height: 100)
        locationLabel.textAlignment = .center
        locationLabel.numberOfLines = 0
        scheduleButton.frame = CGRect(x: 25, y: self.view.bounds.height * 3/4, width: self.view.bounds.width - 50, height: 50)
        liveLocationButton.frame = CGRect(x: 25, y: self.view.bounds.height * 3/4 + 75, width: self.view.bounds.width - 50, height: 50)
        self.view.addSubview(locationLabel)
        if is2017() {
            self.view.addSubview(scheduleButton)
            self.view.addSubview(liveLocationButton)
        }
    }
    
    func configureView() {
        locationLabel.text = getLocation()
        locationLabel.font = locationLabel.font.withSize(32.0)
        locationLabel.textColor = UIColor.white
        makeButton(scheduleButton, "Check Quito's Schedule", #selector(showSchedule))
        makeButton(liveLocationButton, "Check Quito's legit location", #selector(showLegitLocation))
        liveLocationButton.layer.cornerRadius = 5.0
        liveLocationButton.backgroundColor = colours.teal
    }
    
    func makeButton(_ button: UIButton, _ title: String, _ target: Selector) {
        button.setTitle(title, for: .normal)
        button.layer.cornerRadius = 5.0
        button.backgroundColor = colours.teal
        button.addTarget(self, action: target, for: .touchUpInside)
    }
    
    func getLocation() -> String {
        var listedDate: TimeInterval?
        if is2017() {
            for (timeInterval, _) in scheduler.scheduleDict2017 {
                dateArray.append(timeInterval)
            }
            dateArray.sort()
            for date in dateArray {
                if scheduler.date.timeIntervalSince1970 >= date {
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
            return randomizr.getLocation()
        }
    }
    
    func is2017() -> Bool {
        if scheduler.date.timeIntervalSince1970 < scheduler.timeStamp2018 {
            return true
        }
        return false
    }
    
    @objc func showSchedule() {
        let vc = ScheduleTableViewController(style: .plain)
        vc.dateArray = dateArray
        vc.scheduler = scheduler
        vc.colours = colours
        self.show(vc, sender: self)
    }
    
    @objc func showLegitLocation() {
        let vc = LegitLocationViewController()
        vc.colours = colours
        vc.location = randomizr.getLocation()
        self.show(vc, sender: self)
    }
    
}

