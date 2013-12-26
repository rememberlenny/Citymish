require 'spec_helper'

describe "Mission pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "mission creation" do
    before { visit root_path }

    describe "with invalid information" do

      it "should not create a mission" do
        expect { click_button "Post" }.not_to change(Mission, :count)
      end

      describe "error messages" do
        before { click_button "Post" }
        it { should have_content('error') }
      end
    end

    describe "with valid information" do

      before { fill_in 'mission_content', with: "Lorem ipsum" }
      it "should create a mission" do
        expect { click_button "Post" }.to change(Mission, :count).by(1)
      end
    end
  end
end
