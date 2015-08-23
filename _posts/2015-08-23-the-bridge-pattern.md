---
layout: post
title: "The Bridge Pattern"
tags:
- DesignPattern
categories:
- Code
thumbnail_path: blog/linkedin/bridge.gif
---

This is the second post in a series of blogposts on [Design Patterns](https://en.wikipedia.org/wiki/Software_design_pattern). You can read about The Strategy Pattern [here](http://kaushik88.github.io/blog/2015/08/18/the-strategy-pattern/).

**Intent**

1. The bridge pattern is used when we want to separate a varying entity from a varying behavior.
2. The Gang of Four defines the Bridge Pattern as *Separate an abstraction from its implementation so that the two can vary independently*.

**Example**

{% include figure.html path="blog/linkedin/bridge-incorrect.png" alt="Bridge Design Pattern" %}

Assume that you've to write a program that draws a rectangle. Since you've 2 drawing libraryies, you decide to create an abstract class called *Rectangle* and have the two versions extend this. But then after some time, we need to draw a circle too. So, we decide to create an abstract class called *Shape* and have both *Rectangle* and *Circle* extend it.

The problem with this approach is that scaling the behavior (drawing a line) also depends on scaling the entitities (rectangle, circle etc).

**Structure**

In this design pattern, the AbstractBehavior is passed as a parameter to AbstractEntity. This gives the AbstractBehavior to vary independently of the AbstractEntity.

{% include figure.html path="blog/linkedin/bridge.gif" alt="Bridge Design Pattern" %}


A way to achieve this procedurally is through nested branching statements - you can clearly see why this doesn't scale.

{% highlight java %}
if(entityConditionA) {
	if(behaviorConditionA) {
		// Algorithm A1;
	} else {
		// Algorithm A2;
	}
} else {
	if(behaviorCondition1) {
		// Algorithm B1;
	} else {
		// Algorithm B2;
	}
}
{% endhighlight %}


**Code**

{% highlight java %}

public class AbstractEntity {
	protected AbstractBehavior myBehavior;
	public AbstractEntity(AbstractBehavior aBehavior) {
		myBehavior = aBehavior;
	}

	public abstract void request();
}

public class ConcreteEntityA extends AbstractEntity {
	public ConcreteEntityA(AbstractBehavior aBehavior) {
		super(aBehavior);
	}

	public void request() {
		myBehavior.operation1();
	}
}

public class ConcreteEntityB extends AbstractEntity {
	public ConcreteEntityB(AbstractBehavior aBehavior) {
		super(aBehavior);
	}

	public void request() {
		myBehavior.opration2();
	}
}

public abstract class AbstractBehavior {
	public abstract void operation1();
	public abstract void operation2();
}

public class ConcreteBehaviorA extends AbstractBehavior {
	public void operation1() {
		// Behavior 1A
	}

	public void operation2() {
		// Behavior 2A
	}
}

public class ConcreteBehaviorB extends AbstractBehavior {
	public void operation1() {
		// Behavior 1B
	}

	public void operation2() {
		// Behavior 2B
	}
}
{% endhighlight %}