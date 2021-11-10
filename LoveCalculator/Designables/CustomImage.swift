//
//  CustomImage.swift
//  LoveCalculator
//
//  Created by Arman on 09.11.2021.
//

import Foundation
import UIKit

class CustomImage: UIImageView {
    override func draw(_ rect: CGRect) {
        self.layer.shadowRadius = 10
        self.layer.shadowOffset = CGSize(width: 5, height: 10)
        self.layer.shadowOpacity = 0.8
        self.layer.shadowColor = UIColor.black.cgColor
    }
}
