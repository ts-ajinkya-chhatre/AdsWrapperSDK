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
	var adClickDelegate: AdClickedDelegate?

	init(adSpotID: String)
	{
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
				self.adClickDelegate?.didClickAd(bannerView: self)
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
