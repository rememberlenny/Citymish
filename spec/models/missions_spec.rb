require 'spec_helper'

describe Mission do

  let(:user) { FactoryGirl.create(:user) }
  before { @mission = user.missions.build(name: "Mission name", content: "Lorem ipsum") }

  subject { @mission }

  it { should respond_to(:name) }
  it { should respond_to(:content) }
  it { should respond_to(:description) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should eq user }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @mission.user_id = nil }
    it { should_not be_valid }
  end

  describe "with blank content" do
    before { @mission.content = " " }
    it { should_not be_valid }
  end
end
