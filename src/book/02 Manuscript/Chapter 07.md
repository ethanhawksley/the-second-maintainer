# Chapter 7

Andres Freund was a software engineer at Microsoft, where he was paid to contribute to PostgreSQL - a free and open-source database. It is widely used by even the biggest companies, such as Spotify and Netflix. He had been developing PostgreSQL since 2009, with a variety of companies paying him to do so. He had a fine eye for performance, with his primary goal being to optimise PostgreSQL to be as fast as possible.

Rewinding back to late February, XZ Utils 5.6.0 had just been added to Debian's unstable packages. Andres was testing the performance of PostgreSQL, but noticed errors in the Valgrind debugger. These errors differed to the ones Red Hat found though, due to how Andres always tested with the `-fno-omit-frame-pointer` flag. The frame pointer is an example of a register - a piece of high speed memory usually with a specific purpose. The frame pointer's purpose is to keep track of which function is currently being executed. Modern software is typically compiled without using the frame pointer register for this purpose, since often you can achieve greater performance by using it for other purposes. Andres used this flag when testing to ensure the compiled software always uses the frame pointer for its intended purpose. Debuggers can utilise the frame pointer to efficiently tell which function is being executed at all times, which helps Andres figure out the root causes of bottlenecks.

He was suspicious, but Valgrind often flags errors even when it is inconsequential. He shelved the thought to the back of his mind, and moved on.

---

A month of working on PostgreSQL came and went. It was the 27th March and Andres was doing more routine performance testing. This time, he was testing on a slow server accessible to the internet. He wanted to free up more resources for PostgreSQL, so he began to investigate the other running programs on the server.

On the internet, there are often hundreds of automated programs that connect to servers and attempt to log in with the SSH protocol (what OpenSSH uses when people connect to servers). It was no different with this server, there was enough failed attempts that Andres noticed high resource usage coming from OpenSSH. When he watched the OpenSSH activity, something jumped out at him.

Attempts were taking 500 milliseconds too long. Typical attempts took about 300 milliseconds, but these were taking 800. Instead of brushing off like most people would, he decided to dig deeper.

Reusing his performance expertise he had earned from his time with PostgreSQL, he profiled the performance of OpenSSH. It seemed typical with the exception of one major anomaly: XZ Utils. The program was spending a very long time executing its code, causing the bulk of the slowdown. He cast his mind back a month and remembered XZ Utils had been erroring in PostgreSQL.