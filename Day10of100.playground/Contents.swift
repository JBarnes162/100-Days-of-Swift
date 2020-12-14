// Classes and Inheritance

// You must always initialise properties of a class

class Dog {
    var name: String
    var breed: String
    
    init(name: String, breed: String) {
        self.breed = breed
        self.name = name
    }
    
    func makeNoise() {
        print("Woof!")
    }
}

let poppy = Dog(name: "Poppy", breed: "Labrador")

// Class Inheritance
// This inherits all of the properties from dog but then initialises the breed as Poodle by default
class Pomeranian: Dog {
    
    init(name: String) {
        super.init(name: name, breed: "Pomeranian")
    }
    
}

let qiqi = Pomeranian(name: "Qiqi")
print("\(poppy.name) is a \(poppy.breed) ")
print("\(qiqi.name) is a \(qiqi.breed) and is best doggo ")


// Overriding methods

class Labrador: Dog {
    
    init(name: String) {
        super.init(name: name, breed: "Labrador")
    }
    
    override func makeNoise() {
        print("Yip!")
    }
    
}

let harvey = Labrador(name: "Harvey")
print("\(harvey.name) is a \(harvey.breed)")
harvey.makeNoise()

// Final Classes, these cannot be edited by other developers and must be used in their final state

final class finalExample {
    var finalString: String
    var finalInt: Int
    var finalInt2: Int
    
    init(finalInt: Int, finalInt2: Int, finalString: String) {
        self.finalInt = finalInt
        self.finalInt2 = finalInt2
        self.finalString = finalString
    }
    
    func finalFunc() {
        if self.finalInt >= self.finalInt2{
            print("Great")
        } else {
            print("Not great")
        }
    }
}

let finalClass = finalExample(finalInt: 21, finalInt2: 12, finalString: "Great")
finalClass.finalFunc()

//copying Objects

class Singer {
    var name = "Taylor Swift"
}

var singer = Singer()
print(singer.name)

var singerCopy = singer
singerCopy.name = "Justin Bieber"

print(singer.name)

//Deinits code that is run whenever an instance of a class is destroyed

class Person {
    var name = "John Doe"
    
    init() {
        print("\(name) is alive")
    }
    
    func printGreeting() {
        print("Hello I'm \(name)")
    }
    
    deinit {
        print("\(name) is no more")
    }
}
 
for _ in 1...3 {
    let person = Person()
    person.printGreeting()
 
}

// Mutability

class Performer {
    var name = "Eminem" // this cna be edited unless you use let
}

let eminem = Performer()
eminem.name = "Taylor swift"
print(eminem.name)
