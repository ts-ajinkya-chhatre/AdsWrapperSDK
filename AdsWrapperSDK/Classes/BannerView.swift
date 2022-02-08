//
//  BannerView.swift
//  AdsWrapperSDK
//
//  Created by Chhatre, Ajinkya on 31/01/22.
//

import Foundation

public protocol BannerView
{
	var onSuccessListener: ((BannerView)-> Void)? { get set }
	var onFailureListener: ((BannerView, String) -> Void)? { get set }
	var onClickListener: ((BannerView) -> Void)? { get set }

	func loadBanner()
}

public enum GroupType {
	case none
	case adGroup
	case adSession
}
