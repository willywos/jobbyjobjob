FactoryBot.define do
  factory :resume do
    name { "Test Resume" }
    user_id { 1 }
    data { {"basics" => {
              "name" => "Test user",
              "label" => "Des Moines, IA",
              "picture" => "",
              "email" => "wwilimek@gmail.com",
              "phone" => "515-555-5555",
              "website" => "https://www.jobbyjobjob.net",
              "summary" => "Experienced Web Developer and Web Tester",
              "location" => {
                "address" => "1234 Some St",
                "postalCode" => "50322",
                "city" => "Des Moines",
                "countryCode" => "US",
                "region" => ""
              }
            }
        }
      }
  end
end
