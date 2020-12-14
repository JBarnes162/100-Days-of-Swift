//Structs

struct Sport {
    var name: String
    var isOlympicSport: Bool
    
    var olymipcStatus: String {
        if isOlympicSport {
            return "\(name) is an olympic sport"
        } else {
            return "\(name) is not an olympic sport"
        }
    }
}

var chessBoxing = Sport(name: "Chess Boxing", isOlympicSport: false)
print(chessBoxing.olymipcStatus)


// Property observer

struct Progress {
    var task: String
    var amount: Int {
        didSet {
            if amount == 100 {
                print("\(task) is now complete!")
            } else {
                print("\(task) is now \(amount)% complete")
            }
        }
    }
    
    
}

var progress = Progress(task: "Loading data", amount: 0)

progress.amount = 20
progress.amount = 40
progress.amount = 60
progress.amount = 80
progress.amount = 100

// Methods

struct City {
    var population: Int
    
    
    func collectTaxes() -> Int {
        return population * 1000
    }
}

let london = City(population: 9_000_000)
london.collectTaxes()

// Mutating methods

struct Person {
    var name: String
    
    mutating func makeAnonymous() {
        name = "Anonymous"
    }
}

var person = Person(name: "Jackson")

person.makeAnonymous()
print(person)

// Properties and methods of strings

let string = "Do or do not, there is no try"

print(string.count)
print(string.hasPrefix("Do"))
print(string.uppercased())
print(string.sorted())
print(string.isEmpty)

// Properties and methods of arrays

var toys = ["Woody"]
print(toys.count)
print(toys.append("Buzz"))
toys.firstIndex(of: "Buzz")

toys.capacity

toys.contains("Action Man")


if toys.contains("Action Man") == false {
    toys.append("Action Man")
    } else {
    print(toys)
}

toys.contains("Action Man")

//Initialisers

struct User {
    var username:String
    
    init() {
        username = "Anonymous"
        print("Creating a new user")
    }
}

var user = User()

user.username = "Jbarnes"
print(user.username)

// Referring to current instance

struct People {
    var name: String
    
    init(name:String) {
        print("\(name) was born")
        self.name = name
    }
}

// Lazy properties - creates properties only when needed

struct FamilyTree {
    init() {
        print("Creating family tree")
    }
}

struct Family {
    var name: String
    lazy var familyTree = FamilyTree()
    
    init(name: String) {
        self.name = name
    }
}

var ed = Family(name: "Jackson")
ed.familyTree


// Static properties and methods

struct Student {
    static var classSize = 0
    var name: String
    
    
    init(name: String) {
        self.name = name
        Student.classSize += 1
    }
}

let john = Student(name: "John")
let taylor = Student(name: "Taylor")
let angelina = Student(name: "Angelina")
Student.classSize


// Access control

struct member {
    private var id: String
    var memberName: String
    
    init (id: String, memberName: String) {
        self.id = id
        self.memberName = memberName
    }
    
    func identify() -> String {
        return "\(self.memberName)'s member id is: \(self.id)"
    }
}


let jb = member(id: "12345", memberName: "Jackson")
print(jb.identify())
