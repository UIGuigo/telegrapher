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
    case one:
      numberKeyPressed(number: 1)
    case two:
      numberKeyPressed(number: 2)
    case three:
      numberKeyPressed(number: 3)
    case four:
      numberKeyPressed(number: 4)
    case five:
      numberKeyPressed(number: 5)
    case six:
      numberKeyPressed(number: 6)
    case seven:
      numberKeyPressed(number: 7)
    case eight:
      numberKeyPressed(number: 8)
    case nine:
      numberKeyPressed(number: 9)
    case zero:
      numberKeyPressed(number: 0)
    case empty:
      numberKeyPressed(number: 0)
    case plus:
      operationKeyPressed(op: "+")
    case minus:
      operationKeyPressed(op: "-")
    case times:
      operationKeyPressed(op: "*")
    case divide:
      operationKeyPressed(op: "/")
    case equals:
      operationKeyPressed(op: "=")
    case clear:
      reset()
    default:
      print("default")
    }
    
  }
  
  /* Private variables */
  private let module = CalculatorBridge()
  private var result = 0
  private let lhs = 0
  private let rhs = 0
  private let operation = ""
  
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
  
  private func numberKeyPressed(number: Int) {
    print("#\(number) pressed")
  }
  
  private func operationKeyPressed(op: String) {
    print("\(op) pressed")
  }
  
}
