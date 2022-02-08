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

		bannerView.onSuccessListner = { adsBannerView in
			self.adLoadStateChangedAction?(true)
		}

		bannerView.onFailureListner = { failureMessage in
			print(failureMessage)
		}

		bannerView.onClickListner = { adsBannerView in
			print("Clicked !!!")
		}

		bannerView.loadBanner()
	}
}
