//
//  BannerCell.swift
//  AdsWrapperSDKExample
//
//  Created by Chhatre, Ajinkya on 04/02/22.
//

import UIKit
import AdsWrapperSDK

class GroupBannerCell: UITableViewCell {

	var bannerView: UIView?

    override func awakeFromNib() {
        super.awakeFromNib()
    }

	func addBannerViewAsSubView(bannerView: BannerView) {
		guard let adView = bannerView as? UIView else { return }
		self.addSubview(adView)
		self.bannerView = adView
	}

	func resetCellContent() {
		if let adView = self.bannerView {
			adView.removeFromSuperview()
		}
	}
}
