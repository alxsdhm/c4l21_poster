#!/usr/bin/python
import csv
from faker import Faker
import random
from random import randint
Faker.seed(2)

def makefake(records,headers):
    fake=Faker('en_US')
    with open("fakepatrons.csv","wt") as f:
        writer = csv.DictWriter(f,fieldnames=headers)
        writer.writeheader()
        for i in range(records):
            Id = fake.unique.pyint(min_value=800000,max_value=801000)
            Patronid = randint(10000,100000)
            grps = ["PHD","STAFF","UNDERGRAD","GRAD"]
            group = random.choice(grps)
            charges = randint(0,5)

            writer.writerow({
                "ID": Id,
                "PATRONID" : Patronid,
                "LAST" :fake.last_name(),
                "FIRST" : fake.unique.first_name(),
                "GROUP" : group,
                "EXPIRE_DATE": fake.date_between(start_date='-3y',end_date='today'),
                "CURRENT_CHECKOUTS" : charges,
                })

if __name__ == '__main__':
    records = 500
    headers = ["ID","PATRONID","LAST","FIRST","GROUP","EXPIRE_DATE","CURRENT_CHECKOUTS"]

    
    makefake(records,headers)
    print("your data is ready!")
