import requests

# Accounts to follow
accts = ["", ""]

# Set server and auth token
server = ""
authToken = ""

# Set auth
auth = {'Authorization': 'Bearer ' + authToken}

# Get id for each account
for acct in accts:

    # Put lookup URL together
    lookupUrl = 'https://' + server + '/api/v1/accounts/lookup?acct=' + acct

    # Post message
    lookupRequest = requests.get(lookupUrl)

    # Handle lookup results
    if lookupRequest.status_code == 200:
        data = lookupRequest.json()
        acctId = data["id"]
        print("\nGot ID: " + acct + " = " + str(acctId))

        # Create follow URL
        followUrl = 'https://' + server + '/api/v1/accounts/' + acctId + '/follow'

        # Follow account
        followRequest = requests.post(followUrl, headers=auth)

        # Handle follow result
        if followRequest.status_code == 200:
            print("Successfully followed " + acct)
        else:
            print("Follow Error: " + str(followRequest) + " for " + acct)
    else:
        print("\nLookup Error: " + str(lookupRequest) + " for " + acct)
