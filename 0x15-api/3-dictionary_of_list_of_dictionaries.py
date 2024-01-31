#!/usr/bin/python3
"""Retrieves to-do list information of all user and stores in json file."""
import json
import requests
import sys

if __name__ == "__main__":
    rootUrl = "https://jsonplaceholder.typicode.com/users"
    users = requests.get(rootUrl).json()
    storeUsers = {}
    for user in users:
        id, username = user["id"], user["username"]
        url = f"{rootUrl}/{id}/todos"
        tasks = requests.get(url).json()
        storeUser = {str(id): [{
                                "username": username,
                                "task": task["title"],
                                "completed": task["completed"]
                                } for task in tasks]}
        storeUsers.update(storeUser)
    filename = "todo_all_employees.json"
    with open(filename, "w") as file:
        json.dump(storeUsers, file)
