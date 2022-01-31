//
//  AdSDKManager.swift
//  AdsWrapperSDK
//
//  Created by Chhatre, Ajinkya on 31/01/22.
//

import Foundation

public final class AdSDKManager {

	static let sharedInstance = AdSDKManager()

	var viewsCache: [AdType: [AdsBannerView]] = [:]
	// var runaAddSession: RUNAAdSession
	var adSpotIDHelper: AdSpotIDHelper = AdSpotIDHelper()

	func createSingleAddViewForAddType(addType: AdType, cacheView:Bool, completion: (AdsBannerView)-> Void)
	{

	}

	func createMultipleAddViewsForAddType(addType: AdType, cacheView:Bool, completion: ([AdsBannerView])-> Void)
	{

	}

	func fetchAdsBannerViewForAddSpotID(addSpotID: String)
	{

	}

	func cacheBannerView(view: AdsBannerView)
	{

	}

	func removeBannerViewFromCache(addSpotID: String)
	{

	}
}
