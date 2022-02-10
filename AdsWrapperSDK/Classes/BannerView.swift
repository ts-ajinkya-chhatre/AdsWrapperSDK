//
//  BannerView.swift
//  AdsWrapperSDK
//
//  Created by Chhatre, Ajinkya on 31/01/22.
//

import Foundation

public protocol BannerView
{
	var onAdLoaded: ((Result<BannerView, Error>) -> Void)? {get set}
	var onClick: ((BannerView) -> Void)? { get set }
	func load()
}

public enum AdWrapperError: Error
{
	case none
	case internalError
	case network
	case fatal
	case unfilled
	case unknown
}
