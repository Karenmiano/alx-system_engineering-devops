#!/usr/bin/python3
"""
Defines one function recurse(subreddit, hot_list=[])
"""

import requests


def recurse(subreddit, hot_list=[], after=''):
    """
    Returns a list containing the titles of all hot articles for
    a given subreddit
    """
    url = f'https://www.reddit.com/r/{subreddit}/hot.json'
    headers = {'User-Agent': 'python:hotposts by Karen_miano'}
    params = {'after': after}

    response = requests.get(url, headers=headers, params=params)
    if response.status_code != 200:
        return None
    data = response.json()
    posts = data.get('data', {}).get('children', {})
    hot_list.extend([post.get('data').get('title') for post in posts])
    after = data['data']['after']
    if after is not None:
        return recurse(subreddit, hot_list, after)
    else:
        return hot_list
