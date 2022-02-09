//
//  BannerView.swift
//  AdsWrapperSDK
//
//  Created by Chhatre, Ajinkya on 31/01/22.
//

import Foundation

public protocol BannerView
{
	var onSuccess: ((BannerView)-> Void)? { get set }
	var onFailure: ((BannerView, String) -> Void)? { get set }
	var onClick: ((BannerView) -> Void)? { get set }

	func load()
}
