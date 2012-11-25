require 'spec_helper'

describe "Static pages" do

  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_selector('h1', :text => 'Home') }
    it { should have_selector('title', :text => "TEAM4OFHS") }
  end

  describe "Help page" do
    before { visit help_path }

    it { should have_selector('h1', :text => 'Help') }
    it { should have_selector('title', :text => "Help") }
  end

  describe "About page" do
    before { visit about_path }

    it { should have_selector 'h1', :text => 'About Us' }
    it { should have_selector 'title', :text => "About Us" }
  end

  describe "Testimonial" do
    before { visit testimonial_path }

    it { should have_selector 'title', :text => 'Testimonial' }
    it { should have_selector 'h1', :text => 'Testimonial' }
  end
end
