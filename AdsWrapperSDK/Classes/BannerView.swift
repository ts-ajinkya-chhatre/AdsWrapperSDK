//
//  BannerView.swift
//  AdsWrapperSDK
//
//  Created by Chhatre, Ajinkya on 31/01/22.
//

import Foundation

public protocol BannerView
{
	var onAdLoaded: ((AdLoadResult<BannerView>) -> Void)? {get set}
	var onClick: ((BannerView) -> Void)? { get set }
	func load()
}

public enum AdLoadResult<Value>
{
	case success(Value)
	case failure(Value, String)
}
