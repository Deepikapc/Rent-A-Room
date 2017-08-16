if @user.nil?
	node(:success) { true }
	node(:msg) {"username can be used"}
else
	node(:success) { false}
	node(:msg) {"username already taken"}
end