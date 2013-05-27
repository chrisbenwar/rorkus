class User
	attr_accessor :name, :email

	def initialize(a = {})
		@name = a[:name]
		@email = a[:email]
	end

	def formatted_email
		"#{@name} <#{@email}>"
	end

	def do_anything
		puts 'Anything'
	end
end	

u = User.new({:name => 'Chris', :email => 'e.e.e'})
puts u.name
u.do_anything
puts u.formatted_email
