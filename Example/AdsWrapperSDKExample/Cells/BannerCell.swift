//
//  BannerCell.swift
//  AdsWrapperSDKExample
//
//  Created by Chhatre, Ajinkya on 04/02/22.
//

import UIKit
import AdsWrapperSDK

class BannerCell: UITableViewCell {

	var adLoadStateChangedAction: ((Bool) -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
    }

	func setUp(addSpotID: String) {
		let bannerView = AdsBannerView(adSpotID: addSpotID)
		self.addSubview(bannerView)

		bannerView.onSuccess = { bannerView in
			self.adLoadStateChangedAction?(true)
		}

		bannerView.onFailure = { bannerView, failureMessage in
			print(failureMessage)
		}

		bannerView.onClick = { bannerView in
			print("Clicked !!!")
		}

		bannerView.load()
	}
}
