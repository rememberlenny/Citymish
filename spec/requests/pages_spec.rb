require 'spec_helper'

describe "Pages" do

  subject { page }

  shared_examples_for "all static pages" do
    it { should have_selector('h1', text: heading) }
    it { should have_title(full_title(page_title)) }
  end

  describe "Home page" do
    before { visit root_path }
    let(:heading)    { 'Collect data with purpose' }
    let(:page_title) { '' }

    it_should_behave_like "all static pages"
    it { should_not have_title('| Citymission') }

    describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        FactoryGirl.create(:micropost, user: user, content: "Lorem")
        FactoryGirl.create(:micropost, user: user, content: "Ipsum")
        sign_in user
        visit root_path
      end

      it "should render the user's feed" do
        user.feed.each do |item|
          expect(page).to have_selector("li##{item.id}", text: item.content)
        end
      end

      describe "follower/following counts" do
        let(:other_user) { FactoryGirl.create(:user) }
        before do
          other_user.follow!(user)
          visit root_path
        end

        it { should have_link("0 following", href: following_user_path(user)) }
        it { should have_link("1 followers", href: followers_user_path(user)) }
      end
    end
  end


  describe "Hello" do
    before { visit '/hello' }
    let(:heading)    { '7 things to know about Citymission' }
    let(:page_title) { 'What is Citymission?' }

    it_should_behave_like "all static pages"
    it { should have_title('What is Citymission? | Citymission') }
  end

  describe "Help" do
    before { visit '/hello' }
    let(:heading)    { 'Here to help' }
    let(:page_title) { 'Here to help' }

    it_should_behave_like "all static pages"
    it { should have_title('Here to help | Citymission') }
  end

end
