//
//  AdSDKManager.swift
//  AdsWrapperSDK
//
//  Created by Chhatre, Ajinkya on 31/01/22.
//

import Foundation
import RUNABanner

public final class AdSDKManager
{
	public static let sharedInstance = AdSDKManager()

	var viewsCache: [AdType: [AdsBannerView]] = [:]
	var runaAddSession: RUNAAdSession = RUNAAdSession()
	var adSpotIDHelper: AdSpotIDHelper = AdSpotIDHelper()

	public func createSingleAddViewForAddType(addType: AdType, cacheView:Bool) -> AdsBannerView
	{
		return AdsBannerView(adSpotID: "1603", isViewCached: cacheView, adType: addType)
	}

	public func createMultipleAddViewsForAddType(addType: AdType, cacheView:Bool) -> [AdsBannerView]
	{
		return []
	}

	public func fetchAdsBannerViewForAddSpotID(addSpotID: String)
	{

	}

	public func cacheBannerView(view: AdsBannerView)
	{

	}

	public func removeBannerViewFromCache(addSpotID: String)
	{

	}
}
