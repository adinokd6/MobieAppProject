#!/bin/bash


rails generate scaffold Animal AnimalId:string Species:string Gender:string IsAlive:string Name:string

rails generate scaffold Certificate CertificateId:string Name:string Grade:string Description:text

rails generate scaffold ClassList ClassListId:string

rails generate scaffold Subject SubjectId:string Description:text MaxCapacity:string

rails generate scaffold Email EmailId:string OwnerId:string EmailAddress:string

rails generate scaffold Message MessageId:string From:string To:string Text:text Date:string


rails generate scaffold Employer EmployerId:string EmailId:string email:references

rails generate scaffold Trainer TrainerId:string FirstName:string LastName:string

rails generate scaffold Teacher TeacherId:string FirstName:string LastName:string Title:string



rails generate scaffold Class1 ClassId:string Period:string Time:string animal:references

rails generate scaffold ClassRoom ClassRoomId:string RoomNumber:string Capacity:string RoomType:string Facilities:string


rails db:migrate
