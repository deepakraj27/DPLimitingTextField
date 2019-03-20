//
//  DPTextFieldHandler.swift
//  DPLimitingTextField
//
//  Created by Deepakraj Murugesan on 20/03/19.
//  Copyright © 2019 Deepakraj Murugesan. All rights reserved.
//

import UIKit

protocol LimitingTextFieldDelegate: class {
    func changeInTextLength(_ isCTAButtonActive: Bool, _ getLimiterCount: String)
}

// This class is used to show number of character pending in a textfield out of total 30 Characters, max limiter is set by default as 30(totalLimit). The totalLimit can be changed by any time by user at the viewcontroller and when the text changes. You can see this UI of limiter near to textfield

class LimitingTextField: UITextField{
    weak var limitingDelegate: LimitingTextFieldDelegate?
    var totalLimit: Int = 30
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        self.delegate = self
        self.autocorrectionType = .no
    }
}

extension LimitingTextField: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentCharacterCount = textField.text?.characters.count ?? 0
        if (range.length + range.location > currentCharacterCount){
            return false
        }
        let newLength = currentCharacterCount + string.characters.count - range.length
        
        let currentLength = totalLimit - newLength
        
        if currentLength  >= 0 && newLength <= totalLimit{
            if newLength != 0{
                limitingDelegate?.changeInTextLength(true, String(describing : currentLength))
            }else{
                limitingDelegate?.changeInTextLength(false, String(describing : currentLength))
            }
        }
        
        return newLength <= totalLimit // To just allow up to 50 characters
    }
}
