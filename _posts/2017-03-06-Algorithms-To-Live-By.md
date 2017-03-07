---
layout: post
title: "Algorithms to Live By"
tags:
- Books
categories:
- Learn
thumbnail_path: blog/personal/algorithms_to_live_by.jpg
---

In the book **Algorithms To Live By**, Christian and Griffiths show how much we can learn from Computer Algorithms. The book goes over many algorithms like *Optimal Stopping*, *Explore/Exploit*, *Caching*, *Scheduling*, *Predicting*, *Networking* etc. I'm not sure what I can take away from these algorithms and apply them in my daily life but this was a fun read for me. Nevertheless, the book requires no prior knowledge of Computer Algorithms and I assume it would be a fun read for everyone. This blog post is about some of the algorithms from the book.

### The Secretary Problem

Imagine that you're interviewing a set of candidates for a secretary position and your goal is to hire the best secretary. However, there are a couple of conditions - 

* You interview the candidates in random order, one at a time. You can decide to offer the job to a candidate and they're guaranteed to accept. However, if you pass over a candidate, deciding not to hire them, they are gone forever.

* Before interviewing a candidate, you do not have access to any absolute scores (like test scores, typing speeds etc) but after interviewing a couple of candidates, you'll be able to easily compare them and have a relative ordering.

Naturally, there are many applications to this problem (with minor variations to the conditions) - apartment hunting and dating for example. These problems are commonly called as *Optimal Stopping* - when to stop looking. 

Read the book to find out the optimal stopping point :)

### Exponential Backoff

Consider the scenario where your computer is pinging a website but the website appears to be down. Now, your computer has a few options for retrying - don't ping at all (too severe) or keep pinging every second until the website responds (waste of resources). This is where exponential backoff comes in - this recommends that you increase the time between the pings exponentially. If you plot the time intervals, you'll find an exponential curve like the one below - 

{% include figure.html path="blog/personal/exponential.png" alt="Exponential Curve" %}

A practical application of this in real life is handling your friend who has the habit of flaking on social plans. You don't want to not call your friend again (too severe) and you also don't want to keep calling your friend every time (too naive).

### Prisoner's Dilemma

Imagine that you and a co-conspirator have been arrested after robbing a bank. Both of you are held in separate jails and are not allowed to communicate with each other. You are being investigated about the crime and here are the possible options - 

* If both you and your co-conspirator remain silent, then both of you walk away and can split the money robbed from the bank.
* If you rat out your partner and the partner says nothing, you walk away free with the entire money while your partner goes to jail for 10 years.
* If both of you inform on each other, then you'll share the blame and split the sentence - 5 years each.

As you cannot control what the other person does, **it's always *better* for you to rat out your partner**. If your partner stays silent, then you walk out free with the entire money else you split the term with your partner. This is still better than the jail term of 10 years. Besides being immoral, the problem with this approach is that if everyone follows this approach then everyone ends up with a 5 year sentence.

This problem is common in our daily lives too. Say that you and your colleague can each work 5 days a week, rest during the weekends and get 10% year-end bonus. However, if one of you work more than the other (say for 7 days a week), then that person gets 20% bonus while the other person gets nothing. What do you do? How do you solve this problem?

Read the book to find out :D