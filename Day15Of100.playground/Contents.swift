import UIKit

// Properties

struct Person {
    var clothes: String {
        willSet{
            updateUI(msg: "I'm changing from \(clothes) to \(newValue)")
        }
        
        didSet {
            updateUI(msg: "I just changed from \(oldValue) to \(clothes)")
        }
    }
    var shoes: String
    var age: Int
    
    var ageInDogYears: Int {
        get {
            return age * 7
        }
    }
    
    func describe() {
        print("I like wearing \(clothes) with my \(shoes)")
    }

}

func updateUI(msg: String){
    print(msg)
}

var angelina = Person(clothes: "Hoodies", shoes: "Pinguboos", age: 21)
let other = Person(clothes: "short skirts", shoes: "high heels", age: 99)
print(angelina.describe())

print(angelina.ageInDogYears)
angelina.clothes = "polarboos"

// Static Properties and Methods

struct TaylorFan {
    static var favouriteSong = "Shake it Off"
    
    var name: String
    var age: Int
}

let fan = TaylorFan(name: "James", age: 26)
print(TaylorFan.favouriteSong)

// Access Control, Public (everyone can read and write the property), internal (only your swift code can read/write the property), filePrivate (Same file as the type can read/write), Private (only available inside the methods that belong to the type or its extension


class JamesFan {
    private var name: String?
    fileprivate var age: Int?
}

// Polymorphism and Typecasting

class Album {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func getPerformance() -> String {
        return "The album \(name) sold lots"
    }
}

class StudioAlbum: Album {
    var studio: String
    
    init(name: String, studio: String) {
        self.studio = studio
        super.init(name: name)
    }
    
    override func getPerformance() -> String {
        return "The studio album \(name) sold lots"
    }
}

class LiveAlbum: Album {
    var location: String
    
    init(name: String, location: String) {
        self.location = location
        super.init(name: name)
    }
    
    override func getPerformance() -> String {
        return "The live album \(name) sold lots"
    }
}


var taylorSwift = StudioAlbum(name: "Taylor Swift", studio: "The Castles Studio")
var fearless = StudioAlbum(name: "Fearless", studio: "Aimeeland Studio")
var iTunesLive = LiveAlbum(name: "iTunes Live from SoHo", location: "New York")

var allAlubms: [Album] = [taylorSwift, fearless]

for album in allAlubms {
    print(album.getPerformance())
}

//Typecasting

for album in allAlubms {
    let studioAlbum = album as? StudioAlbum
}

for album in allAlubms {
    print(album.getPerformance())
    if let studioAlbum = album as? StudioAlbum {
        print(studioAlbum.studio)
    } else if let liveAlbum = album as? LiveAlbum {
        print(liveAlbum.location)
    }
}

for album in allAlubms {
    print(album.getPerformance())
    
    let studioAlbum = album as! StudioAlbum
    print(studioAlbum.studio)
}

// OR

for album in allAlubms as! [StudioAlbum] {      // MAKE SURE WHEN USING THIS IT IS CORRECT OTHERWISE WILL CRASH
    print(album.getPerformance())
    print(album.studio)
}

for album in allAlubms as? [LiveAlbum] ?? [LiveAlbum]() {
    print(album.getPerformance())
    print(album.location)
}
// This means try and convert them into items of the LiveAlbum array and print their locations or if that fails, just create an empty LiveAlbums Array and do nothing.

let number = 5

let text = String(number)
print(text)


// CLOSURES DUN DUN DUN

let vw = UIView()
UIView.animate(withDuration: 0.5, animations: {
    vw.alpha = 0
})

UIView.animate(withDuration: 0.5) {
    vw.alpha = 0
}
