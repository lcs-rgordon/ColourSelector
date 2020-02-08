//
//  MathLibrary.swift
//  ColourSelector
//
//  Created by Russell Gordon on 2020-02-08.
//  Copyright © 2020 Russell Gordon. All rights reserved.
//

import Foundation

extension Double {
    var radiansToDegrees: Double {
        return (self / Double.pi) * 180
    }
    var degreesToRadians: Double {
        return (self / 180) * Double.pi
    }
}
