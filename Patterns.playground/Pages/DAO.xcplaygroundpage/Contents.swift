//OBJECT
class Student {
    var name: String!
    var rollNo: Int!
    
    init(name: String, rollNo: Int) {
        self.name = name
        self.rollNo = rollNo
    }
}

protocol StudentDAO {
    func getAllStudents() -> [Student]
    func getStudent(rollNo: Int) -> Student
    func updateStudent(student: Student)
    func deleteStudent(student: Student)
}

class StudentDAOImpl: StudentDAO {
    
    var students = [Int: Student]()
    
    init() {
        students = [Int: Student]()
        let std1 = Student(name: "Robert", rollNo: 0)
        let std2 = Student(name: "John", rollNo: 1)
        students[std1.rollNo] = std1
        students[std2.rollNo] = std2
    }
    
    func deleteStudent(student: Student) {
        students[student.rollNo] = nil
        print("Student with Roll No \(student.rollNo) has been deleted from databasae")
    }
    
    func getStudent(rollNo: Int) -> Student {
        return students[rollNo]!
    }
    
    func getAllStudents() -> [Student] {
        return Array(students.values)
    }
    
    func updateStudent(student: Student) {
        students[student.rollNo]?.name = student.name
        print("Student with Roll No \(student.rollNo) has been updated from database")
    }
}

//DEMO

let stdDAO : StudentDAO = StudentDAOImpl()

for std in stdDAO.getAllStudents() {
    print("Student [RollNo: \(std.rollNo) | Name: \(std.name) ]")
}

let std1 = stdDAO.getAllStudents()[0]
std1.name = "Michael"
stdDAO.updateStudent(std1)

let std2 = stdDAO.getStudent(0)
print("Student [RollNo: \(std2.rollNo) | Name: \(std2.name) ]")