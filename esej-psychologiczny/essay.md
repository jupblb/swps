---
bibliography: ./esej-psychologiczny/essay.bib
date: 2022-11-12
title: Extending attention span for children with ADHD using eye-tracking
  technology
titlepage: true
vim: spell spelllang=en_us
---

## What is ADHD?

Attention Deficit Hyperactivity Disorder (ADHD) is, in oversimplified
explanation, a condition that makes it harder for individuals to focus on
something for a longer period of time. It's not uncommon to have it as 6% of all
children aged 3-17 years in the USA are diagnosed with it. [@adhd-cdc] Around
one-third of them continue to have it in adulthood. [@adhd-adulthood-rate]

Interestignly, the "hyperactivity" keyword may be somewhat misleading. The
society commonly uses term "ADHD" to describe people with too much energy in
them. In reality, it is also applicable to people with seemingly too little
energy, which results in plain inattention. And sometimes both interpretations
can be used to describe the same person.

Children with the disorder may have more difficulties in their education than
their classmates. It is a common behavior to seek new stimuli when performing an
either too easy or too difficult task. [@adhd-education-1] A teacher may also
misinterpret lack of attention as laziness, which later becomes a
self-fulfilling prophecy. And even a diagnosed condition may have consequences
such as an increased probability of suffering from stereotype threat.
[@adhd-detection-2]

The disorder often persists into adulthood where it is a cause for higher chance
of unemployment, unsuccessful marriage and other misfortunes.
[@adhd-detection-3] Currently advised treatment involves cognitive-behavioral
therapy and medication as the top choices, but exercise can be also helpful.

## How does eye tracking work?

Whenever somebody looks at some structure or reads a piece of text, their eye
movement is not exactly continuous. The brain chooses a fixation point in the
available view, absorbs information and then proceeds to a next point via a
saccade. This process is repeated, forming a scanpath, until the desired
information is acquired.

Eye tracker is a device that registeres person's eyes movement. This is a fairly
new piece of engineering that was developed in the second half of the 20th
century. It usually relies on having dedicated cameras that monitor pupils. See
figure \ref{eye-tracking} for an example of visualisation of gathered data.

![An example of eye movement when reading text. [@eye-tracking-wiki]
\label{eye-tracking}](./esej-psychologiczny/saccades.jpg){width="70%"}

Such devices are quite expensive and not very flexible. Fortunately, in recent
years special machine learning algorithms were developed with the same task in
mind. [@eye-tracking-ai] This cuts the cost significantly and enables people to
test this technology on their own, using web cameras embedded in their computers
and smartphones.

There are multiple applications where this tool has significant impact. It is
used in many fields, such as marketing, psychology or aviation. A popular
example is balancing advertising intensiveness and positive user experience.
[@eye-tracking-example] By reviewing ways a potential customer interacts with
website frontend or shop exposition, it is possible to position adverts in
places that cause minimal amount of interruption while still catching attention.

## Are we in for an epic crossover?

Eye tracking is already used with success in research of diagnosing ADHD.
[@adhd-detection-1] One of the methods relies on using deep learning for solving
classification problem of whether a person suffers from the disorder. The
training dataset consisted of registered eye movement of someone watching a
short video along with data about ADHD presence. A working solution achieved
high confidence interval of guessing the latter information without knowing the
former one, although choice of watched material mattered a lot.

Research in user experience (UX) yielded a lot of ideas for making it easier for
a user to focus on desired section of computer screen. One of the ideas is to
diffrentiate area of importance from the rest. This can be achieved either by
decreasing visibility of the unimportant area or increasing visibility of the
important one. The most useful tools here are contrast and colors palette. A
good example is the Windows XP shut down menu (Figure \ref{windows-xp}).

![Windows XP would gray out everything except the choice menu when shutting down
computer. \label{windows-xp}](./esej-psychologiczny/windows-xp.jpg){width="70%"}

A new study evaluated combining mentioned UX research with eye tracking
technology to enhance children's ability to focus on reading text.
[@adhd-eye-tracking-1] The participants were all previously diagnosed with ADHD
and legible. A tracker gathered information about a line that a child was
reading. The algorithm would consume this data use one of the following effects
to improve reader's attention capabilities: changing color of the line
background with or without changing color of the letters, sharpening the line or
blurring the other lines. The outcome is highly promising, showing statistically
significant impact when using any of the mentioned techniques as part of the
user experience.

It is quite exciting to think that a web camera, which is a widely available
technology, can be used to diagnose and significantly improve learning
experience for people with a disorder that touches a large portion of entire
popularion. While at its infancy, the research is highly promising and utilises
novel tools, such as deep learning, that are improved every year.

This is certainly not a solution to all the problems caused by ADHD and proper
treatment is still in order. But at least children with no access to these may
some day enjoy better quality of life. The next research areas may focus on
bringing this value to the adult people with the disorder. It is also a major
sign for the UX developers to focus more on system attributes that relate to
content readability and preventing user focus disruption.

## Bibliography
