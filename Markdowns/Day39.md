// Georeader to make any image fit our screen
//struct ContentView: View {
//    var body: some View {
//        VStack {
//            GeometryReader {
//                geo in
//            Image("Example")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: geo.size.width)
//            }
//        }
//    }
//}

//Using Scrollview to scroll through stuff
//struct CustomText: View {
//    var text: String
//
//    var body: some View {
//        Text(text)
//    }
//
//    init(_ text: String) {
//        print("Creating a customtext")
//        self.text = text
//    }
//}
//
//struct ContentView: View {
//    var body: some View {
//        ScrollView(.vertical) {
//            VStack(spacing: 10) {
//                ForEach(0..<100) {
//                    CustomText("Item\($0)")
//                        .font(.title)
//                }
//            }
//            .frame(maxWidth: .infinity)
//        }
//    }

// Using NavigationLink with lists to provide views sliding in from the right
//import SwiftUI
//
//struct ContentView: View {
//    var body: some View {
//        NavigationView{
//            List(0..<100) { row in
//                NavigationLink(destination: Text("Detail \(row)"))
//                {
//                    Text("Row \(row)")
//                }
//            .navigationBarTitle("SwiftUI")
//        }
//    }
//}
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

// JSON Decoder to decode multiple levels of data using Codable
//import SwiftUI
//
//struct ContentView: View {
//    var body: some View {
//        Button("DECODE JSON") {
//            let input = """
//            {
//            "name" : "Taylor Swift",
//            "address" : {
//                "street": "555, Taylor Swift Avenue",
//                "city" : "Nashville"
//                }
//            }
//            """
//
//            struct User: Codable {
//                var name: String
//                var address: Address
//            }
//
//            struct Address: Codable {
//                var street: String
//                var city: String
//            }
//
//            let data = Data(input.utf8)
//            let decorder = JSONDecoder()
//            if let user = try? decorder.decode(User.self, from: data) {
//                print(user.address.street)
//            }
//        }
//    }
//}
