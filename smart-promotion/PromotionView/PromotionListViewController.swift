//
//  PromotionListViewController.swift
//  Promotion2U
//
//  Created by Sudjarit Puatham on 7/5/2558 BE.
//  Copyright (c) 2558 Sudjarit Puatham. All rights reserved.
//

import UIKit
class PromotionListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var promotionTableView: UITableView!
    let titleName  = "Promotions"
    let promotionNames: [String] = ["มา 4 จ่าย 3","VC Fablic Factory Sale 2015","Mega Mid-Year Sale","Central Greatest Grand Sale","Robinson All About Health & Beauty","King Power"]
    
    let location : [String] = ["Central Embassy","Central Embassy","Central Embassy","Central Chidlom","Central Chidlom","Central Chidlom"];
    let product: [String] = ["Central Credit Card","Central Credit Card","Central Credit Card","Central Credit Card","Central Credit Card","Central Credit Card"];
    let shortDesc: [String] = ["รับเครดิตเงินคืนสูงสุด 5,000 บาท วันนี้ - 30 มิ.ย. 58","ช้อปครบ! เลือกรับสิทธิพิเศษ จาก VC FABRIC 4 - 20 มิ.ย. 58 ที่ อาคารวิจิตร ถ.สุขุมวิท 71",
        "จัดเต็ม 3 ต่อ กับบัตรเครดิต กรุงศรี วันนี้ - 31 ก.ค. 58 ที่ Mega Bangna","แลกรับส่วนลดเพิ่มสูงสุด 15% 5 มิ.ย. - 1 ก.ค. 58 ที่เซ็นทรัลทุกสาขาและเซน",
        "แลกรับส่วนลดเพิ่มสูงสุด 15% ทุกวีคเอนด์ วันนี้ - 21 มิ.ย. 58 ที่ โรบินสันทุกสาขา","รับเครดิตเงินคืน 5% วันนี้ – 30 มิ.ย. 58"];
    let province: [String] = ["กรุงเทพมหานคร","กรุงเทพมหานคร","กรุงเทพมหานคร","กรุงเทพมหานคร","กรุงเทพมหานคร","กรุงเทพมหานคร"];
    let distance: [String] = ["20 m","25 m","30 m","125 m","120 m","100 m"];
    let promotionImage: [String] = ["http://www.krungsricard.com/kccstatic/img/dining/page-bbq-plaza.png","http://www.krungsricard.com/kccstatic/img/dining/page-toko-ichiban-2.png","http://www.krungsricard.com/kccstatic/img/dining/page-suki-masa.png","http://www.krungsricard.com/kccstatic/img/shopping/page-ethnicraft.jpg","http://www.krungsricard.com/kccstatic/img/shopping/page-ethnicraft.jpg","http://www.krungsricard.com/kccstatic/img/shopping/page-ethnicraft.jpg"];
    let likeFlag : [String] = ["Y","Y","N","Y","N","N"];
    let star : [String] = ["3","2","5","5","4","0"];
    let promotionCellIdentifier = "promotionCellIdentifier"
    let countItem = 6;
    override func viewWillAppear(animated: Bool) {
        self.tabBarController?.navigationItem.title = titleName
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        promotionTableView.delegate = self
        promotionTableView.dataSource = self
    }
    
    // MARK:  UITextFieldDelegate Methods
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return promotionNames.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let promotionCell = promotionTableView.dequeueReusableCellWithIdentifier(promotionCellIdentifier) as! PromotionListViewCell
        
        promotionCell.cellContent.layer.cornerRadius = 3
        promotionCell.cellContent.layer.masksToBounds = true
        promotionCell.cellContent.layer.borderWidth = 1
        promotionCell.cellContent.layer.borderColor = ApplicationConstant.Colors.borderColor.CGColor
        
        promotionCell.promotionNameLbl.text = promotionNames[indexPath.row]
        promotionCell.locationLbl.text = location[indexPath.row]
        promotionCell.productLbl.text = product[indexPath.row]
        promotionCell.shortDescLbl.text = shortDesc[indexPath.row]
        promotionCell.provinceLbl.text = province[indexPath.row]
        promotionCell.distanceLbl.text = distance [indexPath.row]
        promotionCell.promotionIconImg.downloadImage(promotionImage[indexPath.row])
        let likeFlagTemp = likeFlag[indexPath.row];
        if likeFlag[indexPath.row] == "Y" {
            promotionCell.favoriteImg.image = ApplicationConstant.Images.liked
        }
        if star[indexPath.row] == "0" {
            promotionCell.oneStarImg.image = ApplicationConstant.Images.unrate
            promotionCell.twoStarImg.image = ApplicationConstant.Images.unrate
            promotionCell.threeStarImg.image = ApplicationConstant.Images.unrate
            promotionCell.fourStarImg.image = ApplicationConstant.Images.unrate
            promotionCell.fiveStarImg.image = ApplicationConstant.Images.unrate
        }else if star[indexPath.row] == "1" {
            promotionCell.oneStarImg.image = ApplicationConstant.Images.rated
            promotionCell.twoStarImg.image = ApplicationConstant.Images.unrate
            promotionCell.threeStarImg.image = ApplicationConstant.Images.unrate
            promotionCell.fourStarImg.image = ApplicationConstant.Images.unrate
            promotionCell.fiveStarImg.image = ApplicationConstant.Images.unrate
        }else if star[indexPath.row] == "2" {
            promotionCell.oneStarImg.image = ApplicationConstant.Images.rated
            promotionCell.twoStarImg.image = ApplicationConstant.Images.rated
            promotionCell.threeStarImg.image = ApplicationConstant.Images.unrate
            promotionCell.fourStarImg.image = ApplicationConstant.Images.unrate
            promotionCell.fiveStarImg.image = ApplicationConstant.Images.unrate
        }else if star[indexPath.row] == "3" {
            promotionCell.oneStarImg.image = ApplicationConstant.Images.rated
            promotionCell.twoStarImg.image = ApplicationConstant.Images.rated
            promotionCell.threeStarImg.image = ApplicationConstant.Images.rated
            promotionCell.fourStarImg.image = ApplicationConstant.Images.unrate
            promotionCell.fiveStarImg.image = ApplicationConstant.Images.unrate
        }else if star[indexPath.row] == "4" {
            promotionCell.oneStarImg.image = ApplicationConstant.Images.rated
            promotionCell.twoStarImg.image = ApplicationConstant.Images.rated
            promotionCell.threeStarImg.image = ApplicationConstant.Images.rated
            promotionCell.fourStarImg.image = ApplicationConstant.Images.rated
            promotionCell.fiveStarImg.image = ApplicationConstant.Images.unrate
        }else if star[indexPath.row] == "5" {
            promotionCell.oneStarImg.image = ApplicationConstant.Images.rated
            promotionCell.twoStarImg.image = ApplicationConstant.Images.rated
            promotionCell.threeStarImg.image = ApplicationConstant.Images.rated
            promotionCell.fourStarImg.image = ApplicationConstant.Images.rated
            promotionCell.fiveStarImg.image = ApplicationConstant.Images.rated
        }
        
        return promotionCell
    }
    
    // MARK:  UITableViewDelegate Methods
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("promotionDetailSeque", sender: self.promotionTableView)
    }
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "promotionDetailSeque" {
            let destination = segue.destinationViewController as! PromotionDetailViewController
            let promotionIndex = self.promotionTableView.indexPathForSelectedRow()?.row
            destination.promotionName = self.promotionNames[promotionIndex!]
            destination.location = self.location[promotionIndex!]
            destination.shortDesc = self.shortDesc[promotionIndex!]
            destination.province = self.province[promotionIndex!]
            destination.distance = self.distance[promotionIndex!]
            destination.promotionImage = self.promotionImage[promotionIndex!]
            destination.likeFlag = self.likeFlag[promotionIndex!]
            destination.star = self.star[promotionIndex!]

        }
    }
}