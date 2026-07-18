# Chapter 7

Andres Freund was a software engineer at Microsoft, where he was paid to contribute to PostgreSQL - a free and open-source database. Even the biggest companies, such as Spotify and Netflix, widely use it. He had been developing PostgreSQL since 2009, with various companies paying him to do so. He had a fine eye for performance, with his primary goal being to optimise PostgreSQL to be as fast as possible.

Rewinding back to late February, XZ Utils 5.6.0 had just been added to Debian's unstable packages. Andres was testing PostgreSQL's performance and noticed errors in the Valgrind debugger. These errors differed to the ones Red Hat found though, due to how Andres always tested with the `-fno-omit-frame-pointer` flag. The frame pointer is an example of a register - a piece of high speed memory usually with a specific purpose. The frame pointer's purpose is to keep track of which function is currently being executed. Modern software is typically compiled without using the frame pointer register for this purpose, since often you can achieve greater performance by using it for other purposes. Andres used this flag when testing to ensure the compiled software always uses the frame pointer for its intended purpose. Debuggers can utilise the frame pointer to efficiently tell which function is being executed at all times, which helps Andres figure out the root causes of bottlenecks.

He was suspicious, but Valgrind often flags errors even when it is inconsequential. He shelved the thought to the back of his mind, and moved on.

---

A month of working on PostgreSQL came and went. It was the 27th March and Andres was doing more routine performance testing. This time, he was testing on a slow server open to the internet. He wanted to free up more resources for PostgreSQL, so he began to investigate the other running programs on the server.

On the internet, there are often hundreds of automated programs that connect to servers and attempt to log in with the SSH protocol (what OpenSSH uses when people connect to servers). It was no different with this server, there were enough failed attempts that Andres noticed high resource usage coming from OpenSSH. When he watched the OpenSSH activity, something jumped out at him.

Attempts were taking 500 milliseconds too long. Typical attempts took about 300 milliseconds, but these were taking 800. Most people would have ignored it, or filed a bug report. Andres was not most people, he wanted to understand what was causing it.

Reusing his performance expertise he had earned from his time with PostgreSQL, he profiled the performance of OpenSSH. It seemed typical except for one major anomaly: XZ Utils. The program was spending a very long time executing its code, causing the bulk of the slowdown. He cast his mind back a month and remembered XZ Utils had been erroring in PostgreSQL too. There had to be an underlying cause.

He faced a problem almost immediately - when he used a debugger, the program stopped misbehaving. It seemed typical behaviour of a program trying to hide something. He tried several other debuggers, but none of them worked. Not all hope was lost though - he remembered that Intel offered a debugger named Intel Processor Trace. He had used it in the past to diagnose problems with PostgreSQL. Unlike other debugging software, Processor Trace ran on the hardware entirely invisible to OpenSSH. Since it couldn't be detected, Andres was able to watch the backdoor unfold in front of him, step by step.

It was growing late, so he decided to call it for the night. Before he went to sleep, he sent an email to Debian's security team. He warned them he was investigating XZ Utils and would have more information tomorrow. Behind the scenes, Debian began investigating too.

---

The next day at work, Andres kept thinking about XZ Utils. He couldn't focus on his meetings at Microsoft: he knew he was sitting on a major backdoor that could be remotely set off at any moment. As soon as he was finished with work for the day, he dove straight into investigating again.

He knew there was a backdoor in the program, but he still didn't know how it got there. He read through the source code online but still couldn't find anything out of the ordinary. Andres decided to sanity check himself and compare the released code side-by-side, and he spotted it. In the official release of 5.6.0 and 5.6.1, there was one tiny tweak in the file `build-to-host.m4` - it was the file that gave instructions for how XZ Utils was compiled. It looked perfectly innocuous at first glance, yet he knew better. He traced through the logic and saw how it loaded the malicious test files, transformed them into code, and executed them. 

The only thing left was to figure out who to blame. Andres checked who made the test files, who updated the `build-to-host.m4`, and who released the latest versions of XZ Utils. It all pointed to the same person: Jia Tan. He had to put a stop to this before Jia could execute the backdoor on millions of servers.

Andres started to write an email.

---

Maintaining a Linux distro is usually quite a peaceful role. You find interesting software, compile and package it, and then distribute it online to the distro's users. Today, it wasn't quite so peaceful.

The maintainers of the most used distros have exclusive access to the private Openwall Project mailing list. Security vulnerabilities get emailed to everybody on the mailing list so they can patch their distros before the exploit is public. Usually the exploits are relatively minor so there isn't much of a rush. This was not one of those exploits.

Andres Freund sent an email to the Openwall Project mailing list detailing everything he had discovered about the backdoor. When the sheer scale of the backdoor began to set in, maintainers scrambled to roll back XZ Utils to a prior version. Within hours, Debian and Red Hat delisted the version from their websites. Despite not being the target of the attack, other distros reverted to an older version too.

He let a day pass to ensure all the distros had removed version 5.6.0 and 5.6.1. Once they had, Andres wrote one final email to a public mailing list. He explained the entirety of the backdoor and how to check if you were infected. In addition, he added a disclaimer to his report.

> I am not a security researcher, nor a reverse engineer.

After all, he wasn't some cybersecurity expert. Andres just enjoyed optimising the performance of databases. Unlike everyone else, he couldn't just ignore 500 milliseconds.
