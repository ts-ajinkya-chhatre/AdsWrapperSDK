//
//  MultipleAdsViewController.swift
//  AdsWrapperSDKExample
//
//  Created by Chhatre, Ajinkya on 04/02/22.
//

import UIKit
import AdsWrapperSDK

let n = 5
let InfoCellID = "InfoCell"
let BannerCellID = "BannerCell"
let GroupCellID = "GroupBannerCell"

struct AdInfo {
	let adSpotID: String
	var adLoaded: Bool
}

class MultipleAdsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

	@IBOutlet var adsTableView: UITableView!

	var adInfo = [AdInfo(adSpotID: "1610", adLoaded: false),
				  AdInfo(adSpotID: "1611", adLoaded: false),
				  AdInfo(adSpotID: "1612", adLoaded: false),
				  AdInfo(adSpotID: "1610", adLoaded: false)]

	var dataSource = ["One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen"]

	var groupAdViews = [AdBannerView]()
	var isAdGroup = false

    override func viewDidLoad() {
        super.viewDidLoad()
		adsTableView?.register(UINib(nibName: "InfoCell", bundle: nil), forCellReuseIdentifier: InfoCellID)
		adsTableView?.register(UINib(nibName: "BannerCell", bundle: nil), forCellReuseIdentifier: BannerCellID)
		adsTableView?.register(UINib(nibName: "GroupBannerCell", bundle: nil), forCellReuseIdentifier: GroupCellID)
    }

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return dataSource.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if (indexPath.row % n) == 0 {
			if self.isAdGroup {
				// load GroupBannerCell
				if let bannerGroupCell = tableView.dequeueReusableCell(withIdentifier: GroupCellID, for: indexPath) as? GroupBannerCell
				   {
					bannerGroupCell.resetCellContent()
					if indexPath.row < groupAdViews.count {
						bannerGroupCell.addBannerViewAsSubView(bannerView: self.groupAdViews[indexPath.row])
					}
					 return bannerGroupCell
				   }
			} else {
				// load BannerCell
				if let bannerCell = tableView.dequeueReusableCell(withIdentifier: BannerCellID, for: indexPath) as? BannerCell
				   {
					let adIndex = indexPath.row / n
					if !self.adInfo[adIndex].adLoaded {
						bannerCell.setUp(addSpotID: self.adInfo[adIndex].adSpotID)
						bannerCell.adLoadStateChangedAction = { isAdLoaded in
							if isAdLoaded {
								print("BannerView loaded")
								self.adInfo[adIndex].adLoaded = true
							}
						}
					}
					 return bannerCell
				   }
			}
		} else {
			// load regular Cell
			if let infoCell = tableView.dequeueReusableCell(withIdentifier: InfoCellID, for: indexPath) as? InfoCell
			   {
				infoCell.infoLabel.text = dataSource[indexPath.row]
				 return infoCell
			   }
		}
		   return UITableViewCell()
	}

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

	}

	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 60.0
	}
}
