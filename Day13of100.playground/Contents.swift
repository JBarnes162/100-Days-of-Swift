import UIKit

// Variables and Constants review

var dataStoreChange: Int
let dataStore: Int

// Constants are important as it prevents mistakes.
// Constants also allows Xcode optimize

var name = "Tim McGraw"
name = "Romeo"

name = name + "TimMcgraw"

//let constName = "John"        This will give errors
//constName = "Jackson"         It is recomended to use constants when possible, Xcode will prompt you if a var is never changed to change to a Const

// Types of Data

var number: Int
let firstName: String
var trueFalse: Bool
var biggerNumber: Double
var biggestNumber: Float

// Recommendation is to always use double as it is most accurate

var latitude: Double
latitude = 36.166667

var longitude: Float
longitude = -86.783333
longitude = -186.783333
longitude = -1286.783333
longitude = -12386.783333
longitude = -123486.783333

latitude = -86.783333
latitude = -186.783333
latitude = -1286.783333
latitude = -12386.783333
latitude = -123486.783333

var stayOutTooLate: Bool
stayOutTooLate = true

var nothingInBrain: Bool
nothingInBrain = false

var missABeat: Bool
missABeat = false

//It is always preferred for if you can usetype inference when declaring variables/constants, let age = 25 for example rather than let age: Int

// Operators

var a = 10
a += 1
a -= 1
a *= a

var c = 1.1
var d = 2.2
var e = c + d

c > 3
c >= 3
c > 4
c < 4
c <= 4

var namer = "Tim McGraw"
namer == "Tim McGraw"
namer == "Tim Mcgraw"

var outTooLate = true
outTooLate
!outTooLate

outTooLate != false

// String Interpolation

print("\(namer) is some weird ass name")
var age = 23
"Your age is \(age) and in 2 years you will be \(age + 2)"

// Arrays

var evenNumber = [2, 4, 6, 8]
var songs: [String] = ["Shake it Off", "You belong with me", "Back to December"]
var anyArr: [Any]
songs[0]
songs[1]
songs[2]

print("Best song is \(songs[0])")

type(of: songs)


var creatingArray: [String] = [] //or var creatingArray = [String]()
var songs1: [String] = ["Wet Dreamz", "No Role Models"]

let both = songs + songs1
print(both)

// Dictionaries

var person = ["first": "Taylor",
              "middle": "Alison",
              "last": "Swift",
              "month": "December",
              "website": "taylorswift.com"]

person["middle"]

// conditional statments

var action: String
var person1 = "hate"

if person1 == "hater" {
    action = "hate"
}

var action1: String
var isOutTooLate = true
var contentsOfBrain = true

if isOutTooLate && contentsOfBrain {
    action = "cruise"
}

if isOutTooLate || contentsOfBrain {
    action = "cruise"
}

if !isOutTooLate && !contentsOfBrain {
    action = "cruise"
}

// Loops

for i in 1...10{
    print("\(i) x 10 is \(i * 10)")
}

var str = "Fakers gonna..."

for _ in 1...5 {
    str += "fake"
}

print(str)

var listOfSongs = ["song1", "song2", "song3"]

for song in songs {
    print("my favourite song is \(song)")
}

var people = ["players", "haters", "heart-breakers", "fakers"]
var actions = ["play", "hate", "break", "fake"]

for i in 0..<people.count {
    print("\(people[i]) gonna \(actions[i])")
}

for i in 0..<people.count {
    var str1 = "\(people[i]) gonna "

    for _ in 1...5 {
        str1 += "\(actions[i])"
    }
    print(str1)
}

var counter = 0

while true {
    print("Counter is now \(counter)")
    counter += 1

    if counter == 556 {
        break
    }
}

for song in listOfSongs {
    if song == "song1" {
        continue
    }

    print("My favourite song is \(song)")
}

// peenie you fell asleep //
// i wuv you so much //
// you're doing amazing baby, i'm so proud of you //
// I LOVE YOOUUU MY PEEN PEEN //

// Switch Case

let liveAlbums = 2

switch liveAlbums {
case 0...1:
    print("You're just starting out")

case 2...3:
    print("You're a rising star!!")
    print("You just released iTunes Live From SoHo")

case 3...4:
    print("You're world famous!")
    print("You just released Speak Now World Tour")

default:
    print("Have you done something new?")
}

