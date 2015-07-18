//
//  ImageFromUrl.swift
//  smart-promotion
//
//  Created by Sudjarit Puatham on 7/18/2558 BE.
//  Copyright (c) 2558 Sudjarit Puatham. All rights reserved.
//

import Foundation
import UIKit

private var activityIndicatorAssociationKey: UInt8 = 0

extension UIImageView {
    var activityIndicator: UIActivityIndicatorView! {
        get {
            return objc_getAssociatedObject(self, &activityIndicatorAssociationKey) as? UIActivityIndicatorView
        }
        set(newValue) {
            objc_setAssociatedObject(self, &activityIndicatorAssociationKey, newValue, UInt(OBJC_ASSOCIATION_RETAIN))
        }
    }
    
    private func ensureActivityIndicatorIsAnimating() {
        if (self.activityIndicator == nil) {
            self.activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.Gray)
            self.activityIndicator.hidesWhenStopped = true
            let size = self.frame.size;
            self.activityIndicator.center = CGPoint(x: size.width/2, y: size.height/2);
            self.addSubview(self.activityIndicator)
            self.activityIndicator.startAnimating()
        }
    }
    
    func downloadImage(url:String){
        ensureActivityIndicatorIsAnimating()
        var imgURL: NSURL = NSURL(string: url)!
        let request: NSURLRequest = NSURLRequest(URL: imgURL)
        NSURLConnection.sendAsynchronousRequest(
            request, queue: NSOperationQueue.mainQueue(),
            completionHandler: {(response: NSURLResponse!,data: NSData!,error: NSError!) -> Void in
                let httpResponse = response as? NSHTTPURLResponse
                if httpResponse?.statusCode == 200{
                    self.activityIndicator.stopAnimating()
                    let imageDownload = UIImage(data: data)
                    self.image = Toucan(image: imageDownload!).resize(self.frame.size, fitMode: Toucan.Resize.FitMode.Crop).image
//                    self.image = imageDownload
                }else{
                    self.image = ApplicationConstant.Images.imageNotFound
                    self.activityIndicator.stopAnimating()
                }
            
        })
    }
}