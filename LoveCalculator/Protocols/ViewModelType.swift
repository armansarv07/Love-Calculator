//
//  ViewModelType.swift
//  LoveCalculator
//
//  Created by Arman on 09.11.2021.
//

import Foundation

protocol ViewModelType {
    func updateValues(pair: CurrentPair) -> Void
}
