
// Functions

func favouriteAlbum (is albumName: String) {
    print("My favourite album is \(albumName)")
}

favouriteAlbum(is: "2014 Forest Hill Drive")

func printAlbumRelease(name: String, year: Int) {
    print("\(name) was released in \(year)")
}

printAlbumRelease(name: "2014 Forest Hill Drive", year: 2014)

// Natural function calls

//func countLettersInString(string: String) {
//    print("The string \(string) has \(string.count) letters")
//}
//
//countLettersInString(string: "Hello")

func countLetters(in string: String) {
    print("The string \(string) has \(string.count) letters")
}

countLetters(in: "Hello")

// Function returns

func albumIsTaylors(name: String) -> Bool {
    if name == "Taylor Swift" {return true}
    if name == "Fearless" {return true}
    return false
}

if albumIsTaylors(name: "Fearless") {
    print("That's album is hers!")
} else {
    print("Boo!")
}

// Optionals

func getHaterStatus(weather: String) -> String? {
    if weather == "Sunny" {
        return nil
    } else {
        return "Hate"
    }
}

var status = getHaterStatus(weather: "Raining")

// Optional Unwrapping

func takeHaterAction(status: String) {
    if status == "Hate" {
        print("Hating")
    }
}

if let haterStatus = getHaterStatus(weather: "Rainy") {
    takeHaterAction(status: haterStatus)
}

// Optional Chaining

func albumRelease(year: Int) -> String? {
    switch year {
    case 2006: return "Taylor Swift"
    case 2008: return "Fearless"
    default: return nil
    }
}

let album = albumRelease(year: 2006)?.uppercased()
//print("The album is \(album)")

// Nil Coalescing

let album2 = albumRelease(year: 2006) ?? "unknown"
print("The album is \(album2)")

// Enums - Defining your own data type in Swift

enum WeatherType {
    case sun
    case cloud
    case rain
    case wind(speed: Int)
    case snow
}

func getWeatherStatus(weather: WeatherType) -> String? {
    switch weather {
    case .sun:
        return nil
    case .wind(let speed) where speed < 10:
        return "dislike"
    case .cloud, .wind:
        return "meh"
    case .rain:
        return "haiting"
    case .snow:
        return "be jolly"
    }
}

getWeatherStatus(weather: .cloud)

// Structs - Complex data types made up of multiple values that can be used in multiple instances around the code

struct Persons {
    
    // Variables
    var clothes: String
    var shoes: String
    
    // Methods
    func describe() {
        print("I like wearing\(clothes) with \(shoes)")
    }
}

let taylor = Persons(clothes: "T-Shirt", shoes: "Sneakers")
let other = Persons(clothes: "short skirts", shoes: "High Heels")

print(taylor.clothes)
print(other.shoes)

var taylorCopy = taylor
taylorCopy.shoes = "Flip flops"

print(taylor)
print(taylorCopy)

// Classes - Complex data types, difference: you have to initialise yourself not by default, you can base a class on another class, creating an instance of a class is an object.

class Person {              //Either make them optional (clumsy), provide default value (waste of time), write your own initializer (correct)
    var clothes: String
    var shoes: String

    init(clothes: String, shoes: String) {
        self.clothes = clothes
        self.shoes = shoes
    }
}

@objcMembers class Singer { // Xcode will let you know when to this is an issue
    var name: String
    var age: Int
    
    init(name: String, age: Int){
        self.name = name
        self.age = age
    }
    
    func sing() {
        print("La la la la")
    }
}

class CountrySinger: Singer {
    override func sing() {
        print("Trucks, guitars and liquor")
    }
}

class HeavyMetalSinger: Singer {
    var noiseLevel: Int
    
    init(name: String, age: Int, noiseLevel: Int){
        self.noiseLevel = noiseLevel
        super.init(name: name, age: age)
    }
    
    override func sing() {
        print("Good voice")
    }
}

var taylorS = CountrySinger(name: "Taylor", age: 25)

taylorS.name
taylorS.age
taylorS.sing()


