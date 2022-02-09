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
			guard let adsBannerView = bannerView as? AdsBannerView else { return }
			self.bannerGroup.banners.append(adsBannerView)
		}
	}

	public func load() {
		self.bannerGroup.load { (group, bannerView, event) in

			guard let adsBannerView = bannerView as? AdsBannerView else { return }

			switch event.eventType {
			case .succeeded:
				adsBannerView.onSuccess?(adsBannerView)

			case .failed:
				print("received event failed \(event.error)")
				switch event.error {
					case .none:
						print("No Error")
						adsBannerView.onFailure?(adsBannerView, "No Error")
					case .internal:
						print("Internal Error")
						adsBannerView.onFailure?(adsBannerView, "Internal Error")
					case .network:
						print("network Error")
						adsBannerView.onFailure?(adsBannerView, "network Error")
					case .fatal:
						print("fatal Error")
						adsBannerView.onFailure?(adsBannerView, "fatal Error")
					case .unfilled:
						print("unfilled Error")
						adsBannerView.onFailure?(adsBannerView, "unfilled Error")
					@unknown default:
						print("Unknown Error")
						adsBannerView.onFailure?(adsBannerView, "Unknown Error")
				}
			default:
				adsBannerView.onFailure?(adsBannerView, "Unknown Event")
				print("other event \(event.eventType)")
			}
		}
	}

}
