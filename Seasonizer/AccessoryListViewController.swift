//
//  AccessoryListViewController.swift
//  Seasonizer
//
//  Created by Nils Fischer on 19.06.15.
//  Copyright (c) 2015 Nils Fischer. All rights reserved.
//

import UIKit


class AccessoryListViewController: UITableViewController {

    // MARK: Model
    
    var accessories: [Accessory]?
    var selectedAccessory: Accessory?
    
    
    // MARK: User Interaction
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        switch segue.identifier! {
        case "selectedAccessory":
            guard let indexPath = tableView.indexPathForSelectedRow else { break }
            self.selectedAccessory = accessories![indexPath.row]
        default:
            break
        }
    }

}


// MARK: - Table View Data Source

extension AccessoryListViewController {

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let accessories = self.accessories else { return 0 }
        return accessories.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let accessory = accessories![indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("AccessoryCell", forIndexPath: indexPath)
        cell.textLabel?.text = accessory.title
        cell.imageView?.image = accessory.image
        return cell
    }

}
