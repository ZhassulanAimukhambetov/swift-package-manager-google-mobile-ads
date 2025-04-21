// swift-tools-version:5.3

// Copyright 2021 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import PackageDescription

let package = Package(
  name: "GoogleMobileAds",
  platforms: [.iOS(.v12)],
  products: [
    .library(
      name: "GoogleMobileAds",
      targets: ["GoogleMobileAdsTarget"]
    ),
    .library(
        name: "AppLovinMediationGoogleAdapter",
        targets: [
            "AppLovinMediationGoogleAdapterWrapper",
        ]
    )
  ],
  dependencies: [
    .package(
      name: "GoogleUserMessagingPlatform",
      url: "https://github.com/googleads/swift-package-manager-google-user-messaging-platform.git",
      "1.1.0"..<"4.0.0"
    )
  ],
  targets: [
    .target(
      name: "GoogleMobileAdsTarget",
      dependencies: [
        .target(name: "GoogleMobileAds"),
        .product(name: "GoogleUserMessagingPlatform", package: "GoogleUserMessagingPlatform"),
      ],
      path: "GoogleMobileAdsTarget"
    ),
    .binaryTarget(
      name: "GoogleMobileAds",
      url:
        "https://dl.google.com/googleadmobadssdk/5b3e79fb08b87eee/googlemobileadsios-spm-12.3.0.zip",
      checksum: "5b3e79fb08b87eee0e18f8bb5bba67c5e7a0d37a946236a3951759ff4c86eabf"
    ),
    .target(
        name: "AppLovinMediationGoogleAdapterWrapper",
        dependencies: [
            .target(name: "AppLovinMediationGoogleAdapterTarget"),
            .target(name: "AppLovinSDKTarget")
        ],
        path: "AppLovinMediationGoogleAdapterWrapper"
    ),
    .binaryTarget(
        name: "AppLovinMediationGoogleAdapterTarget",
        url: "https://artifacts.applovin.com/ios/com/applovin/mediation/google-adapter/AppLovinMediationGoogleAdapter-12.3.0.0.zip",
        checksum: "a5bb2f5e862bb880fa74291fd3282fdff6968a968351e09e75162a90f5362692"
    ),
    .binaryTarget(
        name: "AppLovinSDKTarget",
        url: "https://artifacts.applovin.com/ios/com/applovin/applovin-sdk/applovin-ios-sdk-13.0.0.zip",
        checksum: "4e37fddffdbfc82820ecbeaf3ac5b06f74ebb8c2d3ad42ff1ea93c73c34948c8"
    )
  ]
)
