protocol Pet {
    func giveBirth() -> Pet
    func sound()
}

class Cat: Pet {
    func giveBirth() -> Pet {
        return Cat()
    }
    func sound() {
        print("Meow Meow")
    }
}

class Dog: Pet {
    func giveBirth() -> Pet {
        return Dog()
    }
    func sound() {
        print("Woof Woof")
    }
}

class PetOwner  {
    
    //abstract function
    func getPet() -> Pet? {
        return nil
    }
    
    func introducePet() {
        let pet = self.getPet()
        if pet != nil {
            print("His pet makes a sound ... ")
            pet!.sound()
            let child = pet!.giveBirth()
            print("His pet is giving birth !!!")
            print("The new born pet makes a sound ... ")
            child.sound()
        }
    }
}

class CatOwner: PetOwner {
    override func getPet() -> Pet? {
        return Cat()
    }
}

class DogOwner: PetOwner {
    override func getPet() -> Pet? {
        return Dog()
    }
}

//DEMO 

let catOwner = CatOwner()
print("Cat owner has a cat")
catOwner.introducePet()

let dogOwner = DogOwner()
print("Dog owner has a dog")
dogOwner.introducePet()
