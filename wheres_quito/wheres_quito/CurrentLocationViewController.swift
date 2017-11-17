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
    var dateArray = [TimeInterval]()
    
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
        scheduleButton.addTarget(self, action: #selector(showSchedule), for: .touchUpInside)
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
    
    @objc func showSchedule() {
        let vc = ScheduleTableViewController(style: .plain)
        vc.dateArray = dateArray
        vc.scheduler = scheduler
        vc.colours = colours
        self.show(vc, sender: self)
    }
    
}

