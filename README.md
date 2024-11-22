# Project Yosenabe

In this assignment, you will develop a solver for the Japanese grid puzzle Yosenabe. To illustrate the rules of the game, consider the following grid.
<p align="center">
  <img src="img/yosenabe.png">
</p>
Given such a grid, initially without arrows, the task is to move each number surrounded by a frame into one of the gray areas along a straight line, respecting the following conditions:
<ul>
  <li> Each gray area must be populated with at least one moved number.</li>
  <li> The straight lines of any two moved numbers must not cross or meet at any grid cell.</li>
  <li> An area may be associated with a positive goal number, shown within it. If this is the case, then the numbers moved into the area must sum up exactly to the goal number.</li>
</ul>
The unique solution of the example, indicated by the arrows of the image, fulfills these conditions:
<ul>
  <li> The straight lines do not cross or meet.</li>
  <li> Some number is moved into each of the four gray areas.</li>
  <li> The bottom left area is associated with goal number 6, and the numbers 5 and 1, that add up to 6, are moved to it. The top right area is associated with goal number 4, and exactly number 4 is moved to it.</li>
</ul>
<p>
Note that the displayed solution is unique. One could try to move the two numbers 2 into the top right area, but that would leave the bottom right area unoccupied.
</p>
<p>
A number can be moved across an area. For instance, in our example the number 4 crosses the area in the middle. On the other hand, you may always assume that the move of a number stops at the first cell (with respect to its direction) of the area to which the number is moved. For instance, number 1 is moved to the cell (2,1), and there would be no solution if we moved it further into the area until the cell (1,1).
</p>
<p>
You can play the game <a href="https://www.janko.at/Raetsel/Yosenabe/">here</a>. It is fun and it will help you to get used to the rules.
</p>

# Representation in ASP

A Yosenabe puzzle is represented by facts of the following predicates:
```
cell(X,Y).         % the cell (X,Y) belongs to the grid
area(X,Y,A).       % the cell (X,Y) belongs to area A
number(X,Y,N).     % the cell (X,Y) initially contains number N
goal(A,G).         % the goal number of area A is number G
```
The example shown before is represented by the following facts:
```
cell(1,1).    cell(1,2). ...  cell(5,4).  cell(5,5).  number(1,5,5).
area(1,1,1).  area(2,1,1).                goal(1,6).  number(3,1,1).
area(2,3,2).  area(3,3,2).  area(4,3,2).              number(3,4,2).
area(3,5,3).  area(4,5,3).  area(5,5,3).  goal(3,4).  number(4,2,4).
area(5,1,4).                                          number(5,3,2).
```
A solution is represented by atoms of the predicate target/4:
```
target(X,Y,XX,YY).  % the number in the cell (X,Y) is moved to the cell (XX,YY)
```
The solution of the example consists exactly in the following atoms:
```
target(1,5,1,1) target(3,1,2,1) target(3,4,3,3) target(4,2,4,5) target(5,3,5,1)
```

## Formalities.
You can work on the solution alone or in groups of two people. Different groups have to submit different solutions, in case of plagiarism all groups involved will fail the project.

Your solution has to correctly encode all solutions for every instance. In fact, our test instances usually have several solutions. Your code will be autograded for technical correctness. However, the correctness of your implementation -- not the autograder's judgments -- will be the final judge of your score. If necessary, we will review and grade assignments individually to ensure that you receive due credit for your work.

The content of the **main** branch of your GitHub repository at the time of the deadline will be considered your submission. Any modifications after deadline will be ignored. So will be any previous code that you committed before. Note that the autograder will give you the evaluation of your last commit, so be sure that it is what you expected.

**Start as soon as possible to avoid running out of time.**

Do not modify the file ```autograder.py``` nor any of the content of the directories ```.git```, ```.github```, ```img```, ```instances```, ```questions``` and ``` solutions```. Modifying some of this directories may prevent your code to work or cause lost of your progress. 

**Academic Dishonesty**: We will be checking your code against other submissions in the class for logical redundancy. If you copy someone else's code and submit it with minor changes, we will know. These cheat detectors are quite hard to fool, so please don't try. Modifying the behavior of the autograder in any way is also cheating. We trust you all to submit your own work only and to do it in honest way; please don't let us down. If you do, we will pursue the strongest consequences available to us.

Be sure to include a file called ```group.txt``` that contains the name of each of the components of the group in a different line (if you work alone just add your name in the first line).

## Question 1: Moving blocks into gray areas (30 points)

For this question we have to provide an encoding that moves all blocks into gray areas such that the movement of the block is made in straitgh line. We ignore for now all the other restrictions of the game.

Start by coping file ```yosenabe.lp``` to ```yosenabe1.lp``` and modify the latter.

The following command can be used to find all answer sets of a particular instance stored in file ```instance.lp```:
```sh
clingo yosenabe1.lp instance.lp 0
```
To receive credit for this question, your code must correctly solve all instances in the folder instances/q1. Solutions to this question can be found in the folder solutions/q1.

You can automatically test your code running
```sh
python autograder.py --question=1
```
The timeout per instance is 100 seconds. This timeout also applies to the following questions.
If the autograder tells you that your code does not correctly solve a particular instance, then you can check the expected solutions by checking the file
```sh
solutions/q1/<instance>.json
```
Solutions for subsequent questions can be found by changing the folder ```q1``` for the corresponding question.

## Question 2: (20 points)

To succed in this question, we need to ensure that at least one number is moved inside each area. Start by copying ```yosenabe1.lp``` to ```yosenabe2.lp``` and modify the latter.

You can automatically test your code running
```sh
python autograder.py --question=2
```

## Question 3: (25 points)

For this question, we have ensure that the paths of any two moved numbers do not cross or meet at any grid cell. Start by copying ```yosenabe2.lp``` to ```yosenabe3.lp``` and modify the latter.

You can automatically test your code running
```sh
python autograder.py --question=3
```

## Question 4: (15 points)

For this question, we have to consider the remaining rule of the game.  Start by copying ```yosenabe3.lp``` to ```yosenabe4.lp``` and modify the latter.

Recall that you can sum the values of the numbers moved to an area using a **sum aggregate**. For more information about how to use and write sum aggregates, please check Section 3.1.12 (page 30) of the [Potassco guide](https://github.com/potassco/guide/releases/tag/v2.2.0).

You can automatically test your code running
```sh
python autograder.py --question=4
```

**Be sure you have committed your changes, pushed them to the GitHub repository and see the grade you expected to receive in the Actions tab in GitHub.**
