shared_examples :successful_group_events_rows_count do
  it '- check GroupEvent have rows count - Ok' do
    group_events_count =  GroupEvent.all.count
    expect(group_events_count).to eq(rows_qty) # got rows_qty of GroupEvent
  end
end

