//
//  main.swift
//  Assignment2
//
//  Created by Derrick Park on 2023-03-03.
//

import Foundation


var d1 = Date()            // January 1, 2000
var d2 = Date(month: 4, day: 10, year: 1992) // April 10, 1992
print(d1.year)     // this is okay
// d1.year = 2002  // this is not okay (compile-error!)
print(d2)

d1.show()
d2.show()

d1.input() // allow user to enter a date for d1
d1.show()  // date must be updated based on the input above

print("--- TWO ----")
d1.setFormat(.two)  // change the format of d1 to long format
d1.show()            // show in two-digi format

print("-------")
d1.setFormat(.long)  // change the format of d1 to long format
d1.show()            // show in long format
print("increment by 100...")
d1.increment(100)
d1.show()
print("-------")
print("increment by 365...")
d1.increment(365)
d1.show()
print("-------")
print("increment by 1...")
d1.increment()
d1.show()
print("-------")

let d3 = Date(month: 12, day: 25, year: 2023); // Dec 25, 2003
let d4 = Date(month: 5, day: 18, year: 2022); // May 18, 2002
print(d3 < d4);


//// and so on... Add your own tests to fully test the functionalities.
