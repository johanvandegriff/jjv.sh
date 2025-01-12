---
title: "Are Computers Binary or Non-Binary?"
date: 2025-01-12T15:26:12-05:00
tags: ["featured"]
---
Are computers binary or non-binary?

Depends if the "or" is exclusive or not.

Now that I've gotten the instinctive pun out of my system... The [question](https://youtu.be/BVNx3wtJ9vs?list=PLzH6n4zXuckpwdGMHgRH5N9xNHzVGCxwf&t=139) kinda sounds paradoxical at first, but after you think about it for 2 seconds, you realize it is a bit non-sensical and maybe invalid because the things being compared have completely different definitions despite their linguistic similarities. But in thinking about it, I found some interesting concepts to explore.

## #define 0 1
How do we define "binary" and "non-binary"? With 2 terms to define, and 2 ways to define them (human and computer), we multiply that (not add! 2 is a special case where 2+2=2x2=2^2) to get 4 definitions:
* binary in the computer sense, that it performs operations on 0s and 1s at the low level
* non-binary in the computer sense, usually called analog, where it can perform operations with values that aren't discrete but can vary infinitely, usually voltage levels
* binary in the human sense, that you ascribe to male or female for gender (but people don't say "I'm binary", they just say what gender they are...)
* non-binary in the human sense, that you are outside the gender binary and do not ascribe to either of those 2 options, but rather a different gender, no gender, multiple genders, a spectrum of gender, etc.

You can see from these definitions that "non-binary" is not usually used to describe computers, and "binary" is not usually used to describe humans. So we will consider binary in the computer sense, and non-binary in the human sense, as you probably assumed when first reading the question.

By these definitions, computers are binary in the computer sense and non-binary in the human sense. Although, as usual with computers (and humans), there are some edge cases of computers that actually *do* run on analog instead of binary, so those would be non-binary in both the human and computer sense. We will not consider those any further here for the sake of simplicity, and for the fact that most people mean "digital computer" when they say computer, and would specify "analog computer" if they meant otherwise.

## diff -y computer.txt human.txt
Another thing to consider is what question you are asking when you say, "Is a computer binary?" It's like asking, "Is a human DNA?" Well, I wouldn't say a human *is* DNA, but rather that a human *has* DNA. A computer *has* binary, binary data at least. It *runs on* binary, similar to how a human *runs on* DNA. A human has enzymes to copy and splice DNA, and ribosomes to take in DNA and produce proteins. A computer has logic gates to manipulate binary data, and monitors to take in binary data and produce light.

Computers are purely digital because the boundary of what the "computer" is is usually drawn around the thing that does the computing. You wouldn't consider a computer that drives a car to be analog just because it adjusts the speed and steering of the car, because those variables are not used for computing. All the decision making is done digitally. Any input it needs such as cameras and lidar is converted to digital, and any output such as the speed and direction are converted from digital back to analog. Yes, there are analog considerations for building a computer in the real world, such as the signal eye pattern, but that is meant to *remove* the influence of analog and produce a clean 0 or 1 binary signal with minimal interference.

Humans, on the other hand, are purely analog because we do the majority of our computing in the brain, which uses voltage levels of neurons, concentration of chemicals, etc. Our DNA is digital, but it doesn't help us do computing in the sense that you can't take some digital algorithm and choose to run it on your DNA. (There might be some thought to be given as to whether evolution is digital since it operates at the DNA level, but since it relies on a lot of random events, maybe it can be thought of as probabilisticly digital, like rolling a bunch of dice always gives you a fixed set of outcomes but is best modelled by statistics rather than some procedural algorithm.)

While computers have to have a layer of abstraction to represent analog concepts, such as floating point numbers, humans have to have a layer of abstraction to represent digital concepts, such as pieces on a chessboard. Normally we look at the position of objects relative to each other in an analog way, but for chess you have to learn the skill of considering discrete positions and the relationships between them.

## char *ptr; goto label;
What does being non-binary in a human sense mean anyway, and is there a way to see if a computer meets this definition? One lens to think about this from is language. Every language treats gender differently, but in English, people usually refer to someone with he, she, or they. Gender is so... ingendered in our language. It's as if a computer had to pick 1 of 3 options when using a pointer to refer to memory. But wait - it actually can! Programs need to keep track of what data type is at a pointer, to retrieve the right amount of data and interpret it correctly. Even further, CPUs apparently support [pointer tagging](https://lwn.net/Articles/888914/), where the top few bits of an address can be used for memory management, garbage collection, etc. It gets a bit messy, just like it does with humans. Even though "they" is a gender neutral pronoun, some people don't want to be referred to as "they", and of course there are other options such as "ze" and other neopronouns. Not to mention all the names for gender identities that inform the choice of pronouns.

But all of these options are still encapsulated in a discrete system, there might be more than 2, but there is still a finite number, and no infinite variation between. Through the lens of language, "non-binary" turns out to just be trinary, quaternary, base 10, base 12, base 10000, some discrete set of pronouns and labels. People have this almost universal tension with labels - on one hand they can give others insight and bring joy and community, but they can also miss the mark, or put someone in a box and limit their expectations.

This hints at the fact that internally, gender identity (and all aspects of identity) can be much more fluid, and only approximated to the nearest set of labels in this discrete system when it needs to be communicated quickly. All that to say that being non-binary in a human sense *can* mean to have an identity that is analog. Yes, it can be *converted* to digital, and it might be an exact match, but it also might not.

You might think that this means computers are *not* non-binary in the human sense, but looking back at the definition, computers *are* non-binary in the human sense because they have no gender, which is one of the ways to be non-binary in the human sense.

Computers are outside the gender binary.

Computers are outside the *gender* binary.

What binarys *are* computers a part of?

## The (ZX) Spectrum
I remember one time someone asked if I was on the spectrum and I said, "No, but I'm an ally to LGBT people." To which they replied, "I meant the autism spectrum." Embarrassing, especially since I have since realized I am probably on both spectrums.

In the same way that humans can be on multiple spectrums, let's explore multiple binaries that computers might be on:

* ECC or non-ECC memory
* single core or multi-core CPU
* hard drive or solid state storage
* battery or no battery

Hmm, that's not very many things, and arguably all of them have more than 2 options. Let's allow things with more options:
* system language
* keyboard layout
* display resolution
* number of displays
* number of USB ports
* desktop or laptop (or tablet or phone or smart fridge or...)
* operating system (Linux, Windows, Mac, FreeBSD, OpenBSD, NetBSD, Hannah Montana Linux, Haiku, your personal implementation of LFS, etc.)
* architecture (x86 or ARM or RISC-V or PowerPC or custom circuit on an FPGA...)

These things are starting to look more like spectrums, although with finite options. Except are there finite options? Those last few seem to suggest not - you can make a computer any shape or size, write any custom operating system, and create any custom architecture on an FPGA given enough time. (At some point I want to do this, create a computer from the ground up, starting with logic gates and ending with an entire operating system, and run a webserver on it).

In a practical sense, what's the difference between infinite possibilities, and a technically finite but huge amount of possibilities? In fact, we think of a variable in an analog computer as having infinite possibile values, but in reality the presence of noise in the circuitry gets in the way and we are left with a finite precision to the voltage level. And in fact, voltage itself can only have discrete values as limited by the particles making up the voltage difference being constrained by the Planck length (you'll have to ask a physicist to be absolutely sure about that one). And so analog computers, and brains, and circuits, are only analog in theory, and maybe not even in theory if my physics knowledge is correct. It all ends up discrete, but with a high amount of precision. Which means you can get the same effect with a digital computer by using enough bits to provide that same level of precision.

## exit(0);
In conclusion, lets pop everything off the stack:
* computers are digital
* but they rely on electronics which are analog
* and electronics run on physics
* but physics has the Planck length which is digital
* which means reality is digital
* and we are living in a simulation
* which is running on a computer
* which means that at some point
* someone will port DOOM to that computer
