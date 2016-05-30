//
//  ViewController.swift
//  Volume
//
//  Created by Jason on 16/5/30.
//  Copyright © 2016年 Jason. All rights reserved.
//

import UIKit
import MediaPlayer
import AVKit

class ViewController: UIViewController {
    @IBOutlet weak var readButton: UIButton!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var textLabel: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    @IBAction func sliderAction(sender: UISlider) {
        self.setVolune(sender.value)
        
    }

    @IBAction func buttonAction(sender: UIButton) {
        let av = AVSpeechSynthesizer.init()
        let utterance = AVSpeechUtterance.init(string:self.textLabel.text!)
        
        av.speakUtterance(utterance)
    }
    
    func setVolune(value:Float)  {
        let volumeView = MPVolumeView.init()
        var volumeViewSlider:UISlider = UISlider.init()
        for view in volumeView.subviews {
            if view.isKindOfClass(NSClassFromString("MPVolumeSlider")!){
                volumeViewSlider = view as! UISlider
                break;
            }
        }
        volumeView.showsVolumeSlider = false
        volumeViewSlider.setValue(value, animated: false)
        volumeViewSlider.sendActionsForControlEvents(UIControlEvents.TouchUpInside)
        
        volumeView.sizeToFit()
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

