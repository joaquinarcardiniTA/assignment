#create user
User.create(email: 'student@test.com', password: 'password', type: User.statuses["student"])
User.create(email: 'teacher@test.com', password: 'password', type: User.statuses["teacher"])

#create company
student = Student.find_by_email('student@test.com')
5.times{ |count| Company.create(name: "Company#{count}", country: 'AU', student_id: student.id) }

#create cash_management
Company.all.each do |company|
	5.times{ company.cash_managements.create(initial_cash: rand(500..10000), cash_out: rand(500..10000), cash_in: rand(500..10000), entry_month: Date::MONTHNAMES[rand(1..12)]) }
end