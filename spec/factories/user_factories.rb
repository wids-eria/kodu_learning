FactoryGirl.define do
  factory :user, aliases: [:author] do
    sequence(:email)      {|n| "user#{n}@example.com" }
    sequence(:first_name) {|n| "fname#{n}" }
    sequence(:last_name)  {|n| "lname#{n}"  }
    sequence(:gamer_tag)  {|n| "gamer_#{n}"  }
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
