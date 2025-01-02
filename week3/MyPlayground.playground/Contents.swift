import Foundation

/// Calculates the average of an array of integers.
/// - Parameter numbers: An array of integers.
/// - Returns: The average of the array as a `Double`.
func average(of numbers: [Int]) -> Double {
    return Double(numbers.reduce(0, +)) / Double(numbers.count)
}

/// Calculates the average of an array of doubles.
/// - Parameter numbers: An array of doubles.
/// - Returns: The average of the array as a `Double`.
func average(of numbers: [Double]) -> Double {
    return numbers.reduce(0, +) / Double(numbers.count)
}

/// Calculates the average of an array of integers, including an extra integer.
/// - Parameters:
///   - numbers: An array of integers.
///   - extra: An additional integer to include in the calculation.
/// - Returns: The average of the array with the extra value as a `Double`.
func average(of numbers: [Int], with extra: Int) -> Double {
    let total = numbers.reduce(0, +) + extra
    return Double(total) / Double(numbers.count + 1)
}

/// Represents various types of animals.
enum Animal {
    case cow, dog, cat, sheep, chicken
}

/// Returns the sound made by a specific animal.
/// - Parameter animal: The animal for which the sound is needed.
/// - Returns: A string describing the sound made by the animal.
func theSoundMadeBy(_ animal: Animal) -> String {
    switch animal {
    case .cow:
        return "A cow goes moooo."
    case .dog:
        return "A dog goes woof."
    case .cat:
        return "A cat goes meow."
    case .sheep:
        return "A sheep goes baa."
    case .chicken:
        return "A chicken goes cluck."
    }
}

print(theSoundMadeBy(.cow))
print(theSoundMadeBy(.dog))

/// Filters and returns all even numbers from an array of integers.
/// - Parameter numbers: An array of integers.
/// - Returns: An array containing only even integers.
func evenNumbersArray(from numbers: [Int]) -> [Int] {
    return numbers.filter { $0 % 2 == 0 }
}

/// Calculates the sum of an array of optional integers, ignoring `nil` values.
/// - Parameter numbers: An array of optional integers.
/// - Returns: The sum of all non-`nil` values in the array.
func sumOfArray(_ numbers: [Int?]) -> Int {
    return numbers.compactMap { $0 }.reduce(0, +)
}

/// Returns the common elements between two arrays as a set.
/// - Parameters:
///   - array1: The first array of integers.
///   - array2: The second array of integers.
/// - Returns: A set containing integers common to both arrays.
func commonElementsSet(_ array1: [Int], _ array2: [Int]) -> Set<Int> {
    return Set(array1).intersection(array2)
}

/// Represents a square with a side length and an area.
struct Square {
    /// The length of one side of the square.
    var sideLength: Double
    /// The computed area of the square.
    var area: Double {
        return sideLength * sideLength
    }
}

let square = Square(sideLength: 4.0)
print("Area of square: \(square.area)")

/// A protocol representing a geometric shape.
protocol Shape {
    /// Calculates the area of the shape.
    /// - Returns: The area of the shape as a `Double`.
    func calculateArea() -> Double
}

/// An extension of the `Shape` protocol for volume calculations.
extension Shape {
    /// Calculates the volume of the shape. Defaults to 0 for shapes without volume.
    /// - Returns: The volume of the shape as a `Double`.
    func calculateVolume() -> Double {
        return 0.0
    }
}

    // Structs were moved from inside the protocol extension to here
    struct Circle: Shape {
        var radius: Double
        func calculateArea() -> Double {
            return Double.pi * radius * radius
        }
    }

    struct Rectangle: Shape {
        var length: Double
        var width: Double
        func calculateArea() -> Double {
            return length * width
        }
    }

    struct Sphere: Shape {
        var radius: Double
        func calculateArea() -> Double {
            return 4 * Double.pi * radius * radius
        }
        func calculateVolume() -> Double {
            return (4 / 3) * Double.pi * pow(radius, 3)
        }
    }


let circle = Circle(radius: 5.0)
print("Area of circle: \(circle.calculateArea())")

let rectangle = Rectangle(length: 4.0, width: 6.0)
print("Area of rectangle: \(rectangle.calculateArea())")

let sphere = Sphere(radius: 3.0)
print("Area of sphere: \(sphere.calculateArea())")
print("Volume of sphere: \(sphere.calculateVolume())")
