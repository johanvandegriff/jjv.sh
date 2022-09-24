---
title: "Command-line Calculator: The tool you didn't know you needed, and in fact, didn't need!"
description: "a calculator you can run in the terminal, written in python"
date: 2019-09-07T01:21:52-04:00
tags: []
---
[Download .zip file](calculator.zip)

This is a calculator that you can run in a command line terminal. To run it, you need Python 2 or 3.

You can either use argument mode:
```
$ ./calculator.py '1+1'
2
```

or interpreter mode:

<pre>
$ ./calculator.py
<span style="color: lightblue">Type help for more info.</span>
<span style="color: cyan">~ </span>1+1
2
<span style="color: cyan">~ </span>123sin(4!rad(56+log4))/(3+ln(3!))
-25.390453736
<span style="color: cyan">~</span>
</pre>

In both modes, you can assign variables with either of the following:
```
83->abc
83@abc
```

And access them like this:

```
3+abc
86
cos abc
0.249540117973
```

To see more of the features, type help in interpreter mode or run <b>./calculator.py help [page #]</b>.

[Download terminal colors python module](colors.zip)
