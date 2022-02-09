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
	public var onSuccess: ((BannerView)-> Void)?
	public var onFailure: ((BannerView, String) -> Void)?
	public var onClick: ((BannerView) -> Void)?

	public init(adSpotID: String)
	{
		super.init(frame: CGRect.zero)
		super.adSpotId = adSpotID
	}

	required init?(coder: NSCoder)
	{
		fatalError("init(coder:) has not been implemented")
	}

	public override func load()
	{
		super.load
		{ (_, event) in
			switch event.eventType
			{
			case .succeeded:
				self.onSuccess?(self)
			case .failed:
				switch event.error
				{
				case .unfilled:
					print("ad unavailable")
					self.onFailure?(self, "ad unavailable")
				case .network:
					self.onFailure?(self, "network failure")
				default:
					break
				}
			case .clicked:
				self.onClick?(self)
			default:
				break
			}
		}
	}
}
