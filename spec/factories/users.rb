FactoryBot.define do
  factory :user do
    nickname {'testマン'}
    email {'test@email'}
    password {'abc123'}
    password_confirmation {password}
    first_name {'佐藤'}
    last_name {'次郎'}
    first_name_kana {'サトウ'}
    last_name_kana {'ジロウ'}
    birthday {"2000-01-01"}
  end
end
