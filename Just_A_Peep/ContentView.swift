
import SwiftUI

struct ContentView: View {
    @State var isUpdated : Bool = false
    var body: some View {
        VStack{
            Text("Hello, world!").padding()
            Button("Ok", action: {
                isUpdated.toggle()
            }).padding()
        }.frame(maxWidth: .infinity, maxHeight: .infinity) 
    }
    
    func updateStatusBarTitle(title: String){
        AppDelegate.shared.statusBarItem?.button?.title = title
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
