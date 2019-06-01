//
//  ViewController.swift
//  'Bout Time
//
//  Created by Arwin Oblea on 5/24/19.
//  Copyright © 2019 Arwin Oblea. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  // MARK: - Properties
  @IBOutlet weak var fact1View: UIView!
  @IBOutlet weak var fact2View: UIView!
  @IBOutlet weak var fact3View: UIView!
  @IBOutlet weak var fact4View: UIView!
  
  @IBOutlet weak var fact1Label: UILabel!
  @IBOutlet weak var fact2Label: UILabel!
  @IBOutlet weak var fact3Label: UILabel!
  @IBOutlet weak var fact4Label: UILabel!
  
  @IBOutlet weak var fact1UpButton: UIButton!
  @IBOutlet weak var fact2UpButton: UIButton!
  @IBOutlet weak var fact2DownButton: UIButton!
  @IBOutlet weak var fact3UpButton: UIButton!
  @IBOutlet weak var fact3DownButton: UIButton!
  @IBOutlet weak var fact4DownButton: UIButton!
  
  @IBOutlet weak var timerButton: UIButton!
  @IBOutlet weak var instructionLabel: UILabel!
  
  // MARK: - ViewDidLoad
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    
    updateDisplay()
    
  }
  
  // MARK: - Helper Methods
  func updateDisplay() {
    let gameColor = UIColor(red: 5/255.0, green: 41/255.0, blue: 74/255.0, alpha: 1.0)
    view.backgroundColor = gameColor
    
    // Adjust facts view corner radius to match with button edges
    let factViewArray = [fact1View, fact2View, fact3View, fact4View]
    for i in factViewArray {
      i?.layer.masksToBounds = true
      i?.layer.cornerRadius = 5
      i?.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
    }
    
    fact1Label.translatesAutoresizingMaskIntoConstraints = false
    fact1Label.centerYAnchor.constraint(equalTo: fact1View.centerYAnchor).isActive = true
    fact1Label.leadingAnchor.constraint(equalTo: fact1View.leadingAnchor, constant: 20).isActive = true
    
    fact2Label.translatesAutoresizingMaskIntoConstraints = false
    fact2Label.centerYAnchor.constraint(equalTo: fact2View.centerYAnchor).isActive = true
    fact2Label.leadingAnchor.constraint(equalTo: fact2View.leadingAnchor, constant: 20).isActive = true
    
    fact3Label.translatesAutoresizingMaskIntoConstraints = false
    fact3Label.centerYAnchor.constraint(equalTo: fact3View.centerYAnchor).isActive = true
    fact3Label.leadingAnchor.constraint(equalTo: fact3View.leadingAnchor, constant: 20).isActive = true
    
    fact4Label.translatesAutoresizingMaskIntoConstraints = false
    fact4Label.centerYAnchor.constraint(equalTo: fact4View.centerYAnchor).isActive = true
    fact4Label.leadingAnchor.constraint(equalTo: fact4View.leadingAnchor, constant: 20).isActive = true
    
    timerButton.isUserInteractionEnabled = false
  }
  
  
  
  // MARK: - Button Actions
  @IBAction func sendFactDown(_ sender: UIButton) {
    // TODO: - set button tags and create logic to send label down
  }
  
  @IBAction func sendFactUp(_ sender: UIButton) {
    // TODO: - set button tags and create logic to send label up
  }
  
  
  
  
}
