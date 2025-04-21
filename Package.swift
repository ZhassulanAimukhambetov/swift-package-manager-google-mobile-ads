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
      "1.1.0"..<"3.0.0"
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
        "https://dl.google.com/googleadmobadssdk/174c3d7fc6c1b4eb/googlemobileadsios-spm-11.12.0.zip",
      checksum: "174c3d7fc6c1b4eb9a4795c584659567bd19fe8cfadb35af5bc5f723e4251e8d"
    ),
    .target(
        name: "AppLovinMediationGoogleAdapterWrapper",
        dependencies: [
            .target(name: "AppLovinMediationGoogleAdapterTarget"),
            .product(name: "AppLovinSDK", package: "AppLovin-MAX-Swift-Package")
        ],
        path: "AppLovinMediationGoogleAdapterWrapper"
    ),
    .binaryTarget(
        name: "AppLovinMediationGoogleAdapterTarget",
        url: "https://artifacts.applovin.com/ios/com/applovin/mediation/google-adapter/AppLovinMediationGoogleAdapter-11.12.0.0.zip",
        checksum: "08af5abaf4091e43f227648905c44a4e74b7edbd1ce003bef6869bfad4aa8ffa"
    )
  ]
)
