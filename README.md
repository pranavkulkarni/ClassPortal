README

CSC 517 Program 1- Class Portal, a Ruby on Rails Web Application
PLEASE use CHROME/MOZILLA while reviewing our application
Code Repo: https://github.com/pranavkulkarni/ClassPortal.git
Application Link: https://wolfwebportal.herokuapp.com/

Preconfigured Super-Admin Credentials:
Email: pkulkar5@ncsu.edu
Password: 1

Preconfigured Instructor Credentials:
Email: e@ncsu.edu
Password: 1

Preconfigured v Credentials:
Email: v@ncsu.edu
Password: 1

(Please don't change these credentials. We don't want our reviewers to experience troubles.)
Description of all tabs on the Navigation bar of the page:
1.	Home: Takes the user immediately to the default user page, which is the first page after the user logs in.
2.	Edit Profile: The user can edit their name and/or password while editing their profile. The user must enter their old profile for the update to be successful.
3.	Logout: The user is logged out of the portal and can see the login page again.
Sign Up page: The sign up page is primarily for students to sign up and use the app. Both admins and instructors are created by the admin ONLY.

Admin Functionality:
1.	Manage admins: Admin can view the profile of other admins in the system and can also create new admins and delete other admins. The super admin (Pranav K) cannot be destroyed.
2.	Manage instructors: Admin can view the profile of the instructors in the system and can also create new instructors and delete old instructors. They can also view the present and past courses taught by any instructor.
3.	Manage students: Admin can view the profile of the students in the system and can also create new students and delete old students. They can also view the present and past courses taken by any student and also add a grade for any particular course taken by the student on behalf of the instructor. 
4.	Manage courses: Admin can view the courses in the system and also delete them if necessary. Admin can also add a new course and assign an instructor to that course. They can add course material on behalf of an instructor.

Instructor functionality:
Instructor’s home page shows a list of the courses being taught by the instructor and (s)he must select a course before using any functionalities. Selecting any functionality without selecting a course will lead to an error- “Please select a course!”
1.	Manage Students: Instructor can select a student and assign a grade for that course to the student. Instructor can also remove student from the course.
2.	Manage Course Material: Instructor can view, create or delete any course material for the selected course.
3.	Add Enrolments: If a student has requested to be enrolled in a course, the request will be visible to the instructor on this page. From here the instructor can enrol the student to the course.
4.	Send and View Messages (Bonus feature): Student and instructors can exchange private messages using this page.
5.	Request to make it inactive(Bonus feature): This button sends a request to the admin to make the selected course inactive. (Status can be seen on admin home page for the inactive request as ‘Req Inactive’).

Student Functionality:
Student can see the courses s(he) is enrolled in from the home page. s(he) can view the details about the enrolled course, drop the course (it changes the status to ‘DROPPED’), view course material and send or view private messages to the instructor of the course from this page. If a request has been sent to enrol into a course, the status is shown as ‘PENDING’
1.	Enrol into a course: Student can send a request to enrol into one of the courses present here.
2.	Search Courses: Student can search for a course based on a number of criteria including number, title, instructor, description or status.
3.	Receive email notification when a course becomes active (Bonus feature): This feature is provided in the ‘Enroll into a course’ webpage. When an admin makes the course active, the student will receive an email regarding the change. This function is disabled in production, you can check courses_controller.rb to see the implementation in update method.

Testing: We’ve deployed a full test suit on the model of “Student”. The code for the test suite can be found in “test/models/student_test.rb”.

All extra credit features are implemented.



