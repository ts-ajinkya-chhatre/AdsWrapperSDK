//
//  AdsBannerView.swift
//  AdsWrapperSDK
//
//  Created by Chhatre, Ajinkya on 31/01/22.
//

import UIKit

class AdsBannerView: UIView, BannerView
{
	var adSpotID: String
	var isViewCached: Bool
	var adType: AdType

	init(adSpotID: String, isViewCached: Bool, adType: AdType)
	{
		self.adSpotID = adSpotID
		self.isViewCached = isViewCached
		self.adType = adType
		super.init(frame: CGRect.zero)
	}

	required init?(coder: NSCoder)
	{
		fatalError("init(coder:) has not been implemented")
	}

	func load()
	{
		print("load")
	}

	func remove()
	{
		print("remove")
	}
}
