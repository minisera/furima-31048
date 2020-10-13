FactoryBot.define do
  factory :user do
    nickname              { 'tanaka' }
    first_name            { '太郎' }
    last_name             { '田中' }
    first_name_katakana   { 'タロウ' }
    last_name_katakana    { 'タナカ' }
    birthday              { '2000-01-01' }
    email                 { 'kkk@gmail.com' }
    password              { 'a1a1a1' }
    password_confirmation { password }
    
  end
 
end
