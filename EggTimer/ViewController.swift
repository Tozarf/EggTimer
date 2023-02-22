//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    
    let eggTimes:[String : Int] = ["Soft":3,"Medium":4,"Hard":6]
    //let eggTimes:[String : Int] = ["Soft":300,"Medium":420,"Hard":720]
    enum EggTime:Int{
        case soft = 3
        case medium = 4
        case hard = 6
    }
    var hardness = 0;
    var timer : Timer?;
    @IBAction func hardnessSelected(_ sender: UIButton) {
        hardness = eggTimes[sender.currentTitle ?? "Undefined"] ?? hardness
        timer?.invalidate()
        
        self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {[weak self] timer in
            
            guard let self else {return}
            if self.hardness >= 0 {
                self.hardness -= 1
                self.progressBar.progress = 1.0 - (Float(self.hardness) / Float(self.eggTimes[sender.currentTitle ?? "Undefined"] ?? 0))
                if self.hardness == 0{
                    self.titleLabel.text = "Done"
                }
            }else{
                timer.invalidate()
            }
        }
        

    }

}
