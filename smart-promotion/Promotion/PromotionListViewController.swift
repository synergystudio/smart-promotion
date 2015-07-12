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
    let promotionNames: [String] = ["มา 4 จ่าย 3","VC Fablic Factory Sale 2015","Mega Mid-Year Sale","Central Greatest Grand Sale","Robinson All About Health & Beauty","King Power"]
    
    let location : [String] = ["Central Embassy","Central Embassy","Central Embassy","Central Chidlom","Central Chidlom","Central Chidlom"];
    let product: [String] = ["Central Credit Card","Central Credit Card","Central Credit Card","Central Credit Card","Central Credit Card","Central Credit Card"];
    let shortDesc: [String] = ["รับเครดิตเงินคืนสูงสุด 5,000 บาท วันนี้ - 30 มิ.ย. 58","ช้อปครบ! เลือกรับสิทธิพิเศษ จาก VC FABRIC 4 - 20 มิ.ย. 58 ที่ อาคารวิจิตร ถ.สุขุมวิท 71",
        "จัดเต็ม 3 ต่อ กับบัตรเครดิต กรุงศรี วันนี้ - 31 ก.ค. 58 ที่ Mega Bangna","แลกรับส่วนลดเพิ่มสูงสุด 15% 5 มิ.ย. - 1 ก.ค. 58 ที่เซ็นทรัลทุกสาขาและเซน",
        "แลกรับส่วนลดเพิ่มสูงสุด 15% ทุกวีคเอนด์ วันนี้ - 21 มิ.ย. 58 ที่ โรบินสันทุกสาขา","รับเครดิตเงินคืน 5% วันนี้ – 30 มิ.ย. 58"];
    let province: [String] = ["กรุงเทพมหานคร","กรุงเทพมหานคร","กรุงเทพมหานคร","กรุงเทพมหานคร","กรุงเทพมหานคร","กรุงเทพมหานคร"];
    let distance: [String] = ["20 m","25 m","30 m","125 m","120 m","100 m"];
    let promotionImage: [String] = ["promotion1.png","promotion2.png","promotion3.png","promotion4.png","promotion5.png","promotion6.png"];
    let likeFlag : [String] = ["Y","Y","N","Y","N","N"];
    let star : [String] = ["3","2","5","5","4","0"];
    let rated = UIImage(named: "rated.png")
    let unrate = UIImage(named: "un-rate.png")
    let liked = UIImage(named: "liked.png")
    let unlike = UIImage(named: "un-like.png")
    let promotionCellIdentifier = "promotionCellIdentifier"
    let countItem = 6;
    
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
        promotionCell.promotionNameLbl.text = promotionNames[indexPath.row]
        promotionCell.locationLbl.text = location[indexPath.row]
        promotionCell.productLbl.text = product[indexPath.row]
        promotionCell.shortDescLbl.text = shortDesc[indexPath.row]
        promotionCell.provinceLbl.text = province[indexPath.row]
        promotionCell.distanceLbl.text = distance [indexPath.row]
        promotionCell.promotionIconImg.image = UIImage(named: promotionImage[indexPath.row])
        let likeFlagTemp = likeFlag[indexPath.row];
        if likeFlag[indexPath.row] == "Y" {
            promotionCell.favoriteImg.image = self.liked
        }else {
            promotionCell.favoriteImg.image = self.unlike
        }
        if star[indexPath.row] == "0" {
            promotionCell.oneStarImg.image = self.unrate
            promotionCell.twoStarImg.image = self.unrate
            promotionCell.threeStarImg.image = self.unrate
            promotionCell.fourStarImg.image = self.unrate
            promotionCell.fiveStarImg.image = self.unrate
        }else if star[indexPath.row] == "1" {
            promotionCell.oneStarImg.image = self.rated
            promotionCell.twoStarImg.image = self.unrate
            promotionCell.threeStarImg.image = self.unrate
            promotionCell.fourStarImg.image = self.unrate
            promotionCell.fiveStarImg.image = self.unrate
        }else if star[indexPath.row] == "2" {
            promotionCell.oneStarImg.image = self.rated
            promotionCell.twoStarImg.image = self.rated
            promotionCell.threeStarImg.image = self.unrate
            promotionCell.fourStarImg.image = self.unrate
            promotionCell.fiveStarImg.image = self.unrate
        }else if star[indexPath.row] == "3" {
            promotionCell.oneStarImg.image = self.rated
            promotionCell.twoStarImg.image = self.rated
            promotionCell.threeStarImg.image = self.rated
            promotionCell.fourStarImg.image = self.unrate
            promotionCell.fiveStarImg.image = self.unrate
        }else if star[indexPath.row] == "4" {
            promotionCell.oneStarImg.image = self.rated
            promotionCell.twoStarImg.image = self.rated
            promotionCell.threeStarImg.image = self.rated
            promotionCell.fourStarImg.image = self.rated
            promotionCell.fiveStarImg.image = self.unrate
        }else if star[indexPath.row] == "5" {
            promotionCell.oneStarImg.image = self.rated
            promotionCell.twoStarImg.image = self.rated
            promotionCell.threeStarImg.image = self.rated
            promotionCell.fourStarImg.image = self.rated
            promotionCell.fiveStarImg.image = self.rated
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