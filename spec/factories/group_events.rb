FactoryGirl.define do
  factory :group_event do
    start       '2017-01-20 10:00:00'
    stop        '2017-01-22 18:00:00'
    duration    2
    user_id     { Faker::Number.number(5) }
    name        { Faker::Name.name }
    description { Faker::Name.name }
    location    { Faker::Name.name }
    published   { Faker::Boolean.boolean }    # true
    deleted     { Faker::Boolean.boolean(0.2) } # false

    trait :group_event2 do
      start       '2017-01-12 18:00:00'
      stop        '2017-01-12 22:00:00'
      duration    1
      user_id     { Faker::Number.number(5) }
      name        { Faker::Name.name }
      description 'Great weekend for the whole team'
      location    { Faker::Name.name }
      published   { Faker::Boolean.boolean }
      deleted     { Faker::Boolean.boolean(0.2) }
    end

    trait :group_event3 do
      start       '2017-02-15 10:00:00'
      stop        '2017-02-25 18:00:00'
      duration    10
      user_id     { Faker::Number.number(5) }
      name        { Faker::Name.name }
      description 'Great weekend for the whole team'
      location    { Faker::Name.name }
      published   { Faker::Boolean.boolean }
      deleted     { Faker::Boolean.boolean(0.2) }
    end

    trait :group_event_to_remove do
      start       '2017-02-15 10:00:00'
      stop        '2017-02-25 18:00:00'
      duration    10
      user_id     2
      name        'Weekend'
      description 'Great weekend for the whole team'
      location    'Paris'
      published    false
      deleted      false
    end

    trait :group_event_to_publish do
      start       '2017-02-15 10:00:00'
      stop        '2017-02-25 18:00:00'
      duration    10
      user_id     2
      name        'Weekend'
      description 'Great weekend for the whole team'
      markdown_description 'Great weekend for the whole team'
      location    'Paris'
      published    false
      deleted      false
    end

    trait :can_not_publish_two_nils do
      start       '2017-02-15 10:00:00'
      stop        '2017-02-25 18:00:00'
      duration    10
      user_id     nil
      name        nil
      description 'Great weekend for the whole team'
      location    'Paris'
      published    false
      deleted      false
    end

    trait :can_not_publish_one_nil do
      start       '2017-02-15 10:00:00'
      stop        '2017-02-25 18:00:00'
      duration    10
      user_id     3
      name        nil
      description 'Great weekend for the whole team'
      location    'Paris'
      published    false
      deleted      false
    end

    trait :event_stop_less_start do
      start       '2017-02-15 10:00:00'
      stop        '2017-01-05 08:00:00'
      duration    10
      user_id     2
      name        'Weekend'
      description 'Great weekend for the whole team'
      location    'Paris'
      published    false
      deleted      false
    end

    trait :event_start_less_current do
      start       '2016-12-29 10:00:00'
      stop        '2017-02-05 18:00:00'
      duration    10
      user_id     2
      name        'Weekend'
      description 'Great weekend for the whole team'
      location    'Paris'
      published    false
      deleted      false
    end

    trait :event_value_stop_time do
      start       '2017-01-05 10:00:00'
      stop        nil
      duration    5
      user_id     2
      name        'Weekend'
      description 'Great weekend for the whole team'
      location    'Paris'
      published    false
      deleted      false
    end

  end
end
