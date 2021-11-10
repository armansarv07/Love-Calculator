//
//  ViewModel.swift
//  LoveCalculator
//
//  Created by Arman on 09.11.2021.
//

import Foundation
import UIKit

extension ViewController: ViewModelType {
    func updateValues(pair: CurrentPair) {
        DispatchQueue.main.async {
            self.activityIndicator.isHidden = false
            self.activityIndicator.startAnimating()
            self.resultButtonOutlet.isHidden = true
            self.pairLabel.text = "\(pair.fname) and \(pair.sname)"
            self.imageView.image = UIImage(systemName: pair.systemIconString)
            self.resultDescriptionLabel.text = pair.result
            self.percentageLabel.text = "\(pair.percentage)%"
            self.progressView.setProgress(Float(pair.percentage)! / 100, animated: true)
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
            self.resultButtonOutlet.isHidden = false
        }
    }
}
