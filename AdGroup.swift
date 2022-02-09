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
		for bannerView in bannerViews {
			guard let AdBannerView = bannerView as? AdBannerView else { return }
			self.bannerGroup.banners.append(AdBannerView)
		}
	}

	public func load() {
		self.bannerGroup.load { (group, bannerView, event) in

			guard let AdBannerView = bannerView as? AdBannerView else { return }

			switch event.eventType {
			case .succeeded:
				AdBannerView.onAdLoaded?(.success(AdBannerView))

			case .failed:
				print("received event failed \(event.error)")
				switch event.error {
					case .none:
						AdBannerView.onAdLoaded?(.failure(AdBannerView, "No Error"))
					case .internal:
						AdBannerView.onAdLoaded?(.failure(AdBannerView, "Internal Error"))
					case .network:
						AdBannerView.onAdLoaded?(.failure(AdBannerView, "network Error"))
					case .fatal:
						AdBannerView.onAdLoaded?(.failure(AdBannerView, "fatal Error"))
					case .unfilled:
						AdBannerView.onAdLoaded?(.failure(AdBannerView, "unfilled Error"))
					@unknown default:
						AdBannerView.onAdLoaded?(.failure(AdBannerView, "Unknown Error"))
				}
			default:
				AdBannerView.onAdLoaded?(.failure(AdBannerView, "Unknown Event"))
				print("other event \(event.eventType)")
			}
		}
	}

}
