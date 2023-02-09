FactoryBot.define do
  factory :builder, class: 'M3ta::Builder' do
    site_name { Faker::Lorem.sentence }
    type { 'website' }
    title { Faker::Lorem.words(number: 2) }
    description { Faker::Lorem.paragraph(sentence_count: 2) }
    url { Faker::Internet.url }
    image { Faker::Internet.url }
    keywords { Faker::Lorem.words(number: 2).join(', ') }
    player { Faker::Internet.url }
    video { Faker::Internet.url }
    
    facebook_app_id { Faker::Number.number(digits: 10) }
    twitter_handle { "@#{Faker::Lorem.word}" }
  end
end