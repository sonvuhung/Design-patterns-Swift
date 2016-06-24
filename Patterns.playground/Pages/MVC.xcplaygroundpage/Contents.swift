//MARK: MODEL
class Student {
    var rollNo: String!
    var name: String!
}

//MARK: VIEW
class StudentView {
    func printStudentDetails(studentName: String, studentRollNo: String) {
        print("Student: ")
        print("Name: \(studentName)")
        print("Roll No: \(studentRollNo)")
    }
}

//MARK: CONTROLLER
class studentController {
    
    var model: Student!
    var view: StudentView!
    
    init(model: Student, view: StudentView) {
        self.model = model
        self.view = view
    }
    
    func setStudentName(name: String) {
        self.model.name = name
    }
    
    func getStudentName() -> String {
        return self.model.name
    }
    
    func setStudentRollNo(rollNo: String) {
        self.model.rollNo = rollNo
    }
    
    func getStudentRollNo() -> String {
        return self.model.rollNo
    }
    
    func updateView() {
        view.printStudentDetails(model.name, studentRollNo: model.rollNo)
    }
}

//DEMO

let retriveStudentFromDatabase = {() -> Student in
    let student = Student()
    student.name = "Robert"
    student.rollNo = "10"
    return student
}

let model = retriveStudentFromDatabase()
let view = StudentView()
let controller = studentController(model: model, view: view)

controller.updateView()
controller.setStudentName("John")
controller.updateView()