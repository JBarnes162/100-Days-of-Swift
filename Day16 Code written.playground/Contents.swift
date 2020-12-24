import SwiftUI

struct ContentView: View {
    @State private var tapCount = 0
    @State private var name = ""
    
    let students = ["Angelina", "Jackson", "Pinas"]
    @State private var selectedStudent = "Angelina"
    
    var body: some View {
        
        Picker("Select your student", selection: $selectedStudent) {
            ForEach(0 ..< students.count) {
                Text(self.students[$0])
            }
        }
        
        NavigationView {
            Form {
                Button("Birthdays \(tapCount)"){
                    self.tapCount += 1
                }
                
                Section {
                    Text("is today :))))))) ")
                }
                
                TextField("Enter your name", text: $name)
                Text("Your name is \(name)")
                
            }
            .navigationBarTitle(Text("Pina's bday part 2"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
