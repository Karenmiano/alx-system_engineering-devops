#!/usr/bin/python3
"""Exports user to-do list info into a csv file ."""

import csv
import requests
import sys

if __name__ == "__main__":
    url1 = f"https://jsonplaceholder.typicode.com/users/{sys.argv[1]}"
    url2 = f"https://jsonplaceholder.typicode.com/users/{sys.argv[1]}/todos"
    res1 = requests.get(url1)
    res2 = requests.get(url2)
    employee = res1.json()['username']
    tasks = res2.json()
    userId = tasks[0]["userId"]
    filename = f'{userId}.csv'
    fields = ["userId", "username", "completed", "title"]
    with open(filename, 'w', newline='') as file:
        writer = csv.DictWriter(file,
                                fieldnames=fields,
                                quoting=csv.QUOTE_ALL,
                                restval=f"{employee}",
                                extrasaction="ignore")
        writer.writerows(tasks)
