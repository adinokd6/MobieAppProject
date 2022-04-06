#!/bin/bash


rails generate scaffold Certificate CertificateId:string Name:string Grade:string Description:text

rails generate scaffold ClassList ClassListId:string student:references

rails generate scaffold Subject SubjectId:string Description:text MaxCapacity:string

rails generate scaffold Animal AnimalId:string Species:string Gender:string IsAlive:string Name:string class:references

rails generate scaffold Email EmailId:string OwnerId:string EmailAddress:string

rails generate scaffold Message MessageId:string From:string To:string Text:text Date:string email:references

rails generate scaffold ClassRoom ClassRoomId:string RoomNumber:string Capacity:string RoomType:string Facilities:string class:references

rails generate scaffold Trainer TrainerId:string FirstName:string LastName:string subject:references employer:references

rails generate scaffold Teacher TeacherId:string FirstName:string LastName:string Title:string subject:references Level:string employer:references

rails generate Employer EmployerId:string EmailId:string email:references

rails generate Class ClassId:string Period:string Time:string

rais db:migrate
