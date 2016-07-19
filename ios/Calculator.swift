//
//  Calculator.swift
//  telegrapher
//
//  Created by Danilo Caetano on 7/18/16.
//  Copyright © 2016 TrueCar. All rights reserved.
//

import UIKit

final class CalculatorViewController: UIViewController {
  
  /* IBOutlets */
  
  // Display
  @IBOutlet var output: UILabel!
  
  // Numbers
  @IBOutlet var one: UIButton!
  @IBOutlet var two: UIButton!
  @IBOutlet var three: UIButton!
  @IBOutlet var four: UIButton!
  @IBOutlet var five: UIButton!
  @IBOutlet var six: UIButton!
  @IBOutlet var seven: UIButton!
  @IBOutlet var eight: UIButton!
  @IBOutlet var nine: UIButton!
  @IBOutlet var zero: UIButton!
  @IBOutlet var empty: UIButton! /* Acts like 'zero' */

  // Operations
  @IBOutlet var plus: UIButton!
  @IBOutlet var minus: UIButton!
  @IBOutlet var times: UIButton!
  @IBOutlet var divide: UIButton!
  @IBOutlet var equals: UIButton!
  
  // Specials - v2
  @IBOutlet var clear: UIButton!
  @IBOutlet var negate: UIButton!
  @IBOutlet var percentage: UIButton!
  
  /* IBActions */
  
  @IBAction func didPressKey(key: UIButton) {
    
    switch key {
    case clear:
      print("case \(key)")
      reset()
    default:
      print("default")
    }
    
  }
  
  /* Private variables */
  private var result = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
    reset()
  }
  
  private func setup() {
    RCTBundleURLProvider.sharedSettings().setDefaults()
    let jsCodeLocation = RCTBundleURLProvider.sharedSettings().jsBundleURL(forBundleRoot: "index.ios", fallbackResource: nil)
    let moduleView = RCTRootView(bundleURL: jsCodeLocation, moduleName: "telegrapher", initialProperties: nil, launchOptions: nil)
    
    guard let module = moduleView else { fatalError("Invalid RCTRootView") }
    self.view.addSubview(module)
  }
  
  private func reset() {
    print("reset()")
    result = 0
    output.text = "\(result)"
  }
  
}
