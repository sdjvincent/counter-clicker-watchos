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
    
    @IBOutlet weak var counterDisplay: WKInterfaceLabel!
    @IBOutlet weak var clickOne: WKInterfaceButton!
    
    var totalClicks: Int = 0
    var clickSound = AVAudioPlayer()

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
    
    @IBAction func clickerClicked() {
        totalClicks = totalClicks + 1
        updateUI()
        playSound(soundName: "click")
    }
    
    @IBAction func resetPressed() {
        totalClicks = 0
        updateUI()
        playSound(soundName: "reset-click")
    }
    
    func updateUI() {
    
        self.counterDisplay.setText("\(self.totalClicks)")
    }
    
    func playSound(soundName : String) {
        
        let path = Bundle.main.path(forResource: soundName, ofType: ".mp3")!
        let url = URL(fileURLWithPath: path)

        do {
            clickSound = try AVAudioPlayer(contentsOf: url)
            clickSound.play()
        } catch {
                   //couldn't load file
               }
    }
}
