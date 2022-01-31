//
//  AdsBannerView.swift
//  AdsWrapperSDK
//
//  Created by Chhatre, Ajinkya on 31/01/22.
//

import UIKit
import RUNABanner

public class AdsBannerView: RUNABannerView, BannerView
{
	public var isViewCached: Bool
	public var adType: AdType

	init(adSpotID: String, isViewCached: Bool, adType: AdType)
	{
		self.isViewCached = isViewCached
		self.adType = adType
		super.init(frame: CGRect.zero)
		super.adSpotId = adSpotID
	}

	required init?(coder: NSCoder)
	{
		fatalError("init(coder:) has not been implemented")
	}

	public func loadBanner(completion: @escaping (BannerLoadResultType)-> Void)
	{
		self.load
		{ (_, event) in
			switch event.eventType
			{
			case .succeeded:
				completion(.success)
			case .failed:
				completion(.failure)
				switch event.error
				{
				case .unfilled:
					print("ad unavailable")
				case .network:
					print("network unavailable")
				default:
					break
				}
			case .clicked:
				completion(.clicked)
			default:
				break
			}
		}
	}

	public func removeBanner()
	{
		print("removeBanner")
	}
}
