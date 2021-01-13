// Observing data across views
//import SwiftUI
//
//class User: ObservableObject {
//    @Published var firstName = "Bilbo"
//    @Published var lastName = "Baggins"
//}
//
//struct SecondView: View {
//    var body: some View {
//        Text("Some view")
//    }
//}
//
//
//
//struct ContentView: View {
//    @ObservedObject private var user = User()
//
//    var body: some View {
//        VStack {
//            Text("Your name is \(user.firstName) \(user.lastName)")
//            TextField("Last name", text: $user.firstName)
//            TextField("Last name", text: $user.lastName)
//        }
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

// Dismissing and viewing new sheets
//import SwiftUI
//
//struct SecondView: View {
//    @Environment(\.presentationMode) var presentationMode
//    var name: String
//    var body: some View {
//        Button("Dismiss") {
//            self.presentationMode.wrappedValue.dismiss()
//        }
//    }
//}
//
//struct ContentView: View {
//    @State private var showingSheet = false
//    var body: some View {
//        Button("Show sheet") {
//            self.showingSheet.toggle()
//        }
//        .sheet(isPresented: $showingSheet) {
//            SecondView(name: "@pina")
//        }
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

//onDelete to delete a list of rows and adding to them etc
//struct ContentView: View {
//    @State private var numbers = [Int]()
//    @State private var currentNumber = 1
//
//    var body: some View {
//        NavigationView {
//        VStack {
//            List {
//                ForEach(numbers, id: \.self){
//                    Text("\($0)")
//                }
//                .onDelete(perform: removeRows)
//            }
//
//            Button("Add number") {
//                self.numbers.append(self.currentNumber)
//                self.currentNumber += 1
//            }
//        }
//        .navigationBarItems(leading: EditButton())
//        }
//}
//
//    func removeRows(at offsets: IndexSet) {
//        numbers.remove(atOffsets: offsets)
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

// Storing data from previously runned instance on the app
//struct ContentView: View {
//    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
//
//    var body: some View {
//        Button("Tap me: \(tapCount)") {
//            self.tapCount += 1
//            UserDefaults.standard.set(self.tapCount, forKey: "Tap")
//        }
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
//Archive Swift objects with Codable
//struct User: Codable {
//    var firstName: String
//    var lastName: String
//}
//
//struct ContentView: View {
//    @State private var user = User(firstName: "Pina", lastName: "lina")
//    var body: some View {
//        Button("Save User") {
//            let encoder = JSONEncoder()
//
//            if let data = try? encoder.encode(self.user){
//                UserDefaults.standard.set(data, forKey: "UserData")
//            }
//        }
//    }
//}
