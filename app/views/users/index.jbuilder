json.array! @users do |u|
  json.id u.id
  json.admin u.admin
  json.editor u.editor
  json.contributor u.contributor
  json.username u.username
  json.name u.name
  json.picture u.picture
  json.banned u.banned
end
