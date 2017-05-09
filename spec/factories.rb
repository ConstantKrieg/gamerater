FactoryGirl.define do
  factory :user do
    username "Pekka"
    password "Foobar1"
    password_confirmation "Foobar1"
  end

  factory :publisher do
    name "Kunos"
  end

  factory :game do
    name "Assetto Corsa"
  end

  factory :review do
    title "re"
    score 10
    content "asdfg"
  end 

  

  factory :platform do
    title "anonymous"
    description "asdf"
  end

  

  
end