# Chapter 7

Andres Freund was a software engineer at Microsoft, where he was paid to contribute to PostgreSQL - a free and open-source database. It is widely used by even the biggest companies, such as Spotify and Netflix. He had been developing PostgreSQL since 2009, with a variety of companies paying him to do so. He had a fine eye for performance, with his primary goal being to optimise PostgreSQL to be as fast as possible.

Rewinding back to late February, XZ Utils 5.6.0 had just been added to Debian's unstable packages. Andres was testing the performance of PostgreSQL, but noticed errors in the Valgrind debugger. These errors differed to the ones Red Hat found though, due to how Andres always tested with the `-fno-omit-frame-pointer` flag. The frame pointer is an example of a register - a piece of high speed memory usually with a specific purpose. The frame pointer's purpose is to keep track of which function is currently being executed. Modern software is typically compiled without using the frame pointer register for this purpose, since often you can achieve greater performance by using it for other purposes. Andres used this flag when testing to ensure the compiled software always uses the frame pointer for its intended purpose. Debuggers can utilise the frame pointer to efficiently tell which function is being executed at all times, which helps Andres figure out the root causes of bottlenecks.

He was suspicious, but Valgrind often flags errors even when it is inconsequential. He shelved the thought to the back of his mind, and moved on.

---

A month of working on PostgreSQL came and went. It was the 27th March and Andres was doing more routine performance testing. This time, he was testing on a slow server accessible to the internet. He wanted to free up more resources for PostgreSQL, so he began to investigate the other running programs on the server.

On the internet, there are often hundreds of automated programs that connect to servers and attempt to log in with the SSH protocol (what OpenSSH uses when people connect to servers). It was no different with this server, there was enough failed attempts that Andres noticed high resource usage coming from OpenSSH. When he watched the OpenSSH activity, something jumped out at him.

Attempts were taking 500 milliseconds too long. Typical attempts took about 300 milliseconds, but these were taking 800. Most people would have ignored it, or filed a bug report. Andres was not most people, he wanted to understand what was causing it.

Reusing his performance expertise he had earned from his time with PostgreSQL, he profiled the performance of OpenSSH. It seemed typical with the exception of one major anomaly: XZ Utils. The program was spending a very long time executing its code, causing the bulk of the slowdown. He cast his mind back a month and remembered XZ Utils had been erroring in PostgreSQL too. There had to be an underlying cause.

He faced a problem almost immediately - when he used a debugger, the program stopped misbehaving. It seemed typical behaviour of a program trying to hide something. He tried several other debuggers, but none of them worked. Not all hope was lost though - he remembered that Intel offered a debugger named Intel Processor Trace. He had used it in the past to diagnose problems with PostgreSQL. Unlike other debugging software, Processor Trace ran on the hardware entirely invisible to OpenSSH. Since it couldn't be detected, Andres was able to watch the backdoor unfold in front of him, step by step.

It was growing late, so he decided to call it for the night. Before he went to sleep, he sent an email to Debian's security team. He gave them a warning he was investigating XZ Utils and would have more information tomorrow. Behind the scenes, Debian began investigating too.

---

The next day, Andres kept thinking about XZ Utils. He couldn't focus in his Microsoft meetings: he knew he was sitting on a major backdoor that could be remotely set off at any moment.

As soon as he was finished with work for the day, he got back into investigating once again.