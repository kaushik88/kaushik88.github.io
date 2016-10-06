1. heroku login -> Enter Username and Password
2. FB app - https://developers.facebook.com/apps/ - App ID: 1806496309579153
3. FB Page - EAAZAqZC7LSDZAEBAP5Fq3ZBKK2jpexwai7pBeXN0ZB7DZBXXC9tUX1KAvHGy9HOWOQiRZCVK3B760hf3tQEnbtOWp64rchkEnUJ4m513W8KpqQerGKxaex7I49DlgydWNNzBZBAnvEFdKsTnWCAnjC173kYJXL84ZBTuxisiKOlY3YwZDZD

4. curl -X POST "https://graph.facebook.com/v2.6/me/subscribed_apps?access_token=<PAGE_ACCESS_TOKEN>"

curl -X POST "https://graph.facebook.com/v2.6/me/subscribed_apps?access_token=EAAZAqZC7LSDZAEBAP5Fq3ZBKK2jpexwai7pBeXN0ZB7DZBXXC9tUX1KAvHGy9HOWOQiRZCVK3B760hf3tQEnbtOWp64rchkEnUJ4m513W8KpqQerGKxaex7I49DlgydWNNzBZBAnvEFdKsTnWCAnjC173kYJXL84ZBTuxisiKOlY3YwZDZD"
sqw