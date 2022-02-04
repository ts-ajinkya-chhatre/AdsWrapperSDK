//
//  BannerView.swift
//  AdsWrapperSDK
//
//  Created by Chhatre, Ajinkya on 31/01/22.
//

import Foundation

public protocol BannerView
{
	var isViewCached: Bool  { get set }
	var adType: AdType { get set }
	func loadBanner(completion: @escaping (BannerLoadResultType)-> Void)
	func removeBanner()
}
