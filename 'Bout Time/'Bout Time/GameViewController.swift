//
//  ViewController.swift
//  'Bout Time
//
//  Created by Arwin Oblea on 5/24/19.
//  Copyright © 2019 Arwin Oblea. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
  
  // MARK: - Properties
  @IBOutlet weak var fact1View: UIView!
  @IBOutlet weak var fact2View: UIView!
  @IBOutlet weak var fact3View: UIView!
  @IBOutlet weak var fact4View: UIView!
  
  @IBOutlet weak var fact1Label: UILabel!
  @IBOutlet weak var fact2Label: UILabel!
  @IBOutlet weak var fact3Label: UILabel!
  @IBOutlet weak var fact4Label: UILabel!
  
  @IBOutlet weak var fact1DownButton: UIButton!
  @IBOutlet weak var fact2UpButton: UIButton!
  @IBOutlet weak var fact2DownButton: UIButton!
  @IBOutlet weak var fact3UpButton: UIButton!
  @IBOutlet weak var fact3DownButton: UIButton!
  @IBOutlet weak var fact4UpButton: UIButton!
  @IBOutlet weak var playButton: UIButton!
  
  @IBOutlet weak var timerLabel: UILabel!
  @IBOutlet weak var instructionLabel: UILabel!
  
  let game = GameManager()
  var eventsForGame: [Event] = []
  
  let dateFormatter = DateFormatter()
  var sortedDates: [Date] = []
  
  var urlString: String = ""
  
  var labels: [UILabel] = []
  var directionalButtons: [UIButton] = []
  
  // MARK: - ViewDidLoad
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    game.populateData() 
  
    setupDisplay()

    startGame()
  }
  
  func setupDisplay() {
    view.backgroundColor = game.mainColor
    instructionLabel.textColor = game.secondaryColor
    
    // Add tap gestures on each label for webview
    let tapLabel1 = UITapGestureRecognizer(target: self, action: #selector(label1Tapped))
    let tapLabel2 = UITapGestureRecognizer(target: self, action: #selector(label2Tapped))
    let tapLabel3 = UITapGestureRecognizer(target: self, action: #selector(label3Tapped))
    let tapLabel4 = UITapGestureRecognizer(target: self, action: #selector(label4Tapped))
    
    fact1Label.addGestureRecognizer(tapLabel1)
    fact2Label.addGestureRecognizer(tapLabel2)
    fact3Label.addGestureRecognizer(tapLabel3)
    fact4Label.addGestureRecognizer(tapLabel4)
    
    labels = [fact1Label, fact2Label, fact3Label, fact4Label]
    for label in labels.enumerated() {
      label.element.textColor = game.mainColor
      label.element.numberOfLines = 0
    }
    
    // Adjust facts view corner radius to match with button edges
    let factViewArray = [fact1View, fact2View, fact3View, fact4View]
    for i in factViewArray {
      i?.layer.masksToBounds = true
      i?.layer.cornerRadius = 5
      i?.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
    }
    
    // Add constraints for labels
    fact1Label.translatesAutoresizingMaskIntoConstraints = false
    fact1Label.centerYAnchor.constraint(equalTo: fact1View.centerYAnchor).isActive = true
    fact1Label.leadingAnchor.constraint(equalTo: fact1View.leadingAnchor, constant: 20).isActive = true
    fact1Label.trailingAnchor.constraint(equalTo: fact1View.trailingAnchor, constant: 20).isActive = true
    
    fact2Label.translatesAutoresizingMaskIntoConstraints = false
    fact2Label.centerYAnchor.constraint(equalTo: fact2View.centerYAnchor).isActive = true
    fact2Label.leadingAnchor.constraint(equalTo: fact2View.leadingAnchor, constant: 20).isActive = true
    fact2Label.trailingAnchor.constraint(equalTo: fact2View.trailingAnchor, constant: 20).isActive = true
    
    fact3Label.translatesAutoresizingMaskIntoConstraints = false
    fact3Label.centerYAnchor.constraint(equalTo: fact3View.centerYAnchor).isActive = true
    fact3Label.leadingAnchor.constraint(equalTo: fact3View.leadingAnchor, constant: 20).isActive = true
    fact3Label.trailingAnchor.constraint(equalTo: fact3View.trailingAnchor, constant: 20).isActive = true
    
    fact4Label.translatesAutoresizingMaskIntoConstraints = false
    fact4Label.centerYAnchor.constraint(equalTo: fact4View.centerYAnchor).isActive = true
    fact4Label.leadingAnchor.constraint(equalTo: fact4View.leadingAnchor, constant: 20).isActive = true
    fact4Label.trailingAnchor.constraint(equalTo: fact4View.trailingAnchor, constant: 20).isActive = true
  }
  
  func startGame() {
    game.rounds += 1
    
    disableEventLabelsInteraction()
    enableDirectionalButtons()
    
    eventsForGame = game.randomEvents()
    sortEventsByDate()
    updateEventLabels()
  
    timerLabel.isHidden = false
    game.seconds = 60
    startTimer()
    instructionLabel.text = "Shake to complete"
  }
  
  func disableEventLabelsInteraction() {
    for label in labels.enumerated() {
      label.element.isUserInteractionEnabled = false
    }
    
    playButton.isEnabled = false
    playButton.isHidden = true
  }
  
  func enableEventLabelsInteraction() {
    for label in labels.enumerated() {
      label.element.isUserInteractionEnabled = true
    }
    playButton.isEnabled = true
  }
  
  func sortEventsByDate() {
    dateFormatter.dateFormat = "MM dd, yyyy"
    var datesToSort = [Date]()
    for date in eventsForGame {
      let dateFormatted = dateFormatter.date(from: date.date)
      if let dateFormatted = dateFormatted {
        datesToSort.append(dateFormatted)
      }
    }
    sortedDates = datesToSort.sorted(by: { $0.compare($1) == .orderedAscending })
  }
  
  func startTimer() {
    game.gameTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector (updateTimer), userInfo: nil, repeats: true)
  }
  
  @objc func updateTimer() {
    if game.seconds < 1 {
      checkAnswer()
    } else {
      game.seconds -= 1
      timerLabel.text = timeString(time: TimeInterval(game.seconds))
    }
  }
  
  func timeString(time: TimeInterval) -> String {
    let seconds = Int(time) % 60
    return String(format:"0:%02i", seconds)
  }
  
  // MARK: - IBActions
  @IBAction func buttonTapped(_ sender: UIButton) {
    switch sender {
    case fact1DownButton:
      eventsForGame.swapAt(0, 1)
      updateEventLabels()
      
      sender.setImage(UIImage(named: "down_full_selected"), for: .normal)
      fact2UpButton.setImage(UIImage(named: "up_half"), for: .normal)
      fact2DownButton.setImage(UIImage(named: "down_half"), for: .normal)
      fact3UpButton.setImage(UIImage(named: "up_half"), for: .normal)
      fact3DownButton.setImage(UIImage(named: "down_half"), for: .normal)
      fact4UpButton.setImage(UIImage(named: "up_full"), for: .normal)
    case fact2UpButton:
      eventsForGame.swapAt(1, 0)
      updateEventLabels()
      
      sender.setImage(UIImage(named: "up_half_selected"), for: .normal)
      fact1DownButton.setImage(UIImage(named: "down_full"), for: .normal)
      fact2DownButton.setImage(UIImage(named: "down_half"), for: .normal)
      fact3UpButton.setImage(UIImage(named: "up_half"), for: .normal)
      fact3DownButton.setImage(UIImage(named: "down_half"), for: .normal)
      fact4UpButton.setImage(UIImage(named: "up_full"), for: .normal)
    case fact2DownButton:
      eventsForGame.swapAt(1, 2)
      updateEventLabels()
      
      sender.setImage(UIImage(named: "down_half_selected"), for: .normal)
      fact2UpButton.setImage(UIImage(named: "up_half"), for: .normal)
      fact1DownButton.setImage(UIImage(named: "down_full"), for: .normal)
      fact3UpButton.setImage(UIImage(named: "up_half"), for: .normal)
      fact3DownButton.setImage(UIImage(named: "down_half"), for: .normal)
      fact4UpButton.setImage(UIImage(named: "up_full"), for: .normal)
    case fact3UpButton:
      eventsForGame.swapAt(2, 1)
      updateEventLabels()
      
      sender.setImage(UIImage(named: "up_half_selected"), for: .normal)
      fact2UpButton.setImage(UIImage(named: "up_half"), for: .normal)
      fact2DownButton.setImage(UIImage(named: "down_half"), for: .normal)
      fact1DownButton.setImage(UIImage(named: "down_full"), for: .normal)
      fact3DownButton.setImage(UIImage(named: "down_half"), for: .normal)
      fact4UpButton.setImage(UIImage(named: "up_full"), for: .normal)
    case fact3DownButton:
      eventsForGame.swapAt(2, 3)
      updateEventLabels()
      
      sender.setImage(UIImage(named: "down_half_selected"), for: .normal)
      fact2UpButton.setImage(UIImage(named: "up_half"), for: .normal)
      fact2DownButton.setImage(UIImage(named: "down_half"), for: .normal)
      fact3UpButton.setImage(UIImage(named: "up_half"), for: .normal)
      fact1DownButton.setImage(UIImage(named: "down_full"), for: .normal)
      fact4UpButton.setImage(UIImage(named: "up_full"), for: .normal)
    case fact4UpButton:
      eventsForGame.swapAt(3, 2)
      updateEventLabels()
      
      sender.setImage(UIImage(named: "up_full_selected"), for: .normal)
      fact2UpButton.setImage(UIImage(named: "up_half"), for: .normal)
      fact2DownButton.setImage(UIImage(named: "down_half"), for: .normal)
      fact3UpButton.setImage(UIImage(named: "up_half"), for: .normal)
      fact3DownButton.setImage(UIImage(named: "down_half"), for: .normal)
      fact1DownButton.setImage(UIImage(named: "down_full"), for: .normal)
    default:
      break
    }
  }
  
  func updateEventLabels() {
    fact1Label.text = eventsForGame[0].title
    fact2Label.text = eventsForGame[1].title
    fact3Label.text = eventsForGame[2].title
    fact4Label.text = eventsForGame[3].title
  }
  
  func checkAnswer() {
    enableEventLabelsInteraction()
    
    game.gameTimer.invalidate()
    timerLabel.isHidden = true
    playButton.isHidden = false
    
    resetDirectionalButtons()
    
    let eventOrder = [eventsForGame[0], eventsForGame[1], eventsForGame[2], eventsForGame[3]]
    dateFormatter.dateFormat = "MM dd, yyyy"
    var currentOrder = [Date]()
    for date in eventOrder.enumerated() {
      let dateFormatted = dateFormatter.date(from: date.element.date)
      if let dateFormatted = dateFormatted {
        currentOrder.append(dateFormatted)
      }
    }
    
    if currentOrder == sortedDates {
      game.score += 1
      playButton.setBackgroundImage(UIImage(named: "next_round_success"), for: .normal)
      instructionLabel.text = "Tap events to learn more"
    } else {
      playButton.setBackgroundImage(UIImage(named: "next_round_fail"), for: .normal)
      instructionLabel.text = "Tap events to learn more"
    }
  }
  
  @IBAction func playButtonPressed(_ sender: UIButton) {
    if game.rounds == 6 {
      presentScoreViewController()
      resetGame()
    } else {
      startGame()
    }
  }
  
  func resetGame() {
    game.score = 0
    game.rounds = 0
  }
  
  override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
    if motion == .motionShake {
      enableEventLabelsInteraction()
      checkAnswer()
    }
  }
  
  func presentScoreViewController() {
    let scoreViewController = ScoreViewController()
    scoreViewController.scoreLabel.text = "\(game.score)/\(game.rounds)"
    present(scoreViewController, animated: true, completion: nil)
  }
  
  @objc func label1Tapped() {
    urlString = eventsForGame[0].link
    goToWebPage()
  }
  
  @objc func label2Tapped() {
    urlString = eventsForGame[1].link
    goToWebPage()
  }
  
  @objc func label3Tapped() {
    urlString = eventsForGame[2].link
    goToWebPage()
  }
  
  @objc func label4Tapped() {
    urlString = eventsForGame[3].link
    goToWebPage()
  }
  
  func goToWebPage() {
    let eventWebView = EventWebViewController()
    eventWebView.transferredURL = urlString
    let navController = UINavigationController(rootViewController: eventWebView)
    present(navController, animated: true, completion: nil)
  }
  
  func resetDirectionalButtons() {
    fact1DownButton.setImage(UIImage(named: "down_full"), for: .normal)
    fact2UpButton.setImage(UIImage(named: "up_half"), for: .normal)
    fact2DownButton.setImage(UIImage(named: "down_half"), for: .normal)
    fact3UpButton.setImage(UIImage(named: "up_half"), for: .normal)
    fact3DownButton.setImage(UIImage(named: "down_half"), for: .normal)
    fact4UpButton.setImage(UIImage(named: "up_full"), for: .normal)
    
    directionalButtons = [fact1DownButton, fact2UpButton, fact2DownButton, fact3UpButton, fact3DownButton, fact4UpButton]
    for button in directionalButtons.enumerated() {
      button.element.isUserInteractionEnabled = false
    }
  }
  
  func enableDirectionalButtons() {
    for button in directionalButtons.enumerated() {
      button.element.isUserInteractionEnabled = true
    }
  }
}
