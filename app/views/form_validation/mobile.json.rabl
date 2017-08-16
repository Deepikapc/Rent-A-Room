if @user.nil?
	node(:success) { true }
	node(:msg) {"mobile number can be taken"}

else
	node(:success) { false}
	node(:msg) {"mobile number already taken"}
end