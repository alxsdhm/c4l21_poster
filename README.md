# c4l2021_poster

Slides, sample files and some short scripts for my code4lib 2021 virtual presentation on evaluating matches between data sets from disparate sources using R's _stringsim_. It's a pretty simple presentation on some pretty simple functions, but I've been turning to R's string distance matching capabilities over and over again while working through a backlog of messy data projects. this has been super helpful for me, so I hope it's useful for someone else, too!

I talk about comparing patron data in this, which I would obviously never share, so I used Python's _Faker_ package to generate some fake patron data. `fake_grads.py` generates a list resembling the list of graduating students we recieve from the bursar's. `fake_patrons.py` generates a list resembling the patron list I grab from our ILS (currently Voyager). I manually introduced some errors into `fakepatrons.csv` by doing a find/replace for random letter combos to illustrate the type of inexact matching I see between the two data sources (typos, mostly). 

`grad_patrons.R` is the process I use to evaluate matches by ID number and filter those needing review, to make sure our patron list and the grads list has the same ID assigned to the same person. `holdings_comparison.R` is an example of how I'd compare a package in our knowledge base to our print holdings in the ILS.
