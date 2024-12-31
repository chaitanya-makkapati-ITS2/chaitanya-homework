//
//  area.swift
//  week2
//
//  Created by Chaitanya Makkapati on 12/19/24.
//

import Foundation

// MARKING: - Functions

/// Prints all even numbers in the range from 0 to 20.
func printEvenNumbers() {
    let nums = Array(0...20)
    for num in nums where num % 2 == 0 {
        print(num)
    }
}

/// Counts the number of vowels (a, e, i, o, u) in the provided string.
///
/// - Note: This function ignores the case of the letters.
/// - Complexity: O(n), where n is the length of the string.
func countVowels() {
    let sentence = "The qUIck bRown fOx jumpEd over the lAzy doG"
    let vowels = "aeiou"
    var vowelCount = 0
    
    for char in sentence.lowercased() {
        if vowels.contains(char) {
            vowelCount += 1
        }
    }
    print("Number of vowels: \(vowelCount)")
}

/// Prints a mini multiplication table using two arrays of integers.
///
/// - The format of the output is `<number1> * <number2> = <result>`.
func printMultiplicationTable() {
    let array1 = Array(0...4)
    let array2 = Array(0...4)
    
    for num1 in array1 {
        for num2 in array2 {
            print("\(num1) * \(num2) = \(num1 * num2)")
        }
    }
}

/// Calculates and prints the average of the given optional array of integers.
///
/// - Parameter numbers: An optional array of integers. If `nil`, the function prints an error message.
/// - Complexity: O(n), where n is the number of elements in the array.
func average(of numbers: [Int]?) {
    if let numbers = numbers {
        let sum = numbers.reduce(0, +)
        let avg = Double(sum) / Double(numbers.count)
        print("The average of the values in the array is \(avg).")
    } else {
        print("The array is nil. Calculating the average is impossible.")
    }
}

// MARKING: - Structs

/// Represents a person with a first name, last name, and age.
struct Person {
    /// The first name of the person.
    var firstName: String
    /// The last name of the person.
    var lastName: String
    /// The age of the person.
    var age: Int
    
    /// Prints the details of the person in the format: `Name: <firstName> <lastName>, Age: <age>`.
    func details() {
        print("Name: \(firstName) \(lastName), Age: \(age)")
    }
}

// MARKING: - Classes

/// Represents a student with personal details and grades.
class Student {
    /// The person's details.
    var person: Person
    /// The grades of the student as an array of integers.
    var grades: [Int]
    
    /// Initializes a new student.
    ///
    /// - Parameters:
    ///   - person: A `Person` object containing the student's personal details.
    ///   - grades: An array of integers representing the student's grades.
    init(person: Person, grades: [Int]) {
        self.person = person
        self.grades = grades
    }
    
    /// Calculates the average grade of the student.
    ///
    /// - Returns: A `Double` representing the average grade.
    /// - Complexity: O(n), where n is the number of grades.
    func calculateAverageGrade() -> Double {
        let total = grades.reduce(0, +)
        return Double(total) / Double(grades.count)
    }
    
    /// Prints the student's details along with their average grade.
    ///
    /// The format of the output is:
    /// `Name: <firstName> <lastName>, Age: <age>, GPA: <average grade>`
    func details() {
        let avgGrade = calculateAverageGrade()
        print("Name: \(person.firstName) \(person.lastName), Age: \(person.age), GPA: \(avgGrade)")
    }
}

// MARKING: - Part 2: Above and Beyond

/// Represents a square with a side length.
struct Square {
    /// The length of a side of the square.
    var side: Int
    
    /// Calculates the area of the square.
    ///
    /// - Returns: An `Int` representing the area of the square.
    func area() -> Int {
        return side * side
    }
}

/// Represents a rectangle with length and width.
class Rectangle {
    /// The length of the rectangle.
    var length: Int
    /// The width of the rectangle.
    var width: Int
    
    /// Initializes a new rectangle.
    ///
    /// - Parameters:
    ///   - length: The length of the rectangle.
    ///   - width: The width of the rectangle.
    init(length: Int, width: Int) {
        self.length = length
        self.width = width
    }
    
    /// Calculates the area of the rectangle.
    ///
    /// - Returns: An `Int` representing the area of the rectangle.
    func area() -> Int {
        return length * width
    }
}

// MARKING: - Main Entry Point

/// The main struct containing the program's entry point.
@main
struct Assignment {
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
}
