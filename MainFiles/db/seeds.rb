students = Student.create(
  [
    {
      StudentId: '123456',
      FirstName: 'Anon',
      SecondName: 'Szynka',
      password: 'haslo123'
    },
    {
      StudentId: '123457',
      FirstName: 'Waldemar',
      SecondName: 'Kiepski',
      password: 'haslo123'
    },
    {
      StudentId: '123458',
      FirstName: 'Vito',
      SecondName: 'Scalleta',
      password: 'haslo123'
    }
  ]
)

subjects = Subject.create(
  [
  {
    SubjectId: '1',
    Description: "Matematyka",
    MaxCapacity: '13'
  },
  {
    SubjectId: '2',
    Description: "Uranistyka",
    MaxCapacity: '13'
  }
  ]
)

teachers = Teacher.create(
  [
    {
      TeacherId: '21',
      FirstName: 'Jason',
      LastName: 'Pawulenko',
      Title: 'Professor',
      password: 'haslo123'
    },
    {
      TeacherId: '44',
      FirstName: 'Jurij',
      LastName: 'Owsienko',
      Title: 'Professor',
      password: 'haslo123'
    }
  ]
)

trainers = Trainer.create(
  [
    {
      TrainerId: '111',
      FirstName: 'Carl',
      LastName: 'Johnson',
      password: 'haslo123'
    },
  ]
)
