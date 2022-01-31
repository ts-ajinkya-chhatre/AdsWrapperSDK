//
//  ViewController.swift
//  AdsWrapperSDKExample
//
//  Created by Chhatre, Ajinkya on 31/01/22.
//

import UIKit
import AdsWrapperSDK

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}

	override func viewWillAppear(_ animated: Bool) {
		let addView =  AdSDKManager.sharedInstance.createSingleAddViewForAddType(addType: .wallet, cacheView: false)
		addView.loadBanner { result in
			switch result {
				case .success:
					print("Add Load Success")
				case .failure:
					print("Add Load Failed")
				case .clicked:
					print("Add Clicked")
			}
		}
		self.view.addSubview(addView)
	}
}

