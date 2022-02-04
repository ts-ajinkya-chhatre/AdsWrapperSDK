//
//  AdType.swift
//  AdsWrapperSDK
//
//  Created by Chhatre, Ajinkya on 31/01/22.
//

import Foundation

public enum BannerLoadResultType
{
	case success
	case failure
	case clicked
}

public enum AdType
{
	case callHistory
	case afterCallEnds
	case messageList
	case wallet
	case missionHomeScreen
	case missionsUnclaimedPointsScreen
	case discovery
}
