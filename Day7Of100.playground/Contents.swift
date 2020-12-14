// Closures part II
// Using closures as parameters when they accept parameters

func travel(action: (String) -> Void) {
    print("I'm getting ready to go.")
    action("London")
    print("I arrived.")
}

travel{ (place: String) in
    print("I'm going to \(place) in my car")
}

// Using closures as parameters when they return values

func buildCar (engine: String, speed: ((Int) -> Void)) {
    print("engine type: \(engine)")
    speed(100)
    print("I would rather a Mercedes")
}

buildCar(engine: "Ferrari") { (pinalinapoopface: Int) in
    print("I am going \(pinalinapoopface) kph")

}

// Using closures as parameters when they return values

func buildCar1 (engine: String, action: ((Int) -> String)) {
    print("Returning a value with a closure")
    print("engine type: \(engine)")
    let description = action(100)
    print(description)
    print("I would rather a Mercedes")
}

buildCar1(engine: "Ferrari") { (speed: Int) -> String in
    
    return "I am going \(speed) kph"

}

//shorthand call of above

buildCar1(engine: "Ferrari") { speed in
    
    "Short I am going \(speed) kph"

}

// or

buildCar1(engine: "Ferrari") {
    
    "Shorter I am going \($0) kph"

}

//closure with multiple variables

func travelling (action: (String, Int) -> String) {
    print("Multiple variables")
    print("I am ready to go.")
    let description = action("London", 60)
    print(description)
    print("I made it")
}

travelling {
    "I am going to \($0) at \($1) miles per hour"
}

//returning a closure from a function which requires a tring and returns void

func travels () -> (String) -> (Void) {
    return {
        print("I'm going to \($0)")
    }
}

let result = travels()
result("London")

let result2 = travels()("Cardiff")

//Capturing values

func travels1 () -> (String) -> (Void) {
    var counter = 1
    return {
        print("\(counter). I'm going to \($0)")
        counter += 1
    }
}

let result3 = travels1()
result3("London")
result3("London")
result3("London")
result3("London")
result3("London")
result3("London")
result3("your MOM'S HOUSE OMEGALUL")

func decisionMaking(userNumber: Int, multiplyBy: Int, closureNumber: () -> Int) {
    var usersNumber = userNumber
    switch multiplyBy {
    case 2:
        print("Current number: \(usersNumber)")
        print("Your number doubled is:")
        usersNumber *= 2
        print("New number = \(usersNumber)")
        let closuredNumber = closureNumber() * usersNumber
        print("Closured Number = \(closuredNumber)")
        print("Here is your number closured!! \(closuredNumber)")
    case 3:
        print("Your number doubled is:")
        print("\(usersNumber * 3)")
        let closuredNumber = closureNumber()
        print("Here is your number closured!! \(closuredNumber * usersNumber)")
    case 4:
        print("Your number doubled is:")
        print("\(usersNumber * 4)")
        let closuredNumber = closureNumber()
        print("Here is your number closured!! \(closuredNumber * usersNumber)")
    default:
        print("Not a great number: \(usersNumber)")
    }
}

decisionMaking(userNumber: 1, multiplyBy: 2) {
    
    return 5
    
}

let babiesName = "Angelina"

print("My pooties name is \(babiesName)")
