User.seed do |s|
  s.id = 1
  s.nickname = "いたばし"
  s.email = "aaa@gmail.com"
  s.password = "123"
  s.password_confirmation = "123"
end

User.seed do |s|
  s.id = 2
  s.nickname = "さかした"
  s.email = "iii@gmail.com"
  s.password = "avc"
  s.password_confirmation = "avc"
end

User.seed do |s|
  s.id = 3
  s.nickname = "やまみち"
  s.email = "yyy@gmail.com"
  s.password = "abc"
  s.password_confirmation = "abc"
end

User.seed do |s|
  s.id = 4
  s.nickname = "たなか"
  s.email = "fff@gmail.com"
  s.password = "akh"
  s.password_confirmation = "akh"
end
