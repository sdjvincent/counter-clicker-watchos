//
//  InterfaceController.swift
//  CounterClicker WatchKit Extension
//
//  Created by Simon Vincent on 08/07/2022.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    @IBOutlet weak var counterDisplay: WKInterfaceLabel!
    @IBOutlet weak var clickOne: WKInterfaceButton!
    
    var totalClicks: Int = 0

    override func awake(withContext context: Any?) {
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        updateUI()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
    }
    
    @IBAction public func clickerClicked(_ sender : Any) {
        totalClicks = totalClicks + 1
        updateUI()
    }
    
    @IBAction func resetPressed() {
        totalClicks = 0
        updateUI()
    }
    
    func updateUI() {
    
        self.counterDisplay.setText("\(self.totalClicks)")
    }
    

}
