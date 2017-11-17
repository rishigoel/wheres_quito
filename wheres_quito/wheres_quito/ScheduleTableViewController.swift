//
//  ScheduleTableViewController.swift
//  wheres_quito
//
//  Created by Rishi Goel on 11/16/17.
//  Copyright © 2017 Rishi Goel. All rights reserved.
//

import UIKit

class ScheduleTableViewController: UITableViewController {
    var scheduler: Scheduler?
    var dateArray: [TimeInterval]?
    var colours: Colours?
    var randomView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.estimatedRowHeight = 44
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.separatorColor = UIColor.clear
        if let colours = colours, let dateArray = dateArray {
            let layer = CAGradientLayer()
            layer.frame = CGRect(x: 0.0, y: CGFloat(dateArray.count) * 44.0, width: self.view.bounds.width, height: self.view.bounds.height - CGFloat(dateArray.count) * 44.0)
            layer.colors = [colours.red.cgColor, colours.teal.cgColor]
            self.view.layer.addSublayer(layer)
            randomView.frame = CGRect(x: 0.0, y: -88.0, width: self.view.bounds.width, height: 88.0)
            randomView.backgroundColor = colours.red
            self.view.addSubview(randomView)
        }
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.bounces = false
        tableView.reloadData()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       guard let scheduler = self.scheduler else {
            return 0
        }
        return scheduler.scheduleDict2017.keys.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.locationLabel.text = ""
        cell.dateLabel.text = ""
        cell.selectionStyle = .none
        if let scheduler = scheduler, let dateArray = dateArray {
            cell.locationLabel.text = scheduler.scheduleDict2017[dateArray[indexPath.row]]
            cell.dateLabel.text = formatDate(dateArray[indexPath.row])
        }
        return cell
    }
    
    func formatDate(_ timeInterval: TimeInterval) -> String{
        let date = Date(timeIntervalSince1970: (timeInterval+86400))
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        dateFormatter.locale = NSLocale.current
        return dateFormatter.string(from: date)
    }
}
