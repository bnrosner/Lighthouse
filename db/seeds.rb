# Deletes everything from the database so that you start fresh
puts "Deleting all records from the database..."
School.delete_all
Course.delete_all
User.delete_all
Tutor.delete_all
Student.delete_all

# Create the schools
puts "Creating schools..."
northwestern = School.create(name: "Northwestern", location: "Evanston, Illinois")
princeton = School.create(name: "Princeton", location: "Princeton, New Jersey")

# Create the courses
puts "Creating courses..."
micro_econ_nu = Course.create(name: "Microeconomics", course_number: "ECO100", school_id: northwestern.id)
macro_econ_nu = Course.create(name: "Macroeconomics", course_number: "ECO101", school_id: northwestern.id)
physics_nu = Course.create(name: "Physics", course_number: "PHY101", school_id: northwestern.id)
biology_nu = Course.create(name: "Biology", course_number: "BIO101", school_id: northwestern.id)
chemistry_nu = Course.create(name: "Chemistry", course_number: "CHM101", school_id: northwestern.id)
computer_science_nu = Course.create(name: "Computer Science", course_number: "COS100", school_id: northwestern.id)
writing_nu = Course.create(name: "Writing", course_number: "WRI101", school_id: northwestern.id)
micro_econ_pt = Course.create(name: "Microeconomics", course_number: "ECO100", school_id: princeton.id)
macro_econ_pt = Course.create(name: "Macroeconomics", course_number: "ECO101", school_id: princeton.id)

# Create the users
puts "Creating users..."
benne_rosner = User.create(name: "Benne Rosner", graduation_year: "2011", school_id: northwestern.id, email: "bnrosner@gmail.com", password: "hannah", admin: true)
bob_smith = User.create(name: "Bob Smith", graduation_year: "2018", school_id: northwestern.id, email: "bobsmith@gmail.com", password: "password", admin: false)
joe_shmoe = User.create(name: "Joe Shmoe", graduation_year: "2019", school_id: northwestern.id, email: "joeshmoe@gmail.com", password: "password", admin: false)
jeff_kwong = User.create(name: "Jeff Kwong", graduation_year: "2017", school_id: northwestern.id, email: "jeffkwong@gmail.com", password: "password", admin: false)
josh_rosner = User.create(name: "Josh Rosner", graduation_year: "2012", school_id: northwestern.id, email: "joshrosner@gmail.com", password: "password", admin: false)
brian_eng = User.create(name: "Brian Eng", graduation_year: "2015", school_id: northwestern.id, email: "brianeng@gmail.com", password: "password", admin: false)
uwe_reinhardt = User.create(name: "Uwe Reinhardt", graduation_year: "2013", school_id: northwestern.id, email: "uwereinhardt@gmail.com", password: "password", admin: false)
nikhil_bt = User.create(name: "Nikhil Basu Trivedi", graduation_year: "2013", school_id: northwestern.id, email: "nikhilbt@gmail.com", password: "password", admin: false)
shawn_kothari = User.create(name: "Shawn Kothari", graduation_year: "2013", school_id: northwestern.id, email: "shawnkothari@gmail.com", password: "password", admin: false)
moran_cerf = User.create(name: "Moran Cerf", graduation_year: "2013", school_id: northwestern.id, email: "morancerf@gmail.com", password: "password", admin: false)
princeton_tiger = User.create(name: "Princeton Tiger", graduation_year: "2015", school_id: princeton.id, email: "princetontiger@gmail.com", password: "password", admin: false)

# Create the tutors
puts "Creating tutors..."
Tutor.create(user_id: brian_eng.id, course_id: computer_science_nu.id, available: true)
Tutor.create(user_id: uwe_reinhardt.id, course_id: micro_econ_nu.id, available: true)
Tutor.create(user_id: uwe_reinhardt.id, course_id: macro_econ_nu.id, available: true)
Tutor.create(user_id: nikhil_bt.id, course_id: biology_nu.id, available: true)
Tutor.create(user_id: shawn_kothari.id, course_id: chemistry_nu.id, available: true)
Tutor.create(user_id: shawn_kothari.id, course_id: writing_nu.id, available: true)
Tutor.create(user_id: princeton_tiger.id, course_id: micro_econ_pt.id, available: true)
Tutor.create(user_id: princeton_tiger.id, course_id: macro_econ_pt.id, available: true)


# Create the students
puts "Creating students..."
Student.create(user_id: benne_rosner.id, course_id: macro_econ_nu.id)
Student.create(user_id: bob_smith.id, course_id: physics_nu.id)
Student.create(user_id: joe_shmoe.id, course_id: computer_science_nu.id)
Student.create(user_id: jeff_kwong.id, course_id: physics_nu.id)
Student.create(user_id: josh_rosner.id, course_id: writing_nu.id)

puts "There are now #{School.count} schools, #{Course.count} courses, #{User.count} users, #{Tutor.count} tutors and #{Student.count} students in the database."