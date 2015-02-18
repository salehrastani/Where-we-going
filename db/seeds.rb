
require 'faker'

3.times do
  user = User.new(email: Faker::Internet.email)
  user.password = Faker::Lorem.word
  user.save
end


User.all.each do |user|
  user.surveys.create(name: Faker::Name.name)
end

Survey.all.each do |survey|
  2.times do
    survey.questions.create(content: Faker::Lorem.sentence)
  end
end

Question.all.each do |question|
  3.times do
    question.answer_choices.create(choice: Faker::Lorem.sentence)
  end
end
