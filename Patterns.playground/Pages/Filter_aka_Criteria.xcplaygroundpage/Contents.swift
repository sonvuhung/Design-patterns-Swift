enum Gender {
    case male
    case female
}

enum MaritalStatus {
    case single
    case married
    case inrelationship
    case complicated
}

class Person: Hashable {
    
    var name: String!
    var gender: Gender!
    var maritalStatus: MaritalStatus!
    
    init(_ name: String,_ gender: Gender,_ maritalStatus: MaritalStatus) {
        self.name = name
        self.gender = gender
        self.maritalStatus = maritalStatus
    }
    
    var hashValue: Int {
        return "\(name).\(gender).\(maritalStatus)".hashValue
    }
}

func ==(lhs: Person, rhs: Person) -> Bool {
    return lhs.hashValue == rhs.hashValue
}

protocol Criteria {
    func meetCriteria(persons: Set<Person>) -> Set<Person>
}

class CriteriaMale: Criteria {
    
    func meetCriteria(persons: Set<Person>) -> Set<Person> {
        var malePersons = Set<Person>()
        
        for p in persons {
            if p.gender == Gender.male {
                malePersons.insert(p)
            }
        }
        
        return malePersons
    }
}

class CriteriaFemale: Criteria {
    
    func meetCriteria(persons: Set<Person>) -> Set<Person> {
        var femalePersons = Set<Person>()
        
        for p in persons {
            if p.gender == Gender.female {
                femalePersons.insert(p)
            }
        }
        
        return femalePersons
    }
}

class CriteriaSingle: Criteria {
    
    func meetCriteria(persons: Set<Person>) -> Set<Person> {
        var singlePersons = Set<Person>()
        
        for p in persons {
            if p.maritalStatus == MaritalStatus.single {
                singlePersons.insert(p)
            }
        }
        
        return singlePersons
    }
}

class AndCriteria: Criteria {
    var criteria: Criteria!
    var otherCriteria: Criteria!
    
    init(_ criteria: Criteria,_ otherCriteria: Criteria) {
        self.criteria = criteria
        self.otherCriteria = otherCriteria
    }
    
    func meetCriteria(persons: Set<Person>) -> Set<Person> {
        let firstCriteriaPersons = criteria.meetCriteria(persons)
        return otherCriteria.meetCriteria(firstCriteriaPersons)
    }
}

class OrCriteria: Criteria {
    var criteria: Criteria!
    var otherCriteria: Criteria!
    
    init(_ criteria: Criteria,_ otherCriteria: Criteria) {
        self.criteria = criteria
        self.otherCriteria = otherCriteria
    }
    
    func meetCriteria(persons: Set<Person>) -> Set<Person> {
        var firstCriteriaItems = criteria.meetCriteria(persons)
        let otherCriteriaItems = otherCriteria.meetCriteria(persons)
        
        for p in otherCriteriaItems {
            if firstCriteriaItems.contains(p) == false {
                firstCriteriaItems.insert(p)
            }
        }
        
        return firstCriteriaItems
    }
}

//DEMO

let persons: Set<Person> = [
    Person("Robert", .male, .single),
    Person("John", .male, .married),
    Person("Laura", .female, .married),
    Person("Diana", .female, .single),
    Person("Mike", .male, .single),
    Person("Bobby", .male, .single)
]

let male = CriteriaMale()
let female = CriteriaFemale()
let single = CriteriaSingle()
let singleMale = AndCriteria(single, male)
let singleOrFemale = OrCriteria(single, female)

let printPerson = {(persons: Set<Person>) in
    for p in persons {
        print("Person: [Name: \(p.name), Gender: \(p.gender), Marital Status: \(p.maritalStatus)]")
    }
}

print("Male:")
printPerson(male.meetCriteria(persons))
print("\nFemale:")
printPerson(female.meetCriteria(persons))
print("\nSingle:")
printPerson(single.meetCriteria(persons))
print("\nSingle male:")
printPerson(singleMale.meetCriteria(persons))
print("\nSingle or female:")
printPerson(singleOrFemale.meetCriteria(persons))