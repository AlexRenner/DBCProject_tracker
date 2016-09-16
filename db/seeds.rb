cohort = Cohort.create(name: 'salamanders')
cohort1 = Cohort.create(name: 'bobolinks')
cohort2 = Cohort.create(name: 'red pandas')
cohort3 = Cohort.create(name: 'dragonflies')
cohort4 = Cohort.create(name: 'wolves')

Team.create(name: 'Unassigned')

5.times{Team.create(name: Faker::Company.name)}

round = Round.create(cohort_id: 1)

User.create(first_name: 'Avner', last_name: 'Shannon', email: 'avner.shannon@fragrances.com', password: 'password', teacher: true)

16.times{User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: 'password', teacher: false, cohort: cohort)}
16.times{User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: 'password', teacher: false, cohort: cohort1)}
16.times{User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: 'password', teacher: false, cohort: cohort2)}
16.times{User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: 'password', teacher: false, cohort: cohort3)}
16.times{User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: 'password', teacher: false, cohort: cohort4)}

#Salamanders
Project.create(title: 'Battleship', description: 'A new web based version of the classic board game', cohort: cohort,  user_id: (rand(16)+2))
Project.create(title: 'Research Tracker', description: 'A web app for tracking and maintaining research records', cohort: cohort,  user_id: (rand(16)+2))
Project.create(title: 'DBC Project Tracker', description: 'A web app for organizing and assigning projects to students within a cohort', cohort: cohort,  user_id: (rand(16)+2))
Project.create(title: 'WikiMedia', description: 'Online source for user generated news', cohort: cohort,  user_id: (rand(16)+2))
Project.create(title: 'Lazr', description: 'Phone based technology to play lazer tag', cohort: cohort,  user_id: (rand(16)+2))
Project.create(title: 'Save-A-Penny', description: 'An app for transfering a set amount of money to a savings account with every debit/credit purchase', cohort: cohort,  user_id: (rand(16)+2))

#Bobolinks
Project.create(title: 'Save the Lions', description: 'A new web based version of the classic board game', cohort: cohort1,  user_id: (rand(16)+2))
Project.create(title: 'Bob the Builder', description: 'Help Bob build the toys', cohort: cohort1,  user_id: (rand(16)+2))
Project.create(title: 'Santa Crazy', description: 'A phaser game flappy bird style but with reindeers and sleighs', cohort: cohort1,  user_id: (rand(16)+2))
Project.create(title: 'Run Forrest Run', description: 'All things Forrest Gump. Trivia app', cohort: cohort1,  user_id: (rand(16)+2))
Project.create(title: 'Cookie Overflow', description: 'All the cookies in the ovens', cohort: cohort1,  user_id: (rand(16)+2))
Project.create(title: 'Save-A-Cup', description: 'Inciting public action to recycle!', cohort: cohort1,  user_id: (rand(16)+2))

#Redpandas
Project.create(title: 'Battleshits', description: 'Help us help the pigeons drop shit on unsuspecting victims', cohort: cohort2,  user_id: (rand(16)+2))
Project.create(title: 'BigFoot Tracker', description: 'A web app for tracking and maintaining research records on Big Foot', cohort: cohort2,  user_id: (rand(16)+2))
Project.create(title: 'Carbon Calculator', description: 'A web app for determining your carbon footprint', cohort: cohort2,  user_id: (rand(16)+2))
Project.create(title: 'Greenthumb Guru', description: 'Online resource for gardening', cohort: cohort2,  user_id: (rand(16)+2))
Project.create(title: 'Lazy Lions', description: 'Idk. These lions are going to starve without our help.', cohort: cohort2,  user_id: (rand(16)+2))
Project.create(title: 'Elgoog', description: 'The classic google engine to display everything backwards', cohort: cohort2,  user_id: (rand(16)+2))

#Dragonflies
Project.create(title: 'Movie or Song?', description: 'Is that a movie or song lyric?', cohort: cohort3,  user_id: (rand(16)+2))
Project.create(title: 'Rugrats Reunion', description: 'Bringing back Chuckie with a twist.', cohort: cohort3,  user_id: (rand(16)+2))
Project.create(title: 'The Worst Idea Ever', description: 'An app to share horror stories. Upvote and downvote to pick a grand winner!', cohort: cohort3,  user_id: (rand(16)+2))
Project.create(title: 'Find the Missing ****', description: 'Can you fill in the blank? Fun adventure style game', cohort: cohort3,  user_id: (rand(16)+2))
Project.create(title: 'I see with my little eye', description: 'Mobile version of the classic game', cohort: cohort3,  user_id: (rand(16)+2))
Project.create(title: 'National Park Tracker', description: 'Find all the reviews of the best hiking paths in our great country', cohort: cohort3,  user_id: (rand(16)+2))

#Wolves
Project.create(title: 'DBC Overflow', description: 'All things and memes about Dev Bootcamp', cohort: cohort4,  user_id: (rand(16)+2))
Project.create(title: 'Calorie Counter', description: 'Count your calories and your steps all in one app', cohort: cohort4,  user_id: (rand(16)+2))
Project.create(title: 'Telephone', description: 'Classic version of the telephone game but now on the web!', cohort: cohort4,  user_id: (rand(16)+2))
Project.create(title: 'Bee thankful', description: 'Bees pick up on social media cues and generate reasons for you to smile and be happy', cohort: cohort4,  user_id: (rand(16)+2))
Project.create(title: 'Drivr', description: 'The best of Uber, Lyft, and Taxis now all in one', cohort: cohort4,  user_id: (rand(16)+2))
Project.create(title: 'Penniless', description: 'An app to donate all the pennies off your credit card transactions', cohort: cohort4,  user_id: (rand(16)+2))

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







