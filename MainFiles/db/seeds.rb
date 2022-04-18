# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
students = Student.create(
  [
    {
      StudentId: '997997',
      FirstName: 'Marian',
      SecondName: 'Kox',
      DateOfBirth: '19.03.1999',
      password: 'haslo123'
    },
    {
      StudentId: '2137',
      FirstName: 'Robert',
      SecondName: 'Noob',
      DateOfBirth: '01.01.1997',
      password: 'haslo123'
    }
  ]
)

certificates = Certificate.create(
  [
    {
      CertificateId: 1,
      Description: "Very hard certificate to pass",
      Grade: 4,
      Name: "Microsoft Azure"
    }
  ]
)

class_lists = ClassList.create(
  [
    {
      ClassListId: 1,
      students: students
    }
  ]
)

students.first.certificates = certificates

subjects = Subject.create(
  [
    {
      Description: "Analiza matematyczna 1",
      MaxCapacity: 35,
      SubjectId: 1,
    },
    {
      Description: "Analiza matematyczna 2",
      MaxCapacity: 25,
      SubjectId: 2,
    }
  ]
)

grades = Grade.create(
  [
    {
      Date: "01.01.2020",
      Grade: 5,
      GradeId: 1
    },
    {
      Date: "02.03.2020",
      Grade: 5,
      GradeId: 2
    },
  ]
)

subjects.first.grades = grades
subjects.last.grades = grades

students.first.grades = grades

teachers = Teacher.create(
  [
    {
      FirstName: "Emanuel",
      LastName: "Laskawy",
      TeacherId: 557,
      Title: "Profesur"
    },
    {
      FirstName: "Emanuel",
      LastName: "Gorliwy",
      TeacherId: 2137,
      Title: "Doktur"
    }
  ]
)

teachers.first.subjects = subjects


emails = Email.create(
  [
    {
      EmailAddress: "emanuale.laskawy@tech.baza.pl",
      EmailId: 1,
    },
    {
      EmailAddress: "emanuale.gorliwy@tech.baza.pl",
      EmailId: 2,
    }
  ]
)

employers = Employer.create(
  [
    {
      EmployerId: teachers.first.TeacherId,
      EmailId: emails.first.EmailId
    },
    {
      EmployerId: teachers.last.TeacherId,
      EmailId: emails.last.EmailId
    }
  ]
)

employers.first.email = emails.first
employers.last.email = emails.first

#rails db:drop db:create db:migrate db:seed
