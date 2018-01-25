Cangaroo::Connection.where(
  name:  'cangaroo_endpoint',
  url:   'http://localhost:3100',
  key:   'cangaroo',
  token: 'cangaroo_token'
).first_or_create
