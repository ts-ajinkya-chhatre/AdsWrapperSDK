//
//  BannerView.swift
//  AdsWrapperSDK
//
//  Created by Chhatre, Ajinkya on 31/01/22.
//

import Foundation

public protocol BannerView
{
	func loadBanner(completion: @escaping (BannerLoadResultType)-> Void)
}

public protocol AdClickedDelegate
{
	func didClickAd(bannerView: BannerView)
}

public enum GroupType {
	case none
	case adGroup
	case adSession
}
