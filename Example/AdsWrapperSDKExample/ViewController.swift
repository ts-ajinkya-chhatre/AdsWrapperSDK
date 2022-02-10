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
	var bannerGroup: AdGroup?

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}

	@IBAction func singleAdBtnCliked(_ sender: Any) {
		self.navigationController?.pushViewController(SingleAdUIViewController(), animated: true)
	}

	@IBAction func noGroupBtnClicked(_ sender: Any) {
		self.pushMultipleAdsViewController()
	}

	@IBAction func adGroupBtnClicked(_ sender: Any) {

		// Step 1: Create a banner Group
		let bannerView1 = AdBannerView(adSpotID: "1610")
		let bannerView2 = AdBannerView(adSpotID: "1611")
		let bannerView3 = AdBannerView(adSpotID: "1612")
		let bannerView4 = AdBannerView(adSpotID: "1610")

		self.bannerGroup = AdGroup(bannerViews: [bannerView1, bannerView2, bannerView3, bannerView4])

		// Stet 2: Assign all listners
		self.assignListners(AdBannerView: bannerView1)
		self.assignListners(AdBannerView: bannerView2)
		self.assignListners(AdBannerView: bannerView3)
		self.assignListners(AdBannerView: bannerView4)

		// Step 3: load banner Group
		self.bannerGroup?.load()

		// Step 4: show Ads view in UI after all the Ads are loaded
		self.multipleAdsVC = storyBoard.instantiateViewController(withIdentifier: "MultipleAdsViewController") as? MultipleAdsViewController
		self.multipleAdsVC?.isAdGroup = true
		self.navigationController?.pushViewController(self.multipleAdsVC!, animated: true)
	}

	func pushMultipleAdsViewController() {
		let multipleAdsViewController = storyBoard.instantiateViewController(withIdentifier: "MultipleAdsViewController") as! MultipleAdsViewController
		self.navigationController?.pushViewController(multipleAdsViewController, animated: true)
	}

	func assignListners(AdBannerView: AdBannerView) {
		AdBannerView.onAdLoaded = { result in
			switch result {
				case .success(let bannerView):
					guard let adView = bannerView as? AdBannerView else { return }
					print("Group Banner \(adView.adSpotId) Load Success")
					self.multipleAdsVC?.groupAdViews.append(AdBannerView)
					self.multipleAdsVC?.adsTableView.reloadData()
				case .failure(let error):
					print(error)
			}
		}

		AdBannerView.onClick = { bannerView in
			guard let AdBannerView = bannerView as? AdBannerView else { return }
			print("Group Banner \(AdBannerView.adSpotId) Clicked")
		}
	}
}

