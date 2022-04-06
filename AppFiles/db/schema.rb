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

ActiveRecord::Schema.define(version: 2022_04_06_082707) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "certificates", force: :cascade do |t|
    t.string "CertificateId"
    t.string "Name"
    t.string "Grade"
    t.text "Description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "grades", force: :cascade do |t|
    t.string "StudentId"
    t.string "SubjectId"
    t.string "Grade"
    t.string "Date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "student_certificates", id: false, force: :cascade do |t|
    t.bigint "students_id"
    t.bigint "certificate_id"
    t.index ["certificate_id"], name: "index_student_certificates_on_certificate_id"
    t.index ["students_id"], name: "index_student_certificates_on_students_id"
  end

  create_table "student_grades", id: false, force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "grades_id"
    t.index ["grades_id"], name: "index_student_grades_on_grades_id"
    t.index ["student_id"], name: "index_student_grades_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "Studentd"
    t.string "name"
    t.string "FirstName"
    t.string "SecondName"
    t.string "SchoolTeam"
    t.string "DateOfBirth"
    t.string "Points"
    t.string "Attendance"
    t.string "EmailId"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
