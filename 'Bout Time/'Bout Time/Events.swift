//
//  Facts.swift
//  'Bout Time
//
//  Created by Arwin Oblea on 5/31/19.
//  Copyright © 2019 Arwin Oblea. All rights reserved.
//

import Foundation

struct EventData {
  let event1 = Event(title: "Iron Man", link: "https://en.wikipedia.org/wiki/Iron_Man_(2008_film)", date: "May 2, 2008")
  let event2 = Event(title: "The Incredible Hulk", link: "https://en.wikipedia.org/wiki/The_Incredible_Hulk_(film)", date: "June 13, 2008")
  let event3 = Event(title: "Iron Man 2", link: "https://en.wikipedia.org/wiki/Iron_Man_2", date: "May 7, 2010")
  let event4 = Event(title: "Thor", link: "https://en.wikipedia.org/wiki/Thor_(film)", date: "May 6, 2011")
  let event5 = Event(title: "Captain America: The First Avenger", link: "https://en.wikipedia.org/wiki/Captain_America:_The_First_Avenger", date: "July 22, 2011")
  let event6 = Event(title: "Marvel's The Avengers", link: "https://en.wikipedia.org/wiki/The_Avengers_(2012_film)", date: "May 4, 2012")
  let event7 = Event(title: "Iron Man 3", link: "https://en.wikipedia.org/wiki/Iron_Man_3", date: "May 3, 2013")
  let event8 = Event(title: "Thor: The Dark World", link: "https://en.wikipedia.org/wiki/Thor:_The_Dark_World", date: "November 8, 2013")
  let event9 = Event(title: "Captain America: The Winter Soldier", link: "https://en.wikipedia.org/wiki/Captain_America:_The_Winter_Soldier", date: "April 4, 2014")
  let event10 = Event(title: "Guardians of the Galaxy", link: "https://en.wikipedia.org/wiki/Guardians_of_the_Galaxy_(film)", date: "August 1, 2014")
  let event11 = Event(title: "Avengers: Age of Ultron", link: "https://en.wikipedia.org/wiki/Avengers:_Age_of_Ultron", date: "May 1, 2015")
  let event12 = Event(title: "Ant-Man", link: "https://en.wikipedia.org/wiki/Ant-Man_(film)", date: "July 17, 2015")
  let event13 = Event(title: "Captain America: Civil War", link: "https://en.wikipedia.org/wiki/Captain_America:_Civil_War", date: "May 6, 2016")
  let event14 = Event(title: "Doctor Strange", link: "https://en.wikipedia.org/wiki/Doctor_Strange_(2016_film)", date: "November 4, 2016")
  let event15 = Event(title: "Guardians of the Galaxy Vol. 2", link: "https://en.wikipedia.org/wiki/Guardians_of_the_Galaxy_Vol._2", date: "May 5, 2017")
  let event16 = Event(title: "Spider-Man: Homecoming", link: "https://en.wikipedia.org/wiki/Spider-Man:_Homecoming", date: "July 7, 2017")
  let event17 = Event(title: "Thor: Ragnarok", link: "https://en.wikipedia.org/wiki/Thor:_Ragnarok", date: "November 3, 2017")
  let event18 = Event(title: "Black Panther", link: "https://en.wikipedia.org/wiki/Black_Panther_(film)", date: "February 16, 2018")
  let event19 = Event(title: "Avengers: Infinity War", link: "https://en.wikipedia.org/wiki/Avengers:_Infinity_War", date: "April 27, 2018")
  let event20 = Event(title: "Ant-Man and the Wasp", link: "https://en.wikipedia.org/wiki/Ant-Man_and_the_Wasp", date: "July 6, 2018")
  let event21 = Event(title: "Captain Marvel", link: "https://en.wikipedia.org/wiki/Captain_Marvel_(film)", date: "March 8, 2019")
  let event22 = Event(title: "Avengers: Endgame", link: "https://en.wikipedia.org/wiki/Avengers:_Endgame", date: "April 26, 2019")
  let event23 = Event(title: "Spider-Man: Far From Home", link: "https://en.wikipedia.org/wiki/Spider-Man:_Far_From_Home", date: "July 2, 2019")
  let event24 = Event(title: "Stan Lee Dies", link: "https://en.wikipedia.org/wiki/Stan_Lee", date: "November 12, 2018")
  let event25 = Event(title: "The Defenders", link: "https://en.wikipedia.org/wiki/The_Defenders_(miniseries)", date: "August 18, 2017")
}

protocol Events {
  var events: [Event] { get }
  var selections: [EventSelection] { get }
  var selectionsWithEvents: [EventSelection: Event] { get }
}
