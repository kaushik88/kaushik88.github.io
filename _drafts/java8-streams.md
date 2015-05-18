---
layout: post
title: "Java 8 Streams"
tags:
- Code
- Java
thumbnail_path: blog/personal/running-start.jpeg
add_to_popular_list: true
---

One of the interesting features that was introduced as a part of Java 8 was the Stream API. The Stream API provides functional-style transformation and aggregation operators that can be applied on top of Java Collections.

### Motivation ###

With increasing support for data manipulation/transformation APIs by other languages, Java is finally catching up to Scala’s Collection API or Microsoft’s LINQ. To illustrate the need, consider this example — Given a collection of tennis matches in 2010, find the number of matches won by Rafael Nadal.

### The Iterative Way or External Iteration ###


**External Iteration** 
In the above function, the for-each loop calls the iterator() function of java.util.List and processes each and every element. At every iteration, the current value of the partial sum (numberOfMatchesNadalWon) is read and is updated by 1 — thus making this a sequential execution — while this might be a desired scenario, in most cases this might not be mandatory and hence the sequential execution hampers the performance.

Also note that, the programmer has translated the problem statement which clearly states the steps needed (1. filter by name and 2. get the count) into a flow that is understood by the computer. The programmer has mixed the logic and the flow thereby the computer doesn’t have the knowledge to perform certain optimizations like parallel execution, lazy evaluation etc.

**The Functional Way or Internal Iteration**

While in the external iteration, the logic and the flow is mixed, in the internal iteration, the programmer dictates the logic while the API or the library dictates the flow. This style also makes it easy for the API to parallelize the execution.

### Streams ###
The Stream API exposes a few functional operators and some of the most frequently ones are as Map, Filter, FlatMap, Reduce and Sorted. I recently scraped the internet and collected some Tennis data — a list of all matches that was played from 2003 to 2013 which is used to demonstrate the Stream API below —

**Map**
There were 64 Tennis tournaments played in the calendar year of 2010.


**Map Function**
The map operator converts (or maps) a Stream<T> to a Stream<U> — in the above example, the map function takes in an object of class TennisMatch (T) and returns a String (U).

Filter
Among the 64, unfortunately, there are only 6 grass court tournaments played in a year — Wimbledon and 5 minor grass court tournaments (ATP 250 level).


Filter Operation
The filter operator takes in a lambda function as a parameter — the function takes in an argument of type T and returns a Boolean value. All the objects of type T which return the value false are filtered out. In the above example, the lambda function takes in an object of type ‘TennisMatch’ and returns true if the surface of the tournament is grass.

FlatMap
There were 321 players who played atleast 1 match in 2010.


FlatMap operation
The flatMap is a combination of 2 operators — map and flatten (as the name suggests). In the above example, the lambda function takes in an object of type TennisMatch and returns a Stream<Player> (the map part) which gets flattened out to return an object of type Player.

Reduce
Winners hit 5714 aces more than the losers in all the Tennis matches in 2010.


Reduce Operation
The reduce function takes in an identity value (0 in the case of addition), and a lambda function — the lambda function takes in 2 parameters of Type T and returns a value of type T. Note that only commutative and associative operators can be performed using a reduce as the order in which the elements would be passed in is in-deterministic.

Sorted
The longest match in 2010 was between John Isner and Nicolas Mahut which lasted for 665 minutes.


Sorted operation
GroupBy
The ratio of the number of matches played in a year on Grass:Clay:Hard is 1:3:5.7.


GroupBy operation
The above code groups a Tennis Match by the Tournament Surface and applies an aggregator function (Collectors.counting()) to find the number of elements in every group.

Some things to note about streams in Java 8 -

Notes
It is Functional
It supports Lazy Evaluation
It supports Parallel Execution — The Stream API dictates the flow and the API has full control of it’s execution.
It cannot be Reused— A stream once used cannot be used again for further transformation.
Streams can be infinite — Since streams have operators like skip() and limit(), theoretically infinite streams are possible.
Resources
Documenation
David Hartveld Blogpost
Lambdas and Streams in Java 8