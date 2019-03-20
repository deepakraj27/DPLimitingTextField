//
//  UIButton+Extension.swift
//  DPLimitingTextField
//
//  Created by Deepakraj Murugesan on 20/03/19.
//  Copyright © 2019 Deepakraj Murugesan. All rights reserved.
//

import Foundation
import UIKit

extension UIButton{
    func setBackgroundColor(_ color: UIColor, for state: UIControl.State) {
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        UIGraphicsGetCurrentContext()!.setFillColor(color.cgColor)
        UIGraphicsGetCurrentContext()!.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
        let colorImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        setBackgroundImage(colorImage, for: state)
    }
}
