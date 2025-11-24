
import SwiftUI

//TODO: Create a list
//TODO: Create the navigation
struct ContentView: View {
    @EnvironmentObject var fruitStore:FruitStore
    var body: some View {
        NavigationView {
            List(FruitStore.loadFruits()) { fruit in
                NavigationLink(
                    destination: DetailFruitView(fruit: fruit)) {
                        FruitRowView(fruit: fruit)
                    }
                }.navigationBarTitle(Text("Fruits"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
