#!/usr/bin/python3
"""
Defines only one function, number_of_subscribers
"""

import requests


def number_of_subscribers(subreddit):
    """
    Returns the number of subscribers for a given subreddit
    """
    if subreddit is None or not isinstance(subreddit, str):
        return 0
    url = f'https://www.reddit.com/r/{subreddit}/about.json'
    headers = {'User-Agent': 'python:subscriber.counter by Karen_miano'}
    response = requests.get(url, headers=headers, allow_redirects=False)
    if response.status_code == 200:
        data = response.json()
        subscribers = data.get('data').get('subscribers')
        return subscribers
    return 0
