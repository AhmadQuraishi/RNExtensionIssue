
//
//  IntentViewController.swift
//  IssuerUIExtension
//
//  Created by Ahmed Quraishi on 30/05/2024.
//

import PassKit
import React
import UIKit

// As an example, this extension's Info.plist has been configured to handle interactions for INSendMessageIntent.
// You will want to replace this or add other intents as appropriate.
// The intents whose interactions you wish to handle must be declared in the extension's Info.plist.

// You can test this example integration by saying things to Siri like:
// "Send a message using <myApp>"

class IntentViewController: UIViewController, PKIssuerProvisioningExtensionAuthorizationProviding {
  var completionHandler: ((PKIssuerProvisioningExtensionAuthorizationResult) -> Void)?

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func loadView() {
    loadReactNativeView()
  }

  func loadReactNativeView() {
    guard let jsCodeLocation = URL(string: "http://localhost:8081/index.bundle?platform=ios") else {
      return
    }

    let rootView = RCTRootView(
      bundleURL: jsCodeLocation,
      moduleName: "WalletExtensionUI",
      initialProperties: nil,
      launchOptions: nil
    )

    let viewController = UIViewController()
    viewController.view = rootView
    self.present(viewController, animated: true, completion: nil)

  }
}

