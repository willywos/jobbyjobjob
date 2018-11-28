FactoryBot.define do
  factory :user do
    first_name { "Test" }
    last_name { "User" }
    address { "1234 Some St." }
    state {"IA"}
    zip {"50322"}
    email {"testuser@jobbyjobjob.net"}
    password {"Password"}
    password_confirmation {"Password"}
  end
end
