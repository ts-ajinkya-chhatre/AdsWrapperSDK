//
//  ViewController.swift
//  AdsWrapperSDKExample
//
//  Created by Chhatre, Ajinkya on 31/01/22.
//

import UIKit
import AdsWrapperSDK

class ViewController: UIViewController {

	let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
	var multipleAdsVC: MultipleAdsViewController?

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}

	@IBAction func noGroupBtnClicked(_ sender: Any) {
		AdSDKManager.sharedInstance.groupType = .none
		self.pushMultipleAdsViewController()
	}

	@IBAction func adSessionBtnClicked(_ sender: Any) {
		AdSDKManager.sharedInstance.groupType = .adSession
		AdSDKManager.sharedInstance.refreshAdSession()
		self.pushMultipleAdsViewController()
	}

	@IBAction func adGroupBtnClicked(_ sender: Any) {

		// Step 1: Create a banner Group
		AdSDKManager.sharedInstance.groupType = .adGroup


		let bannerView1 = AdSDKManager.sharedInstance.createAddView(addSpotID: "1610")
		let bannerView2 = AdSDKManager.sharedInstance.createAddView(addSpotID: "1611")
		let bannerView3 = AdSDKManager.sharedInstance.createAddView(addSpotID: "1612")
		let bannerView4 = AdSDKManager.sharedInstance.createAddView(addSpotID: "1610")

		// Stet 2: Assign all listners
		self.assignListners(bannerView: bannerView1)
		self.assignListners(bannerView: bannerView2)
		self.assignListners(bannerView: bannerView3)
		self.assignListners(bannerView: bannerView4)

		// Step 2: Add all banners to Group
		AdSDKManager.sharedInstance.addBannerViewToBannerGroup(adsBannerView: bannerView1)
		AdSDKManager.sharedInstance.addBannerViewToBannerGroup(adsBannerView: bannerView2)
		AdSDKManager.sharedInstance.addBannerViewToBannerGroup(adsBannerView: bannerView3)
		AdSDKManager.sharedInstance.addBannerViewToBannerGroup(adsBannerView: bannerView4)

		// Step 3: load banner Group
		AdSDKManager.sharedInstance.loadBannersInGroup()

		// Step 4: show Ads view in UI after all the Ads are loaded
		self.multipleAdsVC = storyBoard.instantiateViewController(withIdentifier: "MultipleAdsViewController") as? MultipleAdsViewController
		self.navigationController?.pushViewController(self.multipleAdsVC!, animated: true)
	}

	func pushMultipleAdsViewController() {
		let multipleAdsViewController = storyBoard.instantiateViewController(withIdentifier: "MultipleAdsViewController") as! MultipleAdsViewController
		self.navigationController?.pushViewController(multipleAdsViewController, animated: true)
	}

	func assignListners(bannerView: AdsBannerView) {
		bannerView.onSuccessListner = { adsBannerView in
			print("Group Banner \(adsBannerView.adSpotId) Load Success")
			self.multipleAdsVC?.groupAdViews.append(adsBannerView)
			self.multipleAdsVC?.adsTableView.reloadData()
		}

		bannerView.onFailureListner = { failureMessage in
			print(failureMessage)
		}

		bannerView.onClickListner = { adsBannerView in
			print("Group Banner \(adsBannerView.adSpotId) Clicked")
		}
	}
}

