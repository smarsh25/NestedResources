Comment.delete_all
Post.delete_all
User.delete_all

sm = User.create!(:email => "steve@test.com", :password => "test1234", :password_confirmation => "test1234")
j  = User.create!(:email => "joe@test.com", :password => "test1234", :password_confirmation => "test1234")
f  = User.create!(:email => "fred@test.com", :password => "test1234", :password_confirmation => "test1234")