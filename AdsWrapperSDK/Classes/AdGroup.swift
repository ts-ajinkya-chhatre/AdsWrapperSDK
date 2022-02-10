//
//  AdGroup.swift
//  AdsWrapperSDK
//
//  Created by Chhatre, Ajinkya on 09/02/22.
//

import Foundation
import RUNABanner

public class AdGroup
{
	private var bannerGroup = RUNABannerGroup()

	public init(bannerViews: [BannerView]) {
		self.bannerGroup.banners.append(contentsOf: bannerViews.compactMap { $0 as? AdBannerView })
	}

	public func load() {
		self.bannerGroup.load { (group, bannerView, event) in

			guard let adBannerView = bannerView as? AdBannerView else { return }

			switch event.eventType {
			case .succeeded:
				adBannerView.onAdLoaded?(.success(adBannerView))

			case .failed:
				switch event.error {
					case .none:
						adBannerView.onAdLoaded?(.failure(AdWrapperError.none))
					case .internal:
						adBannerView.onAdLoaded?(.failure(AdWrapperError.internalError))
					case .network:
						adBannerView.onAdLoaded?(.failure(AdWrapperError.network))
					case .fatal:
						adBannerView.onAdLoaded?(.failure(AdWrapperError.fatal))
					case .unfilled:
						adBannerView.onAdLoaded?(.failure(AdWrapperError.unfilled))
					@unknown default:
						adBannerView.onAdLoaded?(.failure(AdWrapperError.unknown))
				}
			default:
				adBannerView.onAdLoaded?(.failure(AdWrapperError.unknown))
			}
		}
	}

}
