
import SwiftUI

//TODO: Create a list
//TODO: Create the navigation
struct ContentView: View {
    @EnvironmentObject var fruitStore:FruitStore
    @State private var showSheet = false
    @State private var fruitToAdd = FruitStore.defaultFruit
    var body: some View {
        NavigationView {
            List(FruitStore.loadFruits()) { fruit in
                NavigationLink(
                    destination: DetailFruitView(fruit: fruit)) {
                        FruitRowView(fruit: fruit)
                    }
                }.navigationBarTitle(Text("Fruits"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("+") {showSheet = true}
                        .sheet(isPresented: $showSheet, onDismiss: {})
                        {
                            AddFruitView(sheetIsVisible: $showSheet, newFruit: $fruitToAdd)
                        }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
