//
//  ViewController.swift
//  LoveCalculator
//
//  Created by Arman on 26.10.2021.
//

import UIKit
import Foundation

class ViewController: UIViewController, CAAnimationDelegate {
    
    
    @IBOutlet weak var progressView: UIProgressView! 
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var resultDescriptionLabel: UILabel!
    @IBOutlet weak var pairLabel: UILabel!
    @IBOutlet weak var percentageLabel: UILabel!
    @IBOutlet weak var resultButtonOutlet: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var gradientLayer: CAGradientLayer! {
        didSet {
            gradientLayer.startPoint = CGPoint(x: 0, y: 0)
            gradientLayer.endPoint = CGPoint(x: 1, y: 1)
            gradientLayer.colors = [UIColor.cyan.withAlphaComponent(0.5).cgColor , UIColor.white.withAlphaComponent(0.5).cgColor]
//            gradientLayer.locations = [0.7 , 0.5]
        }
    }
    
    override func viewDidLayoutSubviews() {
        gradientLayer.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gradientLayer = CAGradientLayer()
        activityIndicator.isHidden = true
        
        view.layer.insertSublayer(gradientLayer, at: 0)
        
        PairNetworkManager.shared.onCompletion = {[weak self] currentPair in
            guard let self = self else {return}
            self.updateValues(pair: currentPair)
        }
        PairNetworkManager.shared.fetchCurrentPair(fname: "Me", sname: "Burgers")
    }
    
    @IBAction func requestResult(_ sender: UIButton) {
        self.presentInsertNamesAlertController(withTitle: "Enter pair names", message: nil, style: .alert) { fname, sname in
            PairNetworkManager.shared.fetchCurrentPair(fname: fname, sname: sname)
        }
    }
}
