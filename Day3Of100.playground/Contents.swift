import UIKit

// Basic operators

let firstScores = 12
let secondScores = 4

let total = firstScores+secondScores
let difference = firstScores-secondScores
let product = firstScores*secondScores
let divided = firstScores/secondScores
let remainder = 13 % secondScores

// Operator overloading
let meaningOfLife = 42
let doubleMeaning = 42 + 42
let fakers = "Fakers gonna "
let action = fakers + "fake"

let firstHalf = ["John", "Paul"]
let secondHalf = ["George", "Ringo"]
let full = firstHalf + secondHalf

// Compound operators

var score = 95
score -= 5

var quote = "The rain in Spain falls mainly on the "
quote += "Spaniards"

//Comparison Operators

let firstScore = 6
let secondScore = 4

firstScore == secondScore
firstScore != secondScore

firstScore < secondScore
firstScore >= secondScore

// Conditions

let firstCard = 11
let secondCard = 10

if firstCard + secondCard == 2 {
    print("Aces! Lucky!")
} else if firstCard+secondCard == 21 {
    print("Blackjack!")
} else {
    print("regular cards")
}

// Combining conditions

let age1 = 12
let age2 = 21

if age1 > 18 && age2 > 18{
    print("Both over 18")
} else {
    print("Invalid")
}

if age1 > 18 || age2 > 18 {
    print("One is over 18")
}

// Ternary operator - seems like a waste and not as readable as normal if else comparison

let firstCar = 11
let secondCar = 10
print(firstCar == secondCar ? "Cards are the same" : "Cards are different") // just use if else?

// Switch statements

let weather = "sunny"

switch weather {
case "rain":
    print("Bring an umbrella")
case "snow":
    print("wrap up warm")
case "sunny":
    print("Dress lightly")
default:
    print("Invalid entry")
}

// Range operator

//..< up to and excluding final value
//... up to and including final value

let examScore = 85

switch examScore{
case 0..<50:
    print("You did bad")
case 50...100:
    print("You did great")
default:
    print("Invalid")
}
