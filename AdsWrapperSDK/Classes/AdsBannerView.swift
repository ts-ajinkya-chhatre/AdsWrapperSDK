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
	public var onSuccessListner: ((AdsBannerView)-> Void)?
	public var onFailureListner: ((String) -> Void)?
	public var onClickListner: ((AdsBannerView) -> Void)?

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
				self.onSuccessListner?(self)
			case .failed:
				switch event.error
				{
				case .unfilled:
					print("ad unavailable")
					self.onFailureListner?("ad unavailable")
				case .network:
					self.onFailureListner?("ad unavailable")
				default:
					break
				}
			case .clicked:
				self.onClickListner?(self)
			default:
				break
			}
		}
	}
}
