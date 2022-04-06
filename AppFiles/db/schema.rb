# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_04_06_104652) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "animals", force: :cascade do |t|
    t.string "AnimalId"
    t.string "Species"
    t.string "Gender"
    t.string "IsAlive"
    t.string "Name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "certificates", force: :cascade do |t|
    t.string "CertificateId"
    t.string "Name"
    t.string "Grade"
    t.text "Description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "class1s", force: :cascade do |t|
    t.string "ClassId"
    t.string "Period"
    t.string "Time"
    t.bigint "animal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["animal_id"], name: "index_class1s_on_animal_id"
  end

  create_table "class_list_classes", id: false, force: :cascade do |t|
    t.bigint "classlist_id"
    t.bigint "class1_id"
    t.index ["class1_id"], name: "index_class_list_classes_on_class1_id"
    t.index ["classlist_id"], name: "index_class_list_classes_on_classlist_id"
  end

  create_table "class_lists", force: :cascade do |t|
    t.string "ClassListId"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "class_rooms", force: :cascade do |t|
    t.string "ClassRoomId"
    t.string "RoomNumber"
    t.string "Capacity"
    t.string "RoomType"
    t.string "Facilities"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "emails", force: :cascade do |t|
    t.string "EmailId"
    t.string "OwnerId"
    t.string "EmailAddress"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employers", force: :cascade do |t|
    t.string "EmployerId"
    t.string "EmailId"
    t.bigint "email_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email_id"], name: "index_employers_on_email_id"
  end

  create_table "grades", force: :cascade do |t|
    t.string "GradeId"
    t.string "StudentId"
    t.string "SubjectId"
    t.string "Grade"
    t.string "Date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string "MessageId"
    t.string "From"
    t.string "To"
    t.text "Text"
    t.string "Date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "StudentId"
    t.string "FirstName"
    t.string "SecondName"
    t.string "SchoolTeam"
    t.string "DateOfBirth"
    t.string "Points"
    t.string "Attendance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students_grades", id: false, force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "grade_id"
    t.index ["grade_id"], name: "index_students_grades_on_grade_id"
    t.index ["student_id"], name: "index_students_grades_on_student_id"
  end

  create_table "subject_classes", id: false, force: :cascade do |t|
    t.bigint "subject_id"
    t.bigint "class1_id"
    t.index ["class1_id"], name: "index_subject_classes_on_class1_id"
    t.index ["subject_id"], name: "index_subject_classes_on_subject_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "SubjectId"
    t.text "Description"
    t.string "MaxCapacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teachers", force: :cascade do |t|
    t.string "TeacherId"
    t.string "FirstName"
    t.string "LastName"
    t.string "Title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trainers", force: :cascade do |t|
    t.string "TrainerId"
    t.string "FirstName"
    t.string "LastName"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "class1s", "animals"
  add_foreign_key "employers", "emails"
end
