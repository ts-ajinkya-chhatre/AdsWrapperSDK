//
//  BannerView.swift
//  AdsWrapperSDK
//
//  Created by Chhatre, Ajinkya on 31/01/22.
//

import Foundation

protocol BannerView
{
	var adSpotID : String { get set }
	var isViewCached: Bool  { get set }
	var adType: AdType { get set }
	func load()
	func remove()
}
