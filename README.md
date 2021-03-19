# c4l2021_poster

slides, sample files and some short scripts for my code4lib 2021 virtual presentation on evaluating matches between data sets from disparate sources using R's _stringsim_. it's a pretty simple presentation on some pretty simple functions, but i've been turning to R's string distance matching capabilities over and over again while working through a backlog of messy data projects. this has been super helpful for me, so i hope it's useful for someone else, too!

i talk about comparing patron data in this, which i would obviously never share, so i used python's _faker_ package to generate some fake patron data. `fake_grads.py` generates a list resembling the list of graduating students we recieve from the bursar's. `fake_patrons.py` generates a list resembling the patron list i grab from our ILS (currently voyager). i manually introduced some errors into `fakepatrons.csv` by doing a find/replace for random letter combos to illustrate the type of inexact matching i see between the two data sources (typos, mostly). 

`grad_patrons.R` is the process i use to evaluate matches by ID number and filter those needing review, to make sure our patron lisst and the grads list has the same ID assigned to the same person. `holdings_comparison.R` is an example of how i'd compare a package in our knowledge base to our print holdings in the ILS.
