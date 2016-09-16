cohort = Cohort.create(name: 'Salamanders')

Team.create(name: 'Unassigned')

4.times{Team.create(name: Faker::Company.name)}

round = Round.create(cohort_id: 1)

User.create(first_name: 'Avner', last_name: 'Shannon', email: 'avner.shannon@fragrances.com', password: 'password', teacher: true)

16.times{User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: 'password', teacher: false, cohort: cohort)}

Project.create(title: 'Battleship', description: 'A new web based version of the classic board game', cohort: cohort,  user_id: (rand(16)+2))

Project.create(title: 'Research Tracker', description: 'A web app for tracking and maintaining research records', cohort: cohort,  user_id: (rand(16)+2))

Project.create(title: 'DBC Project Tracker', description: 'A web app for organizing and assigning projects to students within a cohort', cohort: cohort,  user_id: (rand(16)+2))

Project.create(title: 'WikiMedia', description: 'Online source for user generated news', cohort: cohort,  user_id: (rand(16)+2))

Project.create(title: 'Lazr', description: 'Phone based technology to play lazer tag', cohort: cohort,  user_id: (rand(16)+2))

Project.create(title: 'Save-A-Penny', description: 'An app for transfering a set amount of money to a savings account with every debit/credit purchase', cohort: cohort,  user_id: (rand(16)+2))

vote = [0,1]
# starts at 2 in order to ommit the teacher
student_index = 2
16.times do
  Project.all.each do |project|
    to_vote = vote.sample
    if to_vote == 1
      Vote.create(voter: User.find(student_index), project: project, round: round, value: (rand(5)+1))
    end
  end
  student_index += 1
end







