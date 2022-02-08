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
		self.bannerGroup.banners.append(adsBannerView)
	}

	public func removeBannerViewFromBannerGroup(adsBannerView: AdsBannerView) {
		if let index = self.bannerGroup.banners.firstIndex(where: {$0.adSpotId == adsBannerView.adSpotId}) {
			self.bannerGroup.banners.remove(at: index)
		}
	}

	public func loadBannersInGroup() {
		self.bannerGroup.load { (group, bannerView, event) in

			guard let adsBannerView = bannerView as? AdsBannerView else { return }

			switch event.eventType {
			case .succeeded:
				adsBannerView.onSuccessListner?(adsBannerView)
				
			case .failed:
				print("received event failed \(event.error)")
				switch event.error {
					case .none:
						print("No Error")
						adsBannerView.onFailureListner?("No Error")
					case .internal:
						print("Internal Error")
						adsBannerView.onFailureListner?("Internal Error")
					case .network:
						print("network Error")
						adsBannerView.onFailureListner?("network Error")
					case .fatal:
						print("fatal Error")
						adsBannerView.onFailureListner?("fatal Error")
					case .unfilled:
						print("unfilled Error")
						adsBannerView.onFailureListner?("unfilled Error")
					@unknown default:
						print("Unknown Error")
						adsBannerView.onFailureListner?("Unknown Error")
				}
			default:
				adsBannerView.onFailureListner?("Unknown Event")
				print("other event \(event.eventType)")
			}
		}
	}
}
