//
//  SingleAdUIViewController.swift
//  AdsWrapperSDKExample
//
//  Created by Chhatre, Ajinkya on 09/02/22.
//

import UIKit
import AdsWrapperSDK

class SingleAdUIViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
		self.view.backgroundColor = .white

		let bannerView = AdsBannerView(adSpotID: "1603")
		bannerView.onSuccess = { bannerView in
			guard let adsBannerView = bannerView as? AdsBannerView else { return }
			print("Banner \(adsBannerView.adSpotId) Load Success")
		}

		bannerView.onFailure = { bannerView, failureMessage in
			guard let adsBannerView = bannerView as? AdsBannerView else { return }
			print("Banner \(adsBannerView.adSpotId) Load Failure reason: \(failureMessage)")
		}

		bannerView.onClick = { bannerView in
			guard let adsBannerView = bannerView as? AdsBannerView else { return }
			print("Banner \(adsBannerView.adSpotId) Clicked")
		}

		bannerView.load()
		self.view.addSubview(bannerView)
		bannerView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
		bannerView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
}
