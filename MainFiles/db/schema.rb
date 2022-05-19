# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_05_16_103212) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "animal_classes", id: false, force: :cascade do |t|
    t.bigint "animal_id"
    t.bigint "class_type_id"
    t.index ["animal_id"], name: "index_animal_classes_on_animal_id"
    t.index ["class_type_id"], name: "index_animal_classes_on_class_type_id"
  end

  create_table "animals", force: :cascade do |t|
    t.integer "AnimalId"
    t.string "Species"
    t.string "Gender"
    t.boolean "IsAlive"
    t.string "Name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "certificates", force: :cascade do |t|
    t.integer "CertificateId"
    t.string "Name"
    t.integer "Grade"
    t.text "Description"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "student_id"
    t.index ["student_id"], name: "index_certificates_on_student_id"
  end

  create_table "class_lists", force: :cascade do |t|
    t.integer "ClassListId"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "class_type_id"
    t.index ["class_type_id"], name: "index_class_lists_on_class_type_id"
  end

  create_table "class_rooms", force: :cascade do |t|
    t.integer "ClassRoomId"
    t.integer "RoomNumber"
    t.integer "Capacity"
    t.string "RoomType"
    t.string "Facilities"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "class_type_id"
    t.index ["class_type_id"], name: "index_class_rooms_on_class_type_id"
  end

  create_table "class_types", force: :cascade do |t|
    t.integer "ClassId"
    t.string "Period"
    t.string "Time"
    t.bigint "animal_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["animal_id"], name: "index_class_types_on_animal_id"
  end

  create_table "classes_subjects", id: false, force: :cascade do |t|
    t.bigint "class_type_id"
    t.bigint "subject_id"
    t.index ["class_type_id"], name: "index_classes_subjects_on_class_type_id"
    t.index ["subject_id"], name: "index_classes_subjects_on_subject_id"
  end

  create_table "emails", force: :cascade do |t|
    t.integer "EmailId"
    t.string "OwnerId"
    t.string "EmailAddress"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "employee_id"
    t.bigint "student_id"
    t.index ["employee_id"], name: "index_emails_on_employee_id"
    t.index ["student_id"], name: "index_emails_on_student_id"
  end

  create_table "employees", force: :cascade do |t|
    t.integer "EmployeeId"
    t.integer "EmailId"
    t.bigint "email_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "class_type_id"
    t.index ["class_type_id"], name: "index_employees_on_class_type_id"
    t.index ["email_id"], name: "index_employees_on_email_id"
  end

  create_table "employers", force: :cascade do |t|
    t.integer "EmployerId"
    t.integer "EmailId"
    t.bigint "email_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["email_id"], name: "index_employers_on_email_id"
  end

  create_table "grades", force: :cascade do |t|
    t.integer "GradeId"
    t.integer "Grade"
    t.string "Date"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "student_id"
    t.bigint "subject_id"
    t.index ["student_id"], name: "index_grades_on_student_id"
    t.index ["subject_id"], name: "index_grades_on_subject_id"
  end

  create_table "messages", force: :cascade do |t|
    t.integer "MessageId"
    t.string "From"
    t.string "To"
    t.text "Text"
    t.string "Date"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "email_id"
    t.index ["email_id"], name: "index_messages_on_email_id"
  end

  create_table "students", force: :cascade do |t|
    t.integer "StudentId"
    t.string "FirstName"
    t.string "SecondName"
    t.string "DateOfBirth"
    t.bigint "grade_id"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "password_digest"
    t.string "token"
    t.bigint "class_list_id"
    t.index ["StudentId"], name: "index_students_on_StudentId", unique: true
    t.index ["class_list_id"], name: "index_students_on_class_list_id"
    t.index ["grade_id"], name: "index_students_on_grade_id"
    t.index ["token"], name: "index_students_on_token"
  end

  create_table "subjects", force: :cascade do |t|
    t.integer "SubjectId"
    t.text "Description"
    t.integer "MaxCapacity"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "teacher_id"
    t.bigint "trainer_id"
    t.bigint "class_type_id"
    t.index ["class_type_id"], name: "index_subjects_on_class_type_id"
    t.index ["teacher_id"], name: "index_subjects_on_teacher_id"
    t.index ["trainer_id"], name: "index_subjects_on_trainer_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.integer "TeacherId"
    t.string "FirstName"
    t.string "LastName"
    t.string "Title"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "employee_id"
    t.string "password_digest"
    t.string "token"
    t.index ["TeacherId"], name: "index_teachers_on_TeacherId", unique: true
    t.index ["employee_id"], name: "index_teachers_on_employee_id"
    t.index ["token"], name: "index_teachers_on_token"
  end

  create_table "trainers", force: :cascade do |t|
    t.integer "TrainerId"
    t.string "FirstName"
    t.string "LastName"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.bigint "employee_id"
    t.string "password_digest"
    t.string "token"
    t.index ["TrainerId"], name: "index_trainers_on_TrainerId", unique: true
    t.index ["employee_id"], name: "index_trainers_on_employee_id"
    t.index ["token"], name: "index_trainers_on_token"
  end

  add_foreign_key "certificates", "students"
  add_foreign_key "class_lists", "class_types"
  add_foreign_key "class_rooms", "class_types"
  add_foreign_key "class_types", "animals"
  add_foreign_key "emails", "employees"
  add_foreign_key "emails", "students"
  add_foreign_key "employees", "class_types"
  add_foreign_key "employees", "emails"
  add_foreign_key "employers", "emails"
  add_foreign_key "grades", "students"
  add_foreign_key "grades", "subjects"
  add_foreign_key "messages", "emails"
  add_foreign_key "students", "class_lists"
  add_foreign_key "students", "grades"
  add_foreign_key "subjects", "class_types"
  add_foreign_key "subjects", "teachers"
  add_foreign_key "subjects", "trainers"
  add_foreign_key "teachers", "employees"
  add_foreign_key "trainers", "employees"
end
