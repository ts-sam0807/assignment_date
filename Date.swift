//
//  Date.swift
//  Assignment2
//
//  Created by Derrick Park on 2023-03-03.
//
import Foundation

struct Date: CustomStringConvertible, Comparable {
  private(set) var day: Int
  private(set) var month: Int
  private(set) var year: Int
  private(set) var dateFormat: DateFormat = .standard
  
  init(month: Int = 1, day: Int = 1, year: Int = 2000) {
    self.month = month
    self.day = day
    self.year = year
  }
  
  private func isValidDate(month: Int, day: Int, year: Int) -> Bool {
    let _days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    if (day < 1 || month < 1 || month > 12 || year < 1 || day > _days[month - 1]) {
      return false
    }
    return true;
  }
  
  mutating func input(){
    while true {
      print("Enter a date (format: MM/DD/YYYY):")
      if let userInput = readLine() {
        let _inputArray =  userInput.components(separatedBy: "/")
        let _month      = Int(_inputArray[0])
        let _day        = Int(_inputArray[1])
        let _year       = Int(_inputArray[2])
        if (_inputArray.count == 3 && isValidDate(month: _month!, day: _day!, year:_year!)){
          set(month: _month!, day: _day!, year: _year!)
          return
        }else{
          print("Invalid date. Please try again.")
        }
      }
    }
  }
  
  mutating func increment(_ days: Int = 1) {
    let _currentDate = DateComponents(year: year, month: month, day: day)
    var _newDate = Calendar.current.date(from: _currentDate)!
    _newDate = Calendar.current.date(byAdding: .day, value: days, to: _newDate)!
    let _year = Calendar.current.component(.year, from: _newDate)
    let _month = Calendar.current.component(.month, from: _newDate)
    let _day = Calendar.current.component(.day, from: _newDate)
    set(month: _month, day: _day, year: _year)
  }
  
  mutating private func set (month: Int, day: Int, year: Int) {
    self.month = month
    self.day = day
    self.year = year
  }
  
  mutating func setFormat(_ newFormat: DateFormat) {
    self.dateFormat = newFormat
  }
  
  mutating func show(){
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "M/d/yyyy"
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
    let date = dateFormatter.date(from: "\(month)/\(day)/\(year)")
    dateFormatter.dateFormat = dateFormat.rawValue
    print(dateFormatter.string(from: date!))
  }
  
  static func <(lhs: Date, rhs: Date) -> Bool {
    let calendar = Calendar.current
    let lhsDate = calendar.date(from: DateComponents(year: lhs.year, month: lhs.month, day: lhs.day))!
    let rhsDate = calendar.date(from: DateComponents(year: rhs.year, month: rhs.month, day: rhs.day))!
    return lhsDate < rhsDate
  }
  
  static func ==(lhs: Date, rhs: Date) -> Bool {
    return lhs.year == rhs.year && lhs.month == rhs.month && lhs.day == rhs.day
  }
  
  var description: String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "M/d/yyyy"
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
    let date = dateFormatter.date(from: "\(month)/\(day)/\(year)")
    dateFormatter.dateFormat = dateFormat.rawValue
    return dateFormatter.string(from: date!)
  }
}

enum DateFormat: String {
  case standard  = "M/d/yyyy"
  case two = "MM/dd/yy"
  case long = "MMMM d, yyyy"
}

