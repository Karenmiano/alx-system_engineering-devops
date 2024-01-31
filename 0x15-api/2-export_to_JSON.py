#!/usr/bin/python3
"""Retrieves to-do list information of user and stores in json file."""
import json
import requests
import sys

if __name__ == "__main__":
    url1 = f"https://jsonplaceholder.typicode.com/users/{sys.argv[1]}"
    url2 = f"https://jsonplaceholder.typicode.com/users/{sys.argv[1]}/todos"
    res1 = requests.get(url1)
    res2 = requests.get(url2)
    employee = res1.json()
    id, username = employee["id"], employee["username"]
    tasks = res2.json()
    store_format = {str(id): [{"task": task["title"],
                               "completed": task["completed"],
                               "username": username} for task in tasks]}
    filename = f'{id}.json'
    with open(filename, "w") as file:
        json.dump(store_format, file)
