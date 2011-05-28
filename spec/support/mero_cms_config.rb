RSpec.configure do |c|
  c.before(:each) do
    MeroCms::Engine.current_user = :current_user
  end
end