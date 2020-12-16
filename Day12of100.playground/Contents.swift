// Optionals, Handling Missing Data

import UIKit

var age: Int? = nil
var test: Int? = nil
age = 38
test = 420

//Unwrapping the optional

var name: String? = nil
name = "Angelina"

if let unwrapped = name {
    print("\(unwrapped.count) letters")
} else {
    print("Missing name.")
}

// Unwrapping with Guard

func greet(_ name: String?) {
    guard let unwrapped = name else {
        print("You didn't provide a name!")
        return
    }
    print("Hello, \(unwrapped)!")
}

greet(nil)
greet("Jackson")

// Force unwrapping

let str = "5"
let num = Int(str)!

//Implicity wrapped optionals

let ages: Int! = nil
//this unwraps and you do not need to use if let or guard let to unwrap, this will need a value by the time its needed otherwise it will crash

// Nil Coalseing

func username(for id: Int) -> String? {
    if id == 1 {
        return "Taylor Swift"
    } else {
        return nil
    }
}

let user = username(for: 15) ?? "Anonymous"

// Optional chaining

let names = ["John", "Paul", "George"]

let beatle = names.first?.uppercased()


//optional try

enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }
    return true
}

do {
    try checkPassword("password")
    print("That password is good")
} catch {
    print("You can't use that password")
}

if let result = try? checkPassword("password"){
    print("Result was \(result)")
} else {
    print("D.oh")
}

try! checkPassword("sekrit")
print("OK!")

// Failable initializers

let strs = "5"
let nums = Int(strs)

struct Person {
    var id: String
    
    init?(id: String){
        if id.count == 9{
            self.id = id
        } else {
            return nil
        }
    }
}

// Typecasting

class Animal { }
class Fish: Animal { }

class Dog: Animal {
    func makeNoise() {
        print("Woof!")
    }
}

let pets = [Fish(), Dog(), Fish(), Dog()]

for pet in pets {
    if let dog = pet as? Dog {
        dog.makeNoise()
    }
}
