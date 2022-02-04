//
//  BannerCell.swift
//  AdsWrapperSDKExample
//
//  Created by Chhatre, Ajinkya on 04/02/22.
//

import UIKit
import AdsWrapperSDK

class BannerCell: UITableViewCell {

	var bannerView: BannerView?
	var adLoadStateChangedAction: ((Bool) -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
    }

	func setUp(addSpotID: String) {

		if self.bannerView == nil {
			self.bannerView = AdSDKManager.sharedInstance.createAddView(addSpotID: addSpotID)
			guard let adView = self.bannerView as? UIView else { return }
			self.addSubview(adView)
		}

		self.bannerView?.loadBanner(completion: { result in
			switch result {
				case .success:
					self.adLoadStateChangedAction?(true)
				case .failure:
					print("Failed to load BannerView")
			}
		})

	}
    
}
