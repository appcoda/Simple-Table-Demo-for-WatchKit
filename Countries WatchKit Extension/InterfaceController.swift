//
//  InterfaceController.swift
//  Countries WatchKit Extension
//
//  Created by Simon Ng on 8/7/15.
//  Copyright (c) 2015 AppCoda. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    var countries = ["Belgium", "USA", "UK", "India", "China", "Australia"]

    @IBOutlet weak var tableView: WKInterfaceTable!
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        setupTable()
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func setupTable() {
        tableView.setNumberOfRows(countries.count, withRowType: "CountryRow")
        
        for var i = 0; i < countries.count; ++i {
            if let row = tableView.rowControllerAtIndex(i) as? CountryRow {
                row.countryName.setText(countries[i])
            }
        }
    }

    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        self.pushControllerWithName("showDetails", context: countries[rowIndex])
    }
}
