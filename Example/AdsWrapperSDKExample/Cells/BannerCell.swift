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
		bannerView.loadBanner(completion: { result in
			switch result {
				case .success:
					self.adLoadStateChangedAction?(true)
				case .failure:
					print("Failed to load BannerView")
			}
		})
	}
}
