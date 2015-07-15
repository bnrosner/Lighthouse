# Deletes everything from the database so that you start fresh
puts "Deleting all records from the database..."
School.delete_all
Course.delete_all
Homework.delete_all
Question.delete_all
User.delete_all
Student.delete_all
HWSubmission.delete_all
QuestionSubmission.delete_all

# Create schools
puts "Creating schools..."
northwestern = School.create(name: "Northwestern")
princeton = School.create(name: "Princeton")

# Create courses
puts "Creating courses..."
nu_economics = Course.create(name: "Economics", school_id: northwestern.id)
nu_biology = Course.create(name: "Biology", school_id: northwestern.id)

# Create users
puts "Creating users..."
benne_rosner = User.create(name: "Benne Rosner", school_id: northwestern.id, email: "bnrosner@gmail.com", password: "hannah", admin: true)
josh_rosner = User.create(name: "Josh Rosner", school_id: northwestern.id, email: "joshrosner@gmail.com", password: "password", admin: false)
brian_eng = User.create(name: "Brian Eng", school_id: northwestern.id, email: "brianeng@gmail.com", password: "password", admin: false)


puts "There are now #{School.count} schools, #{Course.count} courses and #{User.count} users."