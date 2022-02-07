//
//  AdSDKManager.swift
//  AdsWrapperSDK
//
//  Created by Chhatre, Ajinkya on 31/01/22.
//

import Foundation
import RUNABanner

public final class AdSDKManager
{
	public static let sharedInstance = AdSDKManager()

	public var groupType: GroupType = .none

	private var runaAdSession: RUNAAdSession = RUNAAdSession()
	private var bannerGroup: RUNABannerGroup = RUNABannerGroup()

	public func createAddView(addSpotID: String) -> AdsBannerView
	{
		switch self.groupType {
			case .none:
				return AdsBannerView(adSpotID: addSpotID)
			case .adGroup:
				return AdsBannerView(adSpotID: addSpotID)
			case .adSession:
				let adView = AdsBannerView(adSpotID: addSpotID)
				adView.session = self.runaAdSession
				return adView
		}
	}

	public func refreshAdSession() {
		// As there is no way to refresh existing session, we create a new instance here
		self.runaAdSession = RUNAAdSession()
	}

	public func addBannerViewToBannerGroup(adsBannerView: AdsBannerView) {
		bannerGroup.banners.append(adsBannerView)
	}

	public func loadBannersInGroup(completion: @escaping (AdsBannerView, BannerLoadResultType) -> Void) {
		self.bannerGroup.load { (group, bannerView, event) in

			guard let adsBannerView = bannerView as? AdsBannerView else { return }

			switch event.eventType {
			case .succeeded:
				completion(adsBannerView, .success)
			case .failed:
				completion(adsBannerView, .failure)
				print("received event failed \(event.error)")
				switch event.error {
					case .none:
						print("No Error")
					case .internal:
						print("Internal Error")
					case .network:
						print("network Error")
					case .fatal:
						print("fatal Error")
					case .unfilled:
						print("unfilled Error")
					@unknown default:
						print("Unknown Error")
				}
			default:
				completion(adsBannerView, .failure)
				print("other event \(event.eventType)")
			}
		}
	}
}
