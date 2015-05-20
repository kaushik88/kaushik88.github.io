---
layout: post
title: "Implicits In Scala"
tags:
- Scala
categories:
- Code
thumbnail_path: blog/linkedin/scala.jpeg
---  

I’ve been developing in Scala for close to a year now and it has been a jolly ride so far. One of the topics that I found tough to understand was implicits. This post gives a brief introduction to implicits with some sample code.

**Implicit Functions** — Implicit functions take a single parameter and are automatically called (if in scope or is defined in the companion object of the target type) on the source type variable if there is a type mis-match. For example, consider the following example —

{% highlight scala %}

object TypeConversion {

  implicit def itoa(a :Int) :String = {
    a.toString
  }

  /*
   Example 1 -
      In this example, the Scala compiler first checks if there is a concat() method for Integers. If there is no such method, it checks if there is an implicit method defined that takes integer as an parameter.
    */
  val thirtyFour :String = 3.concat(4)

  /*
  Example 2 -
    In this example, the Scala compiler doesn't do an implicit conversion from Integer to
    String as the expression is a valid expression.
   */
  val thirtySix :Int = 3 * 12 // this works too

}
{% endhighlight %}

In this example, I’ve defined an implicit function that takes in an integer and returns a string. This enables me to use all functions of String (target type) on Integers (source type). Note that, the Scala compiler wouldn’t convert all Integers to Strings and would convert them only if the code wouldn’t compile in the first place.

Implicit Parameters — Consider the example where you want to define a function which needs to take in a value and needs to pretty print it with the currency symbol. Instead of passing the currency symbol every time, you can define a function which takes in an implicit variable of type Currency. When the function printAmount() is called, an implicit variable of type Currency is needed for it to compile successfully.

{% highlight scala %}
case class Currency(implicit val symbol:String)

object TypeParameters {

  def printAmount(amount :Double)(implicit currency: Currency) = {
    println(currency.symbol + amount)
  }
}

object Dollar {
  implicit val dollarCurrency = Currency("$")

  def printDollar(value :Double) = {
    TypeParameters.printAmount(value)
  }
}
{% endhighlight %}


Further Reading and Source Code— I’ve just touched the surface of implicits in Scala and there’s a lot more to it. Scala for the Impatient is a good book which would provide more information on this topic. Also, the source code for the examples described above can be found here.