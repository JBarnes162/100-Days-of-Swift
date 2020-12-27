import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false

    var body: some View {
        Button("Show Alert") {
            self.showingAlert = true
    }

        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Hello SwiftUI"),
                  message: Text("This is a default message"),
                  dismissButton: .default(Text("OK")))
        }
    }
}

/* LinearGradient(gradient: Gradient(colors: [.white, .black], startPoint: .top, endPoint: .bottom)*/
//RadialGradient(gradient: /*@START_MENU_TOKEN@*/Gradient(colors: [Color.red, Color.blue])/*@END_MENU_TOKEN@*/, center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, startRadius: /*@START_MENU_TOKEN@*/5/*@END_MENU_TOKEN@*/, endRadius: /*@START_MENU_TOKEN@*/500/*@END_MENU_TOKEN@*/)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
