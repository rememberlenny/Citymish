require 'spec_helper'

describe Mission do

  let(:user) { FactoryGirl.create(:user) }
  before do
    # This code is not idiomatically correct.
    @mission = Mission.new(description: "Lorem ipsum", user_id: user.id)
  end

  subject { @mission }

  it { should respond_to(:description) }
  it { should respond_to(:user_id) }
end
