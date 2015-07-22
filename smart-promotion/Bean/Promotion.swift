//
//  Promotion.swift
//  smart-promotion
//
//  Created by Sudjarit Puatham on 7/23/2558 BE.
//  Copyright (c) 2558 Sudjarit Puatham. All rights reserved.
//

import Foundation
import CoreLocation
class Promotion : NSObject {
    var location = CLLocation()
    var isNoti = Bool()
    internal init(location : CLLocation) {
        self.location = location
        self.isNoti = false
    }
}