require 'spec_helper'

describe "LayoutLinks" do
  
	it "should have Home at '/'" do
		get '/'
		response.should have_selector('title', :content => "Home")
	end
	
	it "should have Contact at '/contact'" do
		get '/contact'
		response.should have_selector('title', :content => "Contact")
	end
	
	it "should have About at '/about'" do
		get '/about'
		response.should have_selector('title', :content => "About")
	end
	
	it "should have Help at '/help'" do
		get '/help'
		response.should have_selector('title', :content => "Help")
	end
    
    it "should have a Sign Up page at '/signup'" do
        get '/signup'
        response.should have_selector('title', :content => "Sign Up")
    end
	
end
