shared_examples :successful_users_rows_count do
  it '- check User have rows count - Ok' do
    users_count =  User.all.count
    expect(users_count).to eq(rows_qty)
  end
end

