# Chapter 1 {.recto}

2005, Finland. Open-source software was experiencing an explosive growth in popularity. Whilst world migrated to Windows XP, a global enclave of nerds were using Linux. It was a free operating system born out of the early 90s, maintained by a community of volunteers.

Lasse Collin, a Finnish student in his early twenties, belonged to this group of nerds. He was embedded deep amongst programmers. Many of his friendships formed over IRC (Internet Relay Chat).

Linux is the overarching term that encompasses many distributions, or distros for short. There are many options to choose from: Ubuntu, SUSE, Fedora, and more. Lasse's personal favourite was Slackware Linux. It was a distro that had been going strong ever since its creation in 1993. In fact, he liked it so much that one day he decided to create a derivative of it.

Logging on to IRC, he messaged his friends to tell them about the plan. They jumped on board and began brainstorming immediately. Of course, any good project needed a good project name. After much deliberation, they settled on the Tukaani Project. Tukaani is Finnish for a toucan, so Lasse's friend Ville Koskinen designed a project mascot - Bob the Toucan. Their distro needed a name too, so they chose Tukaani Linux.

However, they stumbled into a problem. Slackware Linux included plenty of preinstalled software. It was convenient whilst using it, but it made the installer much larger. It was so large that it couldn't fit on a CD-ROM and instead required a more expensive DVD-ROM.

Lasse suggested that, instead of removing software, they should try compressing the installer. Slackware already used gzip, a popular compression algorithm designed in 1992. This could compress the installer to 1 gigabyte. Better, but not small enough. Lasse then tried using LZMA, a newer and slightly less well-known compression algorithm.

Perfect. The installer compressed to just under 700 megabytes, narrowly fitting onto the CD-ROM.

His first reaction was shock. Despite LZMA compressing much better than gzip, it was far rarer. Lasse had made a decision. The world needed to start using LZMA, and he would be the one to introduce it to them.

After he informed the members of the Tukaani Project about the capabilities of LZMA, they all got to work.

---

Over the course of a year, Lasse and the team created a Swiss-army knife of software for the LZMA algorithm. They named it "LZMA Utils".

It didn't take long for the word to spread. By 2007, LZMA Utils accumulated a large community of both users and contributors. Although gzip still stood as the dominant algorithm, LZMA was now widely respected.

Lasse wasn't satisfied, though. Knowing LZMA so closely meant he couldn't look past its problems. The algorithm was good, yes, but the files it produced were fragile. If just one bit of the file is tweaked, the whole file falls apart like a house of cards. His coding skills had also improved, and starting afresh would do good.

He needed to make a new file format.

---

Starting with a blank slate is very difficult. His ideas for the format were fuzzy at best. He knew he wanted to use LZMA, but there were so many other choices to make. He knew he needed help, so he contacted the person who knew LZMA best - Igor Pavlov, creator of LZMA and 7-Zip.

Igor was very receptive to Lasse's inquiries. Together they worked on a new format, with assistance from Ville. They decided to use LZMA2 - the successor to LZMA. When it compressed, it split data into smaller chunks. It processed each chunk in parallel. If a chunk couldn't be compressed, it would be left as-is.

The format wasn't just a new algorithm. It included a handful of other useful features. It added a small fingerprint to each file. It also added "filter chains", where the data could be altered before compression so it would have a smaller final size.

Development of the file format took a year due to Lasse's own priorities drawing him away. But at last, in 2009, the format was ready. All it needed now was a name. He named it "XZ", and LZMA Utils was officially rebranded to XZ Utils.

---

XZ was an instant success with developers worldwide. Linux distros started including XZ Utils with the installer. Some distros even compressed the installer itself with XZ Utils. Lasse's project was a success. Over the following years, XZ found itself embedded almost anywhere you could find data that needed compressing. Competitor file formats came and went, but XZ was one of the few that stayed.

Once XZ Utils was created, the Tukaani Project began to slowly drift apart. Lasse's companions and co-maintainers found new responsibilities. Some found jobs, others had families. He, too, found new responsibilities. Yet XZ Utils remained his to care for. That's the curse of software development: once a project is popular and relied on, people count on you to keep it maintained and bug-free. In Lasse's case, millions relied on him.
