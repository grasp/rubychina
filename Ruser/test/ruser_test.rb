require 'pathname'
pn = Pathname.new(File.dirname(__FILE__))

require File.join(pn,"test_helper.rb")
require File.join(pn,"ruser_helper.rb")

class RuserTest < ActiveSupport::TestCase

    def setup
     puts "setup test suite ...."
    prepare_watir
  end
  
  test "truth" do
    assert_kind_of Module, Ruser
  end
  
  test "sanity" do
   user_fill_register_form(@browser,@site_root,@user_name1,@user_name1,@user_email1,"123456",@mobile_phone1)
   #user_logout_login(@browser,@site_root,@user_name1,"123456")
  end
  
  
  def teardown
  #  puts "look at your browser, enter to close......"
  #  `pause`
  `read 1 -p "Press Enter key to continue..."`
     @browser.close
    puts "run test suite done!"
  end
end
