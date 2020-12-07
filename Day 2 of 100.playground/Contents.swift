import UIKit

//Arrays

let john = "John Lennon"
let paul = "Paul McCartney"
let george = "George Harrison"
let ringo = "Ringo Starr"

let beatles = [john, paul, george, ringo]

beatles[1]

//Sets
let colours = Set(["red", "green", "blue"])
let colours2 = Set(["red", "green", "blue", "red", "green"]) // still possible but is just ignored

//Tuples

var name = (first: "Taylor", last: "Swift")
name.0
name.last
name.first
name.1

//Arrays vs sets vs tuples

//If you need a specific, fixed collection of related values where each item has a precise position or name, use tuple.

let address = (house: 555, street: "Downing Street", city: "london")

//If you need a collection of values that must be unique or you need to be able to check whether a specifc item is in there extermely quickly, use a set
let set = Set(["aardvark", "astronaut", "azalea"])

//If you need a collection that can contain duplicates and the order of the items matter, use an array.
let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]

//Dictionaries

let heights = [
    "Taylor Swift": 1.78,
    "Ed Sheeran": 1.73
]

heights["Taylor Swift"]

heights["Jackson"] // proivdes nil by default

// Can give a dictionary a default value to show rather than nil

heights["Jackson", default: 0.00]

//Collections

var teams = [String: String]()
teams["Paul"] = "Red"

//decalring empty arrays and sets

var results = [Int]()

var words = Set<String>()
var numbers = Set<Int>()
var scores = Dictionary<String, Int>()

//Enumerations
let results1 = "failure"
let results2 = "failed"
let results3 = "fail"

enum Result {
    case success
    case failure
}

let result4 = Result.failure
let result5 = Result.success

let toe = "apple"
let toe2 = "apples"

enum Fruits {
    case apple
    case banana
}

//Associated Values

enum Activity {
    case bored
    case talking(topic:String)
    case running(destination:String)
    case singing(volume:Int)
}

Activity.talking(topic: "Football")

//Raw Values

enum Planet: Int {
    case mercury = 1
    case venus
    case earth
    case mars
}

let earth = Planet(rawValue: 2)









//example of array
let arrayTest = [1,2,3,4,5]

//example of Set
let setTest = Set([1,2,3,4,5])

//example of tuple
let tupleTest = (first:"Hello", second:"World")
tupleTest.first
tupleTest.second
//example of dictionary
var dictionaryTest = [
    1 : "Twit",
    2 : "Twat"
]

dictionaryTest[2]

//example of enum

enum Classes {
    case Paladin(Type: String)
    case Warrior(Type: String)
    case Warlock(Type: String)
    case Hunter(Type:String)
}

Classes.Hunter(Type: "Range")
let jackson = Classes.Paladin(Type: "Melee")
jackson








