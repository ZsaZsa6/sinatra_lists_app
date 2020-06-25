

u = User.create[(username: "rdc", password: "password")]
lists.each do |l|
    List.create(title: l, category: l, content: l, user: u)
end
