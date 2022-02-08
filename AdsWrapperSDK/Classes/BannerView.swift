//
//  BannerView.swift
//  AdsWrapperSDK
//
//  Created by Chhatre, Ajinkya on 31/01/22.
//

import Foundation

public protocol BannerView
{
	var onSuccessListner: ((AdsBannerView)-> Void)? { get set }
	var onFailureListner: ((String) -> Void)? { get set }
	var onClickListner: ((AdsBannerView) -> Void)? { get set }

	func loadBanner()
}

public enum GroupType {
	case none
	case adGroup
	case adSession
}
