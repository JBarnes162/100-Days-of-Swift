// Day 4, loops, loops and more loops

let numbers = 1...10

for number in numbers {
    print("The number is \(number)")
}

let albums = ["Forest Hill Drive", "Good Kid Maad City", "Dystopia"]

for album in albums {
    print("This album is on Apple Music: \(album)")
}

print("Players gonna ")

for _ in 1...5 {
    print ("play")
}

// While loops

var number = 1

while number <= 20 {
    print(number)
    number += 1
}
print("Ready or not, here I come.")

// Repeat Loops not common it's a do while

var number1 = 1

repeat {
    print(number)
    number += 1
} while number <= 20

print("Ready or not, I'm coming again")


repeat {
    print("This is false")
} while false

// Exiting loops break key word.

var countDown = 10

while countDown >= 0 {
    print(countDown)
    
    if countDown == 4 {
        print("LET'S GO NOW")
        break
    }
    
    countDown -= 1
}

// Exiting nested loops

outerLoop: for i in 1...10 {
    for j in 1...10 {
        let product = i * j
        print("\(i) * \(j) is \(product)")
        
        if product == 50 {
            print("It's a bullseye")
            break outerLoop
        }
    }
}

// Skipping items

for i in 1...10 {
    if i % 2 == 1 {
        continue
    }
    
    print(i)
}

// Infinite Loops

var counter = 0

while true {
    print(" ")
    counter += 1
    
    if counter == 273 {
        break
    }
}


