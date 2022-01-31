Pod::Spec.new do |spec|

  spec.name         = "AdsWrapperSDK"
  spec.version      = "0.0.1"
  spec.summary      = "A cocoapods iOS wrapper library over the Rakuten RUNA iOS Ads SDK"

  spec.description  = <<-DESC
    A cocoapods iOS wrapper library over the Rakuten RUNA iOS Ads SDK whick applications can use.
                   DESC

  spec.homepage     = "https://github.com/ts-ajinkya-chhatre/AdsWrapperSDK.git"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author             = { "ts-ajinkya-chhatre" => "ts-ajinkya.chhatre@rakuten.com" }
  spec.ios.deployment_target = "14.0"
  spec.swift_version = "5.3"
  spec.source       = { :git => "https://github.com/ts-ajinkya-chhatre/AdsWrapperSDK.git", :tag => "#{spec.version} }
  spec.source_files  = "AdsWrapperSDK/**/*.{h,m,swift}"
end
