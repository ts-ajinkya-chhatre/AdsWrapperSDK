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

		// Step 2: Add all banners to Group
		AdSDKManager.sharedInstance.addBannerViewToBannerGroup(adsBannerView: bannerView1)
		AdSDKManager.sharedInstance.addBannerViewToBannerGroup(adsBannerView: bannerView2)
		AdSDKManager.sharedInstance.addBannerViewToBannerGroup(adsBannerView: bannerView3)
		AdSDKManager.sharedInstance.addBannerViewToBannerGroup(adsBannerView: bannerView4)

		// Step 3: load banner Group
		let multipleAdsViewController = storyBoard.instantiateViewController(withIdentifier: "MultipleAdsViewController") as! MultipleAdsViewController
		let numberOfAds = 0
		AdSDKManager.sharedInstance.loadBannersInGroup { adsBannerView, status in
			switch status {
				case .success:
					multipleAdsViewController.groupAdViews.append(adsBannerView)

					if numberOfAds == 4 {
						DispatchQueue.main.async {
							// Step 4: show Ads view in UI after all the Ads are loaded
							self.navigationController?.pushViewController(multipleAdsViewController, animated: true)
						}
					}

				case .failure:
					// TODO: Can append Error View here
					print("AdGroup Load Create Error")
			}
		}


	}

	func pushMultipleAdsViewController() {
		let multipleAdsViewController = storyBoard.instantiateViewController(withIdentifier: "MultipleAdsViewController") as! MultipleAdsViewController
		self.navigationController?.pushViewController(multipleAdsViewController, animated: true)
	}
}

