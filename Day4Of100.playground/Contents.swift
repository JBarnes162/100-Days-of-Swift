// Functions

func printHelp() {
    let message = """
    Welcome to MyApp!
    
    Run this app inside a directory of images
    MyApp will resize them all into thumbnails
    """

    print(message)
    
    }

printHelp()

// Functions accepting parameters

func square(number: Int) {
    print(number * number)
}

square(number: 4)

// Returning from functions

func squared(number: Int) -> Int{
    return number*number
}

let result = squared(number: 8)
print(result)

// Parameter labels

func sayHello(to name: String) {
    print("hello, \(name)!")
}

sayHello(to: "Jackson")

// Omitting parameter labels

func greet (_ person: String) {
    print("Hello, \(person)!")
}

greet("Jackson")

// Default parameters

func greeting(_ person: String, nicely: Bool = true) {
    if nicely == true {
        print("Hello, \(person)!")
    } else {
        print("Oh no, it's \(person)")
    }
}

greeting("Jackson", nicely: false)

// Variadic functions -- they accept any number of the same variable parameter in one call

func squareNumbers(numbers:Int...) {
    for number in numbers{
        print("\(numbers) square is \(number * number)")
    }
    
}

squareNumbers(numbers: 1, 2, 3, 4, 5, 6)

// Throwing functions

enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }
    return true
}

// Running these throw functions

do {
    try checkPassword("password")
    print("that password is good!")
} catch {
    print("That password is to obvious")
}

// input parameters

func doubleInPlace(number: inout Int) {
    number *= 2
}

var myNum = 10
doubleInPlace(number: &myNum)
