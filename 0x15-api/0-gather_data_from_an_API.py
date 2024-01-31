#!/usr/bin/python3
"""Retrieves to-do list information for a given employee ID."""
import requests
import sys

if __name__ == "__main__":
    url1 = f"https://jsonplaceholder.typicode.com/users/{sys.argv[1]}"
    url2 = f"https://jsonplaceholder.typicode.com/users/{sys.argv[1]}/todos"
    res1 = requests.get(url1)
    res2 = requests.get(url2)
    employee = res1.json()['name']
    tasks = res2.json()
    num_tasks = len(tasks)
    done = 0
    for task in tasks:
        if task['completed'] is True:
            done += 1
    print(f'Employee {employee} is done with tasks ({done}/{num_tasks}):')
    for task in tasks:
        if task['completed'] is True:
            title = task['title']
            print(f'\t {title}')
