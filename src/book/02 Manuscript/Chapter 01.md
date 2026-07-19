# Chapter 1 {.recto}

2005, Finland. Open source software was seeing an explosive growth in popularity. Whilst much of the wider world had migrated to Windows XP, a global enclave of nerds enjoyed the meteoric rise of Linux - a fully free operating system born out of the early 90s, maintained by a community of volunteers.

Lasse Collin, a Finnish student in his early twenties, belonged to this group of nerds. He was embedded deep in the nerd subculture, having formed many friendships over IRC (Internet Relay Chat).

The Linux operating system is the overarching term that encompasses its many distributions, or distros for short. There are many options to choose from: Ubuntu, SUSE, Fedora, and more. Lasse's personal favourite was Slackware Linux, a distro that had been going strong ever since its creation in 1993. In fact, he liked it so much that one day he decided to create a derivative of it.

Logging on to IRC, he messaged his friends to tell them about the plan. They jumped on board and began brainstorming immediately. Of course, any good project needed a good project name. After much deliberation, they settled on the Tukaani Project. Tukaani is Finnish for a toucan, so Lasse's friend Ville Koskinen then designed their project's mascot - Bob the Toucan. Their distro needed a name too, so they chose Tukaani Linux.

However, they quickly stumbled into a problem. Slackware Linux included plenty of preinstalled software, which inflated the size of the installer. It was so large it couldn't fit on a CD-ROM, instead requiring a more expensive DVD-ROM.

Instead of removing some software from the operating system, Lasse suggested compressing the installer first. Slackware already used gzip, a widely used compression algorithm designed in 1992. This could compress the installer to a gigabyte in size. Better, but not small enough. Lasse then tried using LZMA, a newer and slightly less well-known compression algorithm.

Perfect. The installer compressed to just under 700 megabytes, narrowly fitting onto the CD-ROM.

His first reaction was shock. Despite LZMA compressing much better than gzip, it was far rarer. Lasse had made a decision. The world needed to start using LZMA, and he would be the one to introduce it to them.

After he informed the members of the Tukaani Project about the capabilities of LZMA, they all got to work.

---

Over the course of a year, Lasse and the team created a Swiss-army knife of software for the LZMA algorithm, named "LZMA Utils".

It didn't take long for the word to spread, and by 2007 LZMA Utils had a large community of both users and contributors. Although gzip still stood as the dominant algorithm, LZMA was widely respected.

Lasse wasn't satisfied, though. Knowing LZMA so closely meant he couldn't look past its problems. The algorithm was good, yes, but the files it produced were fragile. If just one bit of the file is tweaked, the whole file falls apart like a house of cards. His coding skills had also improved, and starting afresh would do good.

He needed to make a new file format.

---

Starting with a blank slate is very difficult. His ideas for the format were fuzzy at best. He knew LZMA and so wanted to use that, but how to incorporate it into the format in a robust way was tricky, with an infinite number of permutations possible. He knew he needed help, so he reached out to the person who knew LZMA best - Igor Pavlov, creator of LZMA.

Igor was very receptive to Lasse's inquiries. Together they worked on a new format, with assistance from Ville. Instead of reusing LZMA for the underlying compression, they settled on using its successor - LZMA2. When data was compressed, it was split into smaller chunks so it could be processed in parallel. Additionally, any data that cannot be compressed was kept as is, instead of bloating the overall file size.

Aside from adjusting the underlying algorithm used, the new format included a handful of other useful features. The file started with a 6-byte fingerprint so it could be recognised, even without the file extension. It also added "filter chains", where the data could be altered before compression so it would have a smaller final size.

Development of the file format took a year due to Lasse's own priorities drawing him away. But at last, in 2009, the format was ready. All it needed now was a name. He named it "XZ", and LZMA Utils was officially rebranded to XZ Utils.

---

XZ was an instant success with developers worldwide. Linux distros started including XZ Utils with the installer. Some distros even compressed the installer itself with XZ Utils. Lasse's project was a success. Over the following years, XZ found itself embedded almost anywhere you could find data that needed compressing. Competitor file formats came and went, but XZ was one of the few that stayed.

Once XZ Utils was created, the Tukaani Project began to slowly drift apart. Lasse's companions and co-maintainers found new responsibilities. Some found jobs, others had families. He, too, found new responsibilities. Yet XZ Utils remained his to care for. That's the curse of software development: once a project is popular and relied on, people count on you to keep it maintained and bug-free. In Lasse's case, millions of people relied on him.
