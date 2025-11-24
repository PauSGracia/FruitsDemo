
import SwiftUI

struct AddFruitView: View {
    
    @Binding var sheetIsVisible:Bool
    @Binding var newFruit:Fruit
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Name")) {
                    TextField("Name", text: $newFruit.name)
                }
                Section(header: Text("Description")) {
                    TextEditor(text: $newFruit.description)
                }
                Section(header: Text("Image")) {
                    EmojiPicker(emoji: $newFruit.emoji)
                        //TODO: .listRowInsets(EdgeInsets())
                }
            }.navigationTitle("Add fruit")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    Button("Cancel") {
                        sheetIsVisible = false
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("Add") {
                        sheetIsVisible = false
                    }
                }
            }
        }
    }
}

struct AddFruitView_Previews: PreviewProvider {
    static var previews: some View {
        AddFruitView(sheetIsVisible: .constant(false), newFruit: .constant(FruitStore.defaultFruit))
        AddFruitView(sheetIsVisible: .constant(false), newFruit: .constant(FruitStore.defaultFruit))
            .preferredColorScheme(.dark)
        AddFruitView(sheetIsVisible: .constant(false), newFruit: .constant(FruitStore.defaultFruit))
            .previewLayout(.fixed(width: 480, height: 320))
    }
}
