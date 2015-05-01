# Deletes everything from the database so that you start fresh
puts "Deleting all records from the database..."
School.delete_all
Term.delete_all
Classes.delete_all
Person.delete_all
Tutor.delete_all
Student.delete_all

# Create the schools
puts "Creating schools..."
northwestern = School.create(name: "Northwestern", location: "Evanston, Illinois")
princeton = School.create(name: "Princeton", location: "Princeton, New Jersey")
stanford = School.create(name: "Stanford", location: "Palo Alto, California")
berkeley = School.create(name: "UC Berkeley", location: "Berkeley, California")
harvard = School.create(name: "Harvard", location: "Cambridge, Massachusetts")

# Create the terms
puts "Creating terms..."
fall_quarter = Term.create(name: "Fall Quarter")
winter_quarter = Term.create(name: "Winter Quarter")
spring_quarter = Term.create(name: "Spring Quarter")
fall_semester = Term.create(name: "Fall Semester")
spring_semester = Term.create(name: "Spring Semester")
summer_semester = Term.create(name: "Summer Semester")

# Create the classes
puts "Creating classes..."
micro_econ = Classes.create(name: "Microeconomics", course_number: "ECO100", year_taken: "2014", term_id: fall_quarter.id, school_id: northwestern.id)
macro_econ = Classes.create(name: "Macroeconomics", course_number: "ECO101", year_taken: "2014", term_id: winter_quarter.id, school_id: northwestern.id)
physics = Classes.create(name: "Physics", course_number: "PHY101", year_taken: "2014", term_id: fall_quarter.id, school_id: northwestern.id)
biology = Classes.create(name: "Biology", course_number: "BIO101", year_taken: "2013", term_id: spring_quarter.id, school_id: northwestern.id)
chemistry = Classes.create(name: "Chemistry", course_number: "CHM101", year_taken: "2012", term_id: summer_semester.id, school_id: northwestern.id)
computer_science = Classes.create(name: "Computer Science", course_number: "COS100", year_taken: "2014", term_id: fall_semester.id, school_id: northwestern.id)
writing = Classes.create(name: "Writing", course_number: "WRI101", year_taken: "2014", term_id: spring_semester.id, school_id: northwestern.id)

# Create the people
puts "Creating people..."
benne_rosner = Person.create(first_name: "Benne", last_name: "Rosner", graduation_year: "2011", school_id: northwestern.id)
bob_smith = Person.create(first_name: "Bob", last_name: "Smith", graduation_year: "2018", school_id: northwestern.id)
joe_shmoe = Person.create(first_name: "Joe", last_name: "Shmoe", graduation_year: "2019", school_id: northwestern.id)
jeff_kwong = Person.create(first_name: "Jeff", last_name: "Kwong", graduation_year: "2017", school_id: northwestern.id)
josh_rosner = Person.create(first_name: "Josh", last_name: "Rosner", graduation_year: "2012", school_id: northwestern.id)
brian_eng = Person.create(first_name: "Brian", last_name: "Eng", graduation_year: "2015", school_id: northwestern.id)
uwe_reinhardt = Person.create(first_name: "Uwe", last_name: "Reinhardt", graduation_year: "2013", school_id: northwestern.id)
nikhil_bt = Person.create(first_name: "Nikhil", last_name: "Basu Trivedi", graduation_year: "2013", school_id: northwestern.id)
shawn_kothari = Person.create(first_name: "Shawn", last_name: "Kothari", graduation_year: "2013", school_id: northwestern.id)
moran_cerf = Person.create(first_name: "Moran", last_name: "Cerf", graduation_year: "2013", school_id: northwestern.id)

# Create the tutors
puts "Creating tutors..."
Tutor.create(person_id: brian_eng.id, classes_id: computer_science.id)
Tutor.create(person_id: uwe_reinhardt.id, classes_id: micro_econ.id)
Tutor.create(person_id: uwe_reinhardt.id, classes_id: macro_econ.id)
Tutor.create(person_id: nikhil_bt.id, classes_id: biology.id)
Tutor.create(person_id: shawn_kothari.id, classes_id: chemistry.id)
Tutor.create(person_id: moran_cerf.id, classes_id: physics.id)

# Create the students
puts "Creating students..."
Student.create(person_id: benne_rosner.id, classes_id: macro_econ.id, rate: 10)
Student.create(person_id: bob_smith.id, classes_id: physics.id, rate: 10)
Student.create(person_id: joe_shmoe.id, classes_id: computer_science.id, rate: 10)
Student.create(person_id: jeff_kwong.id, classes_id: physics.id, rate: 10)
Student.create(person_id: josh_rosner.id, classes_id: writing.id, rate: 10)

puts "There are now #{School.count} schools, #{Term.count} terms, #{Classes.count} classes, #{Person.count} people, #{Tutor.count} tutor-class options and #{Student.count} student-class options in the database."