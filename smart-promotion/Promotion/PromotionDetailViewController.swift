//
//  PromotionDetailViewController.swift
//  Promotion2U
//
//  Created by Sudjarit Puatham on 7/5/2558 BE.
//  Copyright (c) 2558 Sudjarit Puatham. All rights reserved.
//

import UIKit

class PromotionDetailViewController: UIViewController {
    @IBOutlet var promotionIconImg: UIImageView!
    @IBOutlet var promotionNameLbl: UILabel!
    @IBOutlet var locationLbl: UILabel!
    @IBOutlet var productLbl: UILabel!
    @IBOutlet var shortDescLbl: UILabel!
    @IBOutlet var distanceLbl: UILabel!
    @IBOutlet var provinceLbl: UILabel!
    @IBOutlet var oneStarImg: UIImageView!
    @IBOutlet var twoStarImg: UIImageView!
    @IBOutlet var threeStarImg: UIImageView!
    @IBOutlet var fourStarImg: UIImageView!
    @IBOutlet var fiveStarImg: UIImageView!
    @IBOutlet var favoriteImg: UIImageView!
    
    var promotionName=String()
    
    var location = String()
    var product = String()
    var shortDesc  = String()
    var province = String()
    var distance = String()
    var promotionImage = String()
    var likeFlag  = String()
    var star = String()
    var rated = UIImage(named: "rated.png")
    var unrate = UIImage(named: "un-rate.png")
    var liked = UIImage(named: "liked.png")
    var unlike = UIImage(named: "un-like.png")
    
    override func viewWillAppear(animated: Bool) {
        self.promotionNameLbl.text = promotionName
        self.locationLbl.text = location
        self.productLbl.text = product
        self.shortDescLbl.text = shortDesc
        self.shortDescLbl.sizeToFit()
        self.provinceLbl.text = province
        self.distanceLbl.text = distance
        self.promotionIconImg.image = UIImage(named: promotionImage)
        let likeFlagTemp = likeFlag;
        if likeFlag == "Y" {
            self.favoriteImg.image = self.liked
        }else {
            self.favoriteImg.image = self.unlike
        }
        if star == "0" {
            self.oneStarImg.image = self.unrate
            self.twoStarImg.image = self.unrate
            self.threeStarImg.image = self.unrate
            self.fourStarImg.image = self.unrate
            self.fiveStarImg.image = self.unrate
        }else if star == "1" {
            self.oneStarImg.image = self.rated
            self.twoStarImg.image = self.unrate
            self.threeStarImg.image = self.unrate
            self.fourStarImg.image = self.unrate
            self.fiveStarImg.image = self.unrate
        }else if star == "2" {
            self.oneStarImg.image = self.rated
            self.twoStarImg.image = self.rated
            self.threeStarImg.image = self.unrate
            self.fourStarImg.image = self.unrate
            self.fiveStarImg.image = self.unrate
        }else if star == "3" {
            self.oneStarImg.image = self.rated
            self.twoStarImg.image = self.rated
            self.threeStarImg.image = self.rated
            self.fourStarImg.image = self.unrate
            self.fiveStarImg.image = self.unrate
        }else if star == "4" {
            self.oneStarImg.image = self.rated
            self.twoStarImg.image = self.rated
            self.threeStarImg.image = self.rated
            self.fourStarImg.image = self.rated
            self.fiveStarImg.image = self.unrate
        }else if star == "5" {
            self.oneStarImg.image = self.rated
            self.twoStarImg.image = self.rated
            self.threeStarImg.image = self.rated
            self.fourStarImg.image = self.rated
            self.fiveStarImg.image = self.rated
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}