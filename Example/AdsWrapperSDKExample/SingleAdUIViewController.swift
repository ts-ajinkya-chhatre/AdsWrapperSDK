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

		let bannerView = AdBannerView(adSpotID: "1603")
		bannerView.onAdLoaded = { result in
			switch result {
				case .success(let bannerView):
					guard let adView = bannerView as? AdBannerView else { return }
					print("Group Banner \(adView.adSpotId) Load Success")
				case .failure(_, let errorMessage):
					print(errorMessage)
			}
		}

		bannerView.onClick = { bannerView in
			guard let AdBannerView = bannerView as? AdBannerView else { return }
			print("Banner \(AdBannerView.adSpotId) Clicked")
		}

		bannerView.load()
		self.view.addSubview(bannerView)
		bannerView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
		bannerView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
}
