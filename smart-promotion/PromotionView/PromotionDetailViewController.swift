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
    @IBOutlet var scrollView: UIScrollView!
    
    var promotionName=String()
    
    var location = String()
    var product = String()
    var shortDesc  = String()
    var province = String()
    var distance = String()
    var promotionImage = String()
    var likeFlag  = String()
    var star = String()
    
    override func viewWillAppear(animated: Bool) {
        self.promotionNameLbl.text = promotionName
        self.locationLbl.text = location
        self.productLbl.text = product
        self.shortDescLbl.text = shortDesc
        self.shortDescLbl.sizeToFit()
        self.provinceLbl.text = province
        self.distanceLbl.text = distance
//        promotionCell.promotionIconImg.downloadImage(promotionImage[indexPath.row])
        self.promotionIconImg.downloadImage(promotionImage)
        let likeFlagTemp = likeFlag;
        if likeFlag == "Y" {
            self.favoriteImg.image = ApplicationConstant.Images.liked
        }
        if star == "0" {
            self.oneStarImg.image = ApplicationConstant.Images.unrate
            self.twoStarImg.image = ApplicationConstant.Images.unrate
            self.threeStarImg.image = ApplicationConstant.Images.unrate
            self.fourStarImg.image = ApplicationConstant.Images.unrate
            self.fiveStarImg.image = ApplicationConstant.Images.unrate
        }else if star == "1" {
            self.oneStarImg.image = ApplicationConstant.Images.rated
            self.twoStarImg.image = ApplicationConstant.Images.unrate
            self.threeStarImg.image = ApplicationConstant.Images.unrate
            self.fourStarImg.image = ApplicationConstant.Images.unrate
            self.fiveStarImg.image = ApplicationConstant.Images.unrate
        }else if star == "2" {
            self.oneStarImg.image = ApplicationConstant.Images.rated
            self.twoStarImg.image = ApplicationConstant.Images.rated
            self.threeStarImg.image = ApplicationConstant.Images.unrate
            self.fourStarImg.image = ApplicationConstant.Images.unrate
            self.fiveStarImg.image = ApplicationConstant.Images.unrate
        }else if star == "3" {
            self.oneStarImg.image = ApplicationConstant.Images.rated
            self.twoStarImg.image = ApplicationConstant.Images.rated
            self.threeStarImg.image = ApplicationConstant.Images.rated
            self.fourStarImg.image = ApplicationConstant.Images.unrate
            self.fiveStarImg.image = ApplicationConstant.Images.unrate
        }else if star == "4" {
            self.oneStarImg.image = ApplicationConstant.Images.rated
            self.twoStarImg.image = ApplicationConstant.Images.rated
            self.threeStarImg.image = ApplicationConstant.Images.rated
            self.fourStarImg.image = ApplicationConstant.Images.rated
            self.fiveStarImg.image = ApplicationConstant.Images.unrate
        }else if star == "5" {
            self.oneStarImg.image = ApplicationConstant.Images.rated
            self.twoStarImg.image = ApplicationConstant.Images.rated
            self.threeStarImg.image = ApplicationConstant.Images.rated
            self.fourStarImg.image = ApplicationConstant.Images.rated
            self.fiveStarImg.image = ApplicationConstant.Images.rated
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scrollView.contentSize = self.view.bounds.size
    }
}