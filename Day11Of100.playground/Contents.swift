// Protocol

protocol Identifiable {
    var id: String { get set }
}

struct user: Identifiable {
    var id: String                  //Getting
}

func displayID(thing: Identifiable){
    print("My ID is \(thing.id)")   //Setting
}

// Protocol Inheritance

protocol Payable {
    func calculateWages () -> Int
}

protocol NeedsTraining {
    func study()
}

protocol HasVacation {
    func takeVacation(days: Int)
}

protocol Employee: Payable, NeedsTraining, HasVacation { }

//Now...
//This inherits all of these different protocols with just one protocol, Employee
class Work: Employee {
    func calculateWages() -> Int {
        return 3*4
    }
    
    func study() {
        print("You have to study")
    }
    
    func takeVacation(days: Int) {
        10 - days
    }
}

// Extensions

extension Int {
    func squared() -> Int {
        return self * self
    }
}

var testVar = 3

testVar.squared()

extension Int {
    var isEven: Bool {
        return self % 2 == 0
    }
}

testVar.isEven
testVar = 2
testVar.isEven

// Protocol oriented programming - crafting code around protocols and protocol extensions

protocol Identified {
    var id: String {get set}
    func identify()
}

extension Identified {
    func identify() {
        print("My ID is \(id)")
    }
}

struct User: Identified {
    var id: String
}

let user1 = User(id: "1234")
user1.identify()


