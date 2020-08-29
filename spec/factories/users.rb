FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    name { Faker::Name.name }
    email { Faker::Internet.free_email }
    date { Faker::Date.backward }
    password = Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
    first_name { person.first.kanji }
    last_name { person.last.kanji }
    first_name_kana { person.first.katakana }
    last_name_kana { person.last.katakana }
  end
end

# factories/user.rbはで自分でファイル生成