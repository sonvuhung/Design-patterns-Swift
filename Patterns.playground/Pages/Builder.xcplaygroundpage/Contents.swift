protocol Packing {
    func pack() -> String
}

protocol Item {
    func name() -> String
    func packing() -> Packing
    func price() -> Float
}

class Wrapper: Packing {
    func pack() -> String {
        return "Wrapper"
    }
}

class Bottle: Packing {
    func pack() -> String {
        return "Bottle"
    }
}

class Burger {
    func packing() -> Packing {
        return Wrapper()
    }
}

class ColdDrink {
    func packing() -> Packing {
        return Bottle()
    }
}

class VegBurger: Burger, Item {
    func name() -> String {
        return "Veg Burger"
    }
    func price() -> Float {
        return 25.0
    }
}

class ChickenBurger: Burger, Item {
    func name() -> String {
        return "Chicken Burger"
    }
    func price() -> Float {
        return 50.5
    }
}

class Coke: ColdDrink, Item {
    func price() -> Float {
        return 30.0
    }
    func name() -> String {
        return "Coke"
    }
}

class Pepsi: ColdDrink, Item {
    func price() -> Float {
        return 35.0
    }
    func name() -> String {
        return "Pepsi"
    }
}

//Create a Meal class having Item objects defined above
class Meal {
    
    var items = [Item]()
    
    func addItem(item: Item) {
        items.append(item)
    }
    
    func getCost() -> Float {
        var cost : Float = 0
        for i in items {
            cost += i.price()
        }
        return cost
    }
    
    func showItems() {
        for i in items {
            print("Item: \(i.name()), Packing: \(i.packing()), Pirce: \(i.price())")
        }
    }
}

//Create a MealBuilder class, the actual builder class responsible to create Meal objects.
class MealBuilder {
    
    func prepareVegMeal() -> Meal {
        let meal = Meal()
        meal.addItem(VegBurger())
        meal.addItem(Coke())
        return meal
    }
    
    func prepareNonVegMeal() -> Meal {
        let meal = Meal()
        meal.addItem(ChickenBurger())
        meal.addItem(Pepsi())
        return meal
    }
}

//DEMO 

let mealBuilder = MealBuilder()

let vegMeal = mealBuilder.prepareVegMeal()
print("Veg Meal")
vegMeal.showItems()
print("Total Balance: \(vegMeal.getCost())")

let nonVegMeal = mealBuilder.prepareNonVegMeal()
print("\nNon-Veg Meal")
nonVegMeal.showItems()
print("Total Balance: \(nonVegMeal.getCost())")
