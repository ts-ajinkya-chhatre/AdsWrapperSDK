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

	var runaAddSession: RUNAAdSession = RUNAAdSession()

	public func createAddView(addSpotID: String) -> AdsBannerView
	{
		return AdsBannerView(adSpotID: addSpotID)
	}
}
