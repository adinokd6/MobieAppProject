#!/bin/bash
rails generate scaffold Grade GradeId:integer Grade:integer Date:string

rails generate scaffold Student StudentId:integer FirstName:string SecondName:string DateOfBirth:string grade:references

rails generate scaffold Animal AnimalId:integer Species:string Gender:string IsAlive:boolean Name:string

rails generate scaffold Certificate CertificateId:integer Name:string Grade:integer Description:text

rails generate scaffold ClassList ClassListId:integer

rails generate scaffold Subject SubjectId:integer Description:text MaxCapacity:integer

rails generate scaffold Email EmailId:integer OwnerId:string EmailAddress:string

rails generate scaffold Message MessageId:integer From:string To:string Text:text Date:string


rails generate scaffold Employer EmployerId:integer EmailId:integer email:references

rails generate scaffold Trainer TrainerId:integer FirstName:string LastName:string

rails generate scaffold Teacher TeacherId:integer FirstName:string LastName:string Title:string



rails generate scaffold ClassType ClassId:integer Period:string Time:string animal:references

rails generate scaffold ClassRoom ClassRoomId:integer RoomNumber:integer Capacity:integer RoomType:string Facilities:string


rails db:migrate
