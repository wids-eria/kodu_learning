# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :level do
    sequence(:name)  {|n| "level#{n}" }
    level_file { Rack::Test::UploadedFile.new(Rails.root.join('features', 'input_files', 'example_level.kodu'), 'application/octet-stream') }
    user
  end
end
