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
	public var onSuccessListener: ((BannerView)-> Void)?
	public var onFailureListener: ((BannerView, String) -> Void)?
	public var onClickListener: ((BannerView) -> Void)?

	init(adSpotID: String)
	{
		super.init(frame: CGRect.zero)
		super.adSpotId = adSpotID
	}

	required init?(coder: NSCoder)
	{
		fatalError("init(coder:) has not been implemented")
	}

	public func loadBanner()
	{
		self.load
		{ (_, event) in
			switch event.eventType
			{
			case .succeeded:
				self.onSuccessListener?(self)
			case .failed:
				switch event.error
				{
				case .unfilled:
					print("ad unavailable")
					self.onFailureListener?(self, "ad unavailable")
				case .network:
					self.onFailureListener?(self, "network failure")
				default:
					break
				}
			case .clicked:
				self.onClickListener?(self)
			default:
				break
			}
		}
	}
}
