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

ActiveRecord::Schema[7.0].define(version: 2022_04_16_095925) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
  end

  create_table "class_lists", force: :cascade do |t|
    t.integer "ClassListId"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "class_rooms", force: :cascade do |t|
    t.integer "ClassRoomId"
    t.integer "RoomNumber"
    t.integer "Capacity"
    t.string "RoomType"
    t.string "Facilities"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
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

  create_table "emails", force: :cascade do |t|
    t.integer "EmailId"
    t.string "OwnerId"
    t.string "EmailAddress"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
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
  end

  create_table "messages", force: :cascade do |t|
    t.integer "MessageId"
    t.string "From"
    t.string "To"
    t.text "Text"
    t.string "Date"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
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
    t.index ["StudentId"], name: "index_students_on_StudentId", unique: true
    t.index ["grade_id"], name: "index_students_on_grade_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.integer "SubjectId"
    t.text "Description"
    t.integer "MaxCapacity"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "teachers", force: :cascade do |t|
    t.integer "TeacherId"
    t.string "FirstName"
    t.string "LastName"
    t.string "Title"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "trainers", force: :cascade do |t|
    t.integer "TrainerId"
    t.string "FirstName"
    t.string "LastName"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  add_foreign_key "class_types", "animals"
  add_foreign_key "employers", "emails"
  add_foreign_key "students", "grades"
end
