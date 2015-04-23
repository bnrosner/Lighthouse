# Deletes everything from the database so that you start fresh
puts "Deleting all records from the database..."
User.delete_all
Tutor.delete_all
School.delete_all
Term.delete_all
Classes.delete_all
Times.delete_all

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
chemistry = Classes.create(name: "Chemistry", course_number: "CHM101", year_taken: "2012", term_id: summer_semester.id, school_id: princeton.id)
computer_science = Classes.create(name: "Computer Science", course_number: "COS100", year_taken: "2014", term_id: fall_semester.id, school_id: princeton.id)
writing = Classes.create(name: "Writing", course_number: "WRI101", year_taken: "2014", term_id: spring_semester.id, school_id: princeton.id)

# Create the users
puts "Creating users..."
benne_rosner = User.create(first_name: "Benne", last_name: "Rosner", graduation_year: "2011", school_id: northwestern.id, classes_id: micro_econ.id)
bob_smith = User.create(first_name: "Bob", last_name: "Smith", graduation_year: "2018", school_id: northwestern.id, classes_id: macro_econ.id)
joe_shmoe = User.create(first_name: "Joe", last_name: "Shmoe", graduation_year: "2019", school_id: northwestern.id, classes_id: biology.id)
jeff_kwong = User.create(first_name: "Jeff", last_name: "Kwong", graduation_year: "2017", school_id: northwestern.id, classes_id: micro_econ.id)
josh_rosner = User.create(first_name: "Josh", last_name: "Rosner", graduation_year: "2012", school_id: princeton.id, classes_id: computer_science.id)

# Create the times available
puts "Creating times..."
monday_morning = Times.create(day: "Monday", time: "morning")
tuesday_morning = Times.create(day: "Tuesday", time: "morning")
wednesday_morning = Times.create(day: "Wednesday", time: "morning")
thursday_morning = Times.create(day: "Thursday", time: "morning")
friday_morning = Times.create(day: "Friday", time: "morning")
saturday_morning = Times.create(day: "Saturday", time: "morning")
sunday_morning = Times.create(day: "Sunday", time: "morning")
monday_afternoon = Times.create(day: "Monday", time: "afternoon")
tuesday_afternoon = Times.create(day: "Tuesday", time: "afternoon")
wednesday_afternoon = Times.create(day: "Wednesday", time: "afternoon")
thursday_afternoon = Times.create(day: "Thursday", time: "afternoon")
friday_afternoon = Times.create(day: "Friday", time: "afternoon")
saturday_afternoon = Times.create(day: "Saturday", time: "afternoon")
sunday_afternoon = Times.create(day: "Sunday", time: "afternoon")
monday_evening = Times.create(day: "Monday", time: "evening")
tuesday_evening = Times.create(day: "Tuesday", time: "evening")
wednesday_evening = Times.create(day: "Wednesday", time: "evening")
thursday_evening = Times.create(day: "Thursday", time: "evening")
friday_evening = Times.create(day: "Friday", time: "evening")
saturday_evening = Times.create(day: "Saturday", time: "evening")
sunday_evening = Times.create(day: "Sunday", time: "evening")

# Create the tutors
brian_eng = Tutor.create(first_name: "Brian", last_name: "Eng", graduation_year: "2015", school_id: northwestern.id, major: "Computer Science", minor: "Media Management", classes_id: computer_science.id, hourly_rate: 20, times_id: monday_morning.id)
uwe_reinhardt = Tutor.create(first_name: "Uwe", last_name: "Reinhardt", graduation_year: "2013", school_id: princeton.id, major: "Economics", minor: "Finance", classes_id: micro_econ.id, hourly_rate: 20, times_id: wednesday_afternoon.id)
paul_krugman = Tutor.create(first_name: "Paul", last_name: "Krugman", graduation_year: "2013", school_id: princeton.id, major: "Economics", minor: "Finance", classes_id: macro_econ.id, hourly_rate: 20, times_id: thursday_evening.id)
swati_bhatt = Tutor.create(first_name: "Swati", last_name: "Bhatt", graduation_year: "2013", school_id: princeton.id, major: "Economics", minor: "Finance", classes_id: micro_econ.id, hourly_rate: 30, times_id: monday_morning.id)
moran_cerf = Tutor.create(first_name: "Moran", last_name: "Cerf", graduation_year: "2013", school_id: northwestern.id, major: "Psychology", minor: "Neuroscience", classes_id: chemistry.id, hourly_rate: 25, times_id: saturday_evening.id)

puts "There are now #{School.count} schools, #{Term.count} terms, #{Classes.count} classes, #{User.count} users and #{Times.count} times in the database."