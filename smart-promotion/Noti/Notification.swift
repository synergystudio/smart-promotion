//
//  Notification.swift
//  smart-promotion
//
//  Created by Sudjarit Puatham on 7/23/2558 BE.
//  Copyright (c) 2558 Sudjarit Puatham. All rights reserved.
//

import Foundation
import UIKit
class Notification{
    static var localNotification: UILocalNotification = UILocalNotification()
    static func setNoti(action: String!,body:String!){
        localNotification.alertAction = action
        localNotification.alertBody = body
        localNotification.fireDate = NSDate(timeIntervalSinceNow: 1)
        UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
    }
}
