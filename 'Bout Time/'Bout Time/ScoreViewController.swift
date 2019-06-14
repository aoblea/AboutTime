//
//  ScoreViewController.swift
//  'Bout Time
//
//  Created by Arwin Oblea on 6/6/19.
//  Copyright © 2019 Arwin Oblea. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController {

  // MARK: - Properties
  let game = GameManager()
  
  let titleLabel = UILabel()
  let scoreLabel = UILabel()
  let playAgain = UIButton()
  
  override func viewDidLoad() {
    updateDisplay()
  }
  
  // MARK: - Methods
  func updateDisplay() {
    view.backgroundColor = game.mainColor
    
    titleLabel.numberOfLines = 0
    titleLabel.textColor = game.secondaryColor
    titleLabel.text = "Your Score"
    
    scoreLabel.textColor = .white
    scoreLabel.font = UIFont(name: "System Font Regular", size: 40)
    
    playAgain.setImage(UIImage(named: "play_again"), for: .normal)
    playAgain.addTarget(self, action: #selector(playButtonPressed), for: .touchUpInside)
    
    view.addSubview(titleLabel)
    view.addSubview(scoreLabel)
    view.addSubview(playAgain)
    
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100).isActive = true
    
    scoreLabel.translatesAutoresizingMaskIntoConstraints = false
    scoreLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    scoreLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 0).isActive = true
    
    playAgain.translatesAutoresizingMaskIntoConstraints = false
    playAgain.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    playAgain.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor, constant: 50).isActive = true
    playAgain.heightAnchor.constraint(equalToConstant: 40).isActive = true
    playAgain.widthAnchor.constraint(equalToConstant: 130).isActive = true
  }
  
  @objc func playButtonPressed() {
    dismiss(animated: false, completion: nil)
  }
}
