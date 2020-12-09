// Closures

let driving = {
    print("I'm driving in my car")
}

driving()

//Accepting parameters in a closure

let placing = { (place: String) in
    print("I'm driving my car to \(place)")
}

placing("London")

//Returning parameters in a closure

let flying = {(place: String) in
    print("I'm going to \(place) in my plane")
}

let flyingWithReturn = { (place: String) -> String in
    return "I'm going to \(place) in my plane"
}

let message = flyingWithReturn("London")
print(message)

//Closures as parameters

let running = {
    print("I'm driving in my shoes")
}

func travel (action: () -> Void) {
    print("I'm getting ready to go.")
    action()
    print("I have arrived!")
}

travel(action: running)
travel(action: driving)


// Trailing closure syntax

func travel1 (action: () -> Void) {
    print("I'm getting ready to go.")
    action()
    print("I have arrived!")
}

travel1 { //because no parameters, do not need parenthesis otherwise would be travel1()
    print("I'm driving in my bus")
}

// or

func animate(duration: Double, animations:() -> Void) {
    print("Starting a \(duration) second animation...")
    animations()
}

//animate(duration: 3, animations: {
//    print("Fade out the image")
//})

// ^^ This can become

animate(duration: 3) {
    print("Fade out the image")
}
