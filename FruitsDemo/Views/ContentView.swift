
import SwiftUI

//TODO: Create a list
//TODO: Create the navigation
struct ContentView: View {
    @EnvironmentObject var fruitStore:FruitStore
    @State private var showSheet = false
    @State private var sheetAction = SheetAction.cancel
    @State private var fruitToAdd = FruitStore.emptyFruit
    @State private var alertIsVisible = false
    
    var body: some View {
        NavigationView {
            List() {
                ForEach(fruitStore.fruits, id: \.id) {
                    fruit in
                    NavigationLink(
                        destination: DetailFruitView(fruit: fruit)) {
                            FruitRowView(fruit: fruit)
                        }
                }.onDelete(perform: fruitStore.deleteFruit)
                }
            .navigationBarTitle(Text("Fruits"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("+") {showSheet = true}
                        .sheet(isPresented: $showSheet, onDismiss: {onSheetDismiss(fruit: fruitToAdd)})
                        {
                            AddFruitView(sheetIsVisible: $showSheet, sheetAction: $sheetAction, newFruit: $fruitToAdd)
                        }
                }
            }
        }.alert(isPresented: $alertIsVisible) {
            Alert(title: Text("ERROR"),
            message: Text("Error adding fruit. Name incomplete or fruit already exists"),
            dismissButton: .default(Text("Accept")))
        }
    }
    
    func onSheetDismiss(fruit: Fruit){
        if (sheetAction == SheetAction.add){
            alertIsVisible = !fruitStore.addFruit(fruit: fruit)
            
            self.fruitToAdd = FruitStore.emptyFruit
            self.sheetAction = SheetAction.cancel
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(FruitStore())
    }
}
