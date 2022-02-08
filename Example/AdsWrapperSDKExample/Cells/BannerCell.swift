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
		let bannerView = AdSDKManager.sharedInstance.createAddView(addSpotID: addSpotID)
		self.addSubview(bannerView)

		bannerView.onSuccessListener = { bannerView in
			self.adLoadStateChangedAction?(true)
		}

		bannerView.onFailureListener = { bannerView, failureMessage in
			print(failureMessage)
		}

		bannerView.onClickListener = { bannerView in
			print("Clicked !!!")
		}

		bannerView.loadBanner()
	}
}
