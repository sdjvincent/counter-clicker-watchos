//
//  InterfaceController.swift
//  CounterClicker WatchKit Extension
//
//  Created by Simon Vincent on 08/07/2022.
//

import WatchKit
import Foundation
import AVFoundation


class InterfaceController: WKInterfaceController {
    
    @IBOutlet weak var counterDisplay: WKInterfaceButton!
    
    var totalClicks: Int = 0
    var plusAmount: Int = 1
    var player = AVAudioPlayer()

    override func awake(withContext context: Any?) {
        // Configure interface objects here.
        try! AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.ambient)
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
    }
    
    @IBAction func increasePlusAmount(_ sender: Any) {
        plusAmount = plusAmount + 1; do {
            if plusAmount == 0 {
               plusAmount = 1
            }
        }
        counterDisplay.setTitle("\(plusAmount)")
    }

    @IBAction func decreasePlusAmount(_ sender: Any) {
        plusAmount = plusAmount - 1; do {
            if plusAmount == 0 {
                plusAmount = 1
            }
        }
        counterDisplay.setTitle("\(plusAmount)")
    }
    
    @IBAction func tapToPlus() {
        totalClicks = totalClicks + plusAmount
        updateUI()
        playSound(soundName: "click")
    }
    
    @IBAction func swipeDownMinus(_ sender: Any) {
        totalClicks = totalClicks - plusAmount
        updateUI()
        playSound(soundName: "click")
    }
    
    @IBAction func longPressReset(_ sender: Any) {
        totalClicks = 0
        plusAmount = 1
        updateUI()
        playSound(soundName: "reset-click")
    }
 
    func updateUI() {
    
        self.counterDisplay.setTitle("\(self.totalClicks)")
    }
    
    func playSound(soundName : String) {

                let path = Bundle.main.path(forResource: soundName, ofType: ".mp3")!
                let url = URL(fileURLWithPath: path)

                do {
                    player = try AVAudioPlayer(contentsOf: url)
                    player.play()
                } catch {
                           //couldn't load file :(
    }
    }
}

