
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
print("The album is \(album)")

// Nil Coalescing

let album2 = albumRelease(year: 2006) ?? "unknown"
print("The album is \(album2)")

