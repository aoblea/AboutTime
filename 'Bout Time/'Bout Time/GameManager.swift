//
//  GameManager.swift
//  'Bout Time
//
//  Created by Arwin Oblea on 6/2/19.
//  Copyright © 2019 Arwin Oblea. All rights reserved.
//

import Foundation
import GameplayKit

protocol GameColors {
  var mainColor: UIColor { get }
  var secondaryColor: UIColor { get }
}

class GameManager: Events, GameColors {
  
  // MARK: - Properties
  var mainColor: UIColor = UIColor(red: 5/255.0, green: 41/255.0, blue: 74/255.0, alpha: 1.0)
  var secondaryColor: UIColor = UIColor(red: 50/255.0, green: 136/255.0, blue: 173/255.0, alpha: 1.0)
  
  let eventData = EventData()
  var events: [Event] = []
  var selections: [EventSelection] = []
  var selectionsWithEvents: [EventSelection: Event] = [:]
  var uniqueNumbersCreated = [Int]()
  var numberOfEvents = 4
  
  var isGameOver = false
  var rounds = 0
  var score = 0
  var seconds = 60
  var gameTimer = Timer()
  
  // MARK: - Methods
  func populateEventsArray() -> [Event] {
    events = [eventData.event1, eventData.event2, eventData.event3, eventData.event4, eventData.event5, eventData.event6, eventData.event7, eventData.event8, eventData.event9, eventData.event10, eventData.event11, eventData.event12, eventData.event13, eventData.event14, eventData.event15, eventData.event16, eventData.event17, eventData.event18, eventData.event19, eventData.event20 , eventData.event21, eventData.event22, eventData.event23]
    return events
  }
  
  func populateEventSelections() -> [EventSelection] {
    for selection in EventSelection.allCases {
      if let value = EventSelection(rawValue: selection.rawValue) {
        selections.append(value)
      } else {
        print("Error invalid rawvalue!")
      }
    }
    return selections
  }
  
  func populateSelectionsWithEvents() -> [EventSelection: Event] {
    for (x, y) in selections.enumerated() {
      selectionsWithEvents[y] = events[x]
    }
    return selectionsWithEvents
  }
  
  // Generates a unique number every time
  func generateRandomUniqueNumber() -> Int {
    if uniqueNumbersCreated.count >= selectionsWithEvents.count {
      uniqueNumbersCreated.removeAll()
    }
    
    var randomNumber = Int.random(in: 0..<selectionsWithEvents.count)
    while uniqueNumbersCreated.contains(randomNumber) {
      randomNumber = Int.random(in: 0..<selectionsWithEvents.count)
    }
    uniqueNumbersCreated.append(randomNumber)
    
    return randomNumber
  }
  
  // Picks a random event from the selections
  func randomEvent() throws -> Event {
    guard let selection = EventSelection(rawValue: "event\(generateRandomUniqueNumber()+1)") else {
      throw EventError.invalidSelection
    }
    guard let event = selectionsWithEvents[selection] else {
      throw EventError.invalidData
    }
    
    return event
  }
  
  // Stores random events in array based on number of events per round
  func randomEvents() -> [Event] {
    var randomEvents: [Event] = []
    
    for _ in 0..<numberOfEvents {
      do {
        try randomEvents.append(randomEvent())
      } catch {
        print("Cannot append empty range! \(error)")
      }
    }
    return randomEvents
  }
  
  func populateData() {
    events = populateEventsArray()
    selections = populateEventSelections()
    selectionsWithEvents = populateSelectionsWithEvents()
  }
  
  
}
