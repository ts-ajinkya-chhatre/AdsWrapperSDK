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
		let bannerView = AdBannerView(adSpotID: addSpotID)
		self.addSubview(bannerView)
		
		bannerView.onAdLoaded = { result in
			switch result {
				case .success(_):
					self.adLoadStateChangedAction?(true)
				case .failure(let error):
					print(error)
			}
		}

		bannerView.onClick = { bannerView in
			print("Clicked !!!")
		}

		bannerView.load()
	}
}
