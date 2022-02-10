//
//  AdBannerView.swift
//  AdsWrapperSDK
//
//  Created by Chhatre, Ajinkya on 31/01/22.
//

import UIKit
import RUNABanner

public class AdBannerView: RUNABannerView, BannerView
{
	public var onAdLoaded: ((Result<BannerView, Error>) -> Void)?
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
				self.onAdLoaded?(.success(self))
			case .failed:
				switch event.error
				{
				case .unfilled:
					self.onAdLoaded?(.failure(AdWrapperError.unfilled))
				case .network:
					self.onAdLoaded?(.failure(AdWrapperError.network))
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
