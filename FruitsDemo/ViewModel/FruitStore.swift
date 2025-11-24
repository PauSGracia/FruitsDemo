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
    
    func addFruit(fruit:Fruit){
        if (!fruits.contains(fruit))
        {
            fruits.append(fruit)
        }
    }
    
}
