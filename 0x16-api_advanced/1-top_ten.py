#!/usr/bin/python3
"""
Defines one function top_ten(subreddit)
"""

import requests


def top_ten(subreddit):
    """
    Prints the titles of the first hot posts for a subreddit
    """
    url = f'https://www.reddit.com/r/{subreddit}/hot.json'
    params = {'limit': 10}
    headers = {'User-Agent': 'python:hotposts by Karen_miano'}
    response = requests.get(url, headers=headers,
                            params=params,
                            allow_redirects=False)
    if response.status_code == 200:
        data = response.json()
        for post in data['data']['children']:
            print(post['data']['title'])
    else:
        print('None')
