---
layout: post
title: "The Adapter Pattern"
tags:
- DesignPattern
categories:
- Code
thumbnail_path: blog/linkedin/adapter.jpg
---

This is the third post in a series of blogposts on [Design Patterns](https://en.wikipedia.org/wiki/Software_design_pattern). You can read about The Strategy Pattern [here](http://kaushik88.github.io/blog/2015/08/18/the-strategy-pattern/) and about The Bridge Pattern [here](http://kaushik88.github.io/blog/2015/08/23/the-bridge-pattern/).

**Intent**

* To use the behavior of an existing object, using a different interface than it was designed with.
* To make an existing object exchangeable with a polymorphism set of objects

**Example**

An example of an adapter that I use in the real world is a car USB adapter - which looks like this which converts the 12v DC power socket input to a USB input.

{% include figure.html path="blog/linkedin/adapter.jpg" alt="Car USB Adapter" %}

**Structure**

A way to achieve this procedurally is to write a wrapper function - the wrapper function takes an object that is passed by the client, converts it to another object that is understood by a 3rd party API and then calls this API.

{% highlight java %}

public void callThirdPartyFunction(ExistingObject existingObject) {
	NewObject newObject = Adapter.convert(existingObject);
	thirdPartyAPI(newObject);
}

{% endhighlight %}

**Code**

