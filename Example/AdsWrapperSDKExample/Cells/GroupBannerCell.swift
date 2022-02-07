//
//  BannerCell.swift
//  AdsWrapperSDKExample
//
//  Created by Chhatre, Ajinkya on 04/02/22.
//

import UIKit
import AdsWrapperSDK

class GroupBannerCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }

	func addBannerViewAsSubView(bannerView: BannerView) {
		guard let adView = bannerView as? UIView else { return }
		self.addSubview(adView)
	}
    
}
