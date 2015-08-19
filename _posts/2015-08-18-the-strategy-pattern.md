---
layout: post
title: "The Strategy Pattern"
tags:
- DesignPattern
categories:
- Code
thumbnail_path: blog/linkedin/strategy.gif
---

This is the first post in a series of blogposts on [Design Patterns](https://en.wikipedia.org/wiki/Software_design_pattern).

**Intent**

1. Make a different behavior at different times for different clients requesting the service.
2. Define a family of algorithms, encapsulate each one, and make them interchangeable. Strategy lets the algorithm vary independently from clients that use it.

**Structure** 

{% include figure.html path="blog/linkedin/strategy.gif" alt="Strategy Design Pattern" %}

In this example, the *Client* calls the *Context* object. The *Context* object, gets an instance of the *Strategy* (either *ConcreteStrategy1* or *ConcreteStrategy2* or another *ConcreteStrategy*) object depending on some variable. If there is a new strategy, then just these 2 simple steps need to be done - 
	
	a. Add a new strategy object extending Strategy.

	b. Update the logic in the Context to decide when this new ConcreteStrategy 
	   would be picked.

One way to achieve this behavior through simple code is by a simple if-else statement (or any other branching logic) - 

{% highlight java %}
if(condition) {
	// Algorithm 1
} else {
	// Algorithm 2
}
{% endhighlight %}

The disadvantage of this approach is that - 

	1. If the logic that decides the algorithm is needed at multiple places, 
		then the code has to be repeated.
	2. More codebase reading for a new developer trying to add a new algorithm.


**Example**

A Strategy defines a set of algorithms that can be used interchangeably. 

Modes of transportation to an airport is an example of a Strategy. Several options exist such as driving one's own car, taking a taxi, an airport shuttle, a city bus, or a limousine service. All the modes perform the same function.

Various compression or decompression algorithms is another example of a Strategy. Depending on certain factors, the Context can change the compression algorithm which will perform both the compress and decompress operations.

**Code**

{% highlight java %}
	
public class Context {
	public void request() {
		// get Strategy 		
	}
}

public abstract class Stragegy {
	public abstract operation();
}

public class Strategy_V1 extends Strategy {
	public void operation() {
		// Implementation of V1
	}
}

public class Strategy_V2 extends Strategy {
	public void operation() {
		// Implementation of V2
	}
}
{% endhighlight %}

