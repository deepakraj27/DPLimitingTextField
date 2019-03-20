//
//  ViewController.swift
//  DPLimitingTextField
//
//  Created by Deepakraj Murugesan on 20/03/19.
//  Copyright © 2019 Deepakraj Murugesan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textField: LimitingTextField!
    @IBOutlet weak var limitingLabel: UILabel!
    @IBOutlet weak var ctaButtonOutlet: UIButton!
    
    @IBOutlet weak var infoLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.textField.limitingDelegate = self
        self.textField.totalLimit = 30
        limitingLabel.text = "30"
        
        self.infoLabel.text = "The text is limited to \(self.limitingLabel.text ?? "30") characters in the above text field. You can edit this anytime."
        
        self.ctaButtonOutlet.layer.cornerRadius = 6
        self.ctaButtonOutlet.layer.masksToBounds = true
    }
}

extension ViewController: LimitingTextFieldDelegate{
    func changeInTextLength(_ isCTAButtonActive: Bool, _ getLimiterCount: String) {
        if isCTAButtonActive{
            setActiveCTAButton()
            limitingLabel.text = getLimiterCount
        }else{
            setInactiveCTAButton()
            limitingLabel.text = getLimiterCount
        }
    }
    
    func setInactiveCTAButton(){
        self.ctaButtonOutlet.isUserInteractionEnabled = false
        self.ctaButtonOutlet.setBackgroundColor(.CTAInactiveColor, for: .normal)
    }
    
    func setActiveCTAButton(){
        self.ctaButtonOutlet.isUserInteractionEnabled = true
        self.ctaButtonOutlet.setBackgroundColor(.CTAActiveColor, for: .normal)
    }
}





