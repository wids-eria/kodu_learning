FactoryGirl.define do
  factory :user do
    sequence(:email)      {|n| "user#{n}@example.com" }
    sequence(:first_name) {|n| "fname#{n}" }
    sequence(:last_name)  {|n| "lname#{n}"  }
    password "Passw0rd"
    teacher false

    factory :teacher do
      teacher true
    end

    factory :student do
      teacher false
    end
  end

end
