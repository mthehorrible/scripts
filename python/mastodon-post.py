import requests

# Set server and auth token
server = ""
authToken = ""

# Prompt for message to post
message = input("Enter the message to post: ")

# Put info together
url = 'https://' + server + '/api/v1/statuses'
auth = {'Authorization': 'Bearer ' + authToken}
params = {'status': message}

# Post message
r = requests.post(url, data=params, headers=auth)

# Show server response
print(r)
