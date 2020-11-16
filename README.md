# problemsolving
Problem Solving iOS App - Swift.

**Demonstrates:** Caesar Cipher

Given a string str consisting of letters only and an integer n, the task is to replace every character of the given string by a character which is n times more than it. If the letter exceeds ‘z’, then start checking from ‘a’ in a cyclic manner.

**Examples 1:**  
&nbsp;&nbsp;&nbsp;&nbsp;**Input:** str = “abc”, n = 2  
&nbsp;&nbsp;&nbsp;&nbsp;**Output:** cde  
a is moved by 2 times which results in character c  
b is moved by 2 times which results in character d  
c is moved by 2 times which results in character e

**Examples 2:**  
&nbsp;&nbsp;&nbsp;&nbsp;**Input:** str = “abc”, n = 28  
&nbsp;&nbsp;&nbsp;&nbsp;**Output:** cde  
a is moved 25 times, z is reached. Then the 26th character will be a, 27th b and 28th c  
b is moved 24 times, z is reached. 28-th is d  
c is moved 23 times, z is reached. 28-th is f  

**NOTE:** Use **-** to move backward. Eg: n = -2 (moving backward 2 times), which is same as n = 24 (moving forward 24 times)
<br>

|Solution #|Description|Time Complexity|Space Complexity<br>Assume: Int 4 bytes,<br> Character 1 byte|
|:-:|---|:-:|:-:|
|Solution # 1|Add, Mod, Greater Than z (122)|O(n+5) = O(n)|O(4 + 4*n + n) = O(n)|
|Solution # 2|Add, Mod as 1 to 26, Add 97|O(n+5) = O(n)|O(4 + 4*n + n) = O(n)|
|Solution # 3|Static Matrix of moves, Mod to row & column|O(n+1) = O(n)|O(4 + 26 *26) = O(1)|
<br>

**Disadvantage of using the ASCII value of the letters to solve this problem:**
<br>
1. when the string is restricted with **letters only**, additional ascii value arithematic operations are meaningless, which makes algorithm costly. Solution 3 doesn't make use of ASCII values. Just array of moves accessed with row by column indices.
1. In multi-linugal and programming languages, **not** all letters are of single byte. Expanding to multi-lingual with the solution of ASCII values is not compatible.
