#!/usr/bin/python
import csv
from faker import Faker
import random
from random import randint
Faker.seed(2)

def makefake(records,headers):
    fake=Faker('en_US')
    with open("fakegrads.csv","wt") as f:
        writer = csv.DictWriter(f,fieldnames=headers)
        writer.writeheader()
        for i in range(records):
            Id = fake.unique.pyint(min_value=800000,max_value=801000)
            intent = ["2021-05-16","2021-09-12"]
            grad = random.choice(intent)
            writer.writerow({
                "ID": Id,
                "LAST":fake.unique.last_name(),
                "FIRST" : fake.unique.first_name(),
                "GRAD_DATE" : grad,
                })

if __name__ == '__main__':
    records = 150 
    headers = ["ID","LAST","FIRST","GRAD_DATE"]
    
    makefake(records,headers)
    print("your data is ready!")
