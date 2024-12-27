//
//  week2App.swift
//  week2
//
//  Created by Chaitanya Makkapati on 12/12/24.
//

import SwiftUI

@main
struct week2App: App {
    
    /// The main entry point of the program. Runs all tasks sequentially.
    static func main() {
        print("Running Part 1:")
        
        print("a) Even Numbers:")
        printEvenNumbers()
        
        print("\nb) Count Vowels:")
        countVowels()
        
        print("\nc) Multiplication Table:")
        printMultiplicationTable()
        
        print("\nd) Average Calculation:")
        let nums = Array(0...20)
        average(of: nums)
        average(of: nil)
        
        print("\ne) Person Struct:")
        let person = Person(firstName: "Chaitanya", lastName: "Makkapati", age: 25)
        person.details()
        
        print("\nf) Student Class:")
        let student = Student(person: person, grades: [94, 99, 81, 100, 79])
        student.details()
        
        print("\nPart 2 - Above and Beyond:")
        var square1 = Square(side: 4)
        var square2 = square1
        square2.side = 5
        print("Area: square1 - \(square1.area()) square2 - \(square2.area())")
        
        var rectangle1 = Rectangle(length: 4, width: 4)
        var rectangle2 = rectangle1
        rectangle2.length = 5
        print("Area: rectangle1 - \(rectangle1.area()) rectangle2 - \(rectangle2.area())")
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
