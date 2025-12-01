import Foundation
class FruitStore:ObservableObject{
    
    @Published private(set) var fruits = loadFruits()
    
    static func loadFruits()->[Fruit]{
        return FruitStore.defaultFruits
    }
    
    static let defaultFruits = [
        Fruit(name: "Apple", emoji: .apple, description: "Apples help your body develop resistance against infections"),
        Fruit(name: "Pineapple", emoji: .pineapple, description: "Pineapples help fight arthritis"),
        Fruit(name: "Watermelon", emoji: .watermelon, description: "Watermelon helps control your heart rate"),
    ]
    
    static let defaultFruit =  Fruit(name: "Watermelon", emoji: .watermelon, description: "Watermelon helps control your heart rate")
    
    static let emptyFruit = Fruit(name: "", emoji: .apple, description: "")
    
    func addFruit(fruit:Fruit) -> Bool{
        if (!fruits.contains(fruit) && !fruit.name.isEmpty)
        {
            fruits.append(fruit)
            return true
        }
        return false
    }
    
    func deleteFruit(at offsets:IndexSet) {
        fruits.remove(atOffsets: offsets)
    }
    
}
