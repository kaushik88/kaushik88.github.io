---
layout: post
title: "Impression Discounting in Recommender Systems"
tags:
- RecommenderSystems
categories:
- Code
thumbnail_path: blog/personal/Less-is-More.jpeg
---

Recommender Systems generate a list of items, sorted in the decreasing order of score (an indiator of how relevant the item is), that needs to be presented to the user. Consider the example of Netflix which recommends movies to users. A movie is said to be *impressed* if the recommendation is seen by the user. Impression Discounting refers to finding the dicounting factor, derived from a function of the past impressions, that could be applied to the score so that the final sorted order is optimized.

There are various factors that could be used in modeling the discounting factor - 

  1. The number of times the item was impressed by the user.
  2. When the item was last impressed.
  3. Frequency of user visits to the recommender system.

The intuition behind impression discounting is to reduce the score of items that have been impressed by the user without taking any action and also to completely remove the item if the user has successfully completed the action. For example, if a movie was recommended to the user and the user has watched it, then the movie should not be recommended to the user again. Also, if the movie was recommended to the user multiple times and no action has been taken yet, then it is possible that the user doesn't like this movie and hence this movie should be given a lower score (discounted).

**Formal Definition of an Impression**


$$
\begin{align*}
  & \phi(x,y) = \phi \left(\sum_{i=1}^n x_ie_i, \sum_{j=1}^n y_je_j \right)
  = \sum_{i=1}^n \sum_{j=1}^n x_i y_j \phi(e_i, e_j) = \\
  & (x_1, \ldots, x_n) \left( \begin{array}{ccc}
      \phi(e_1, e_1) & \cdots & \phi(e_1, e_n) \\
      \vdots & \ddots & \vdots \\
      \phi(e_n, e_1) & \cdots & \phi(e_n, e_n)
    \end{array} \right)
  \left( \begin{array}{c}
      y_1 \\
      \vdots \\
      y_n
    \end{array} \right)
\end{align*}
$$