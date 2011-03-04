require "./greeter"

#declaring example group
describe "RSpec Greeter" do
#declaring example
  it "should say 'Hello RSpec!' when it receives the greet() message" do
# Given - the context that we set up and take for granted as a starting point
    greeter = RSpecGreeter.new
# When - the action that we are focused on
    greeting = greeter.greet
# Then - the expected outcome
    greeting.should == "Hello RSpec!"
  end
end
