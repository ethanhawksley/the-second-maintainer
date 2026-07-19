# Chapter 1 {.recto}

2005, Finland. Open-source software was experiencing an explosive growth in popularity. Whilst the world migrated to Windows XP, a global enclave of nerds was using Linux. It was a free operating system born out of the early 90s, maintained by a community of volunteers.

Lasse Collin, a Finnish student in his early twenties, belonged to this group of nerds. He was embedded deep among programmers. Many of his friendships formed over IRC (Internet Relay Chat).

Linux is the overarching term that encompasses many distributions, or distros for short. There are many options to choose from: Ubuntu, SUSE, Debian, Fedora, and more. Lasse's personal favourite was Slackware Linux. It was a distro that had been going strong since its inception in 1993. In fact, he liked it so much that one day he decided to create a derivative of it.

Logging on to IRC, he messaged his friends to tell them about the plan. They jumped on board and began brainstorming immediately. Of course, any good project needed a good project name. After much deliberation, they settled on the Tukaani Project. Tukaani is Finnish for a toucan, so Lasse's friend Ville Koskinen designed a mascot for the project - Bob the Toucan. Their distro needed a name too, so they chose Tukaani Linux.

However, they stumbled into a problem. Slackware Linux included plenty of preinstalled software. It was convenient whilst using it, but it made the installer much larger. It was so large that it couldn't fit on a CD-ROM and instead required a more expensive DVD-ROM.

Lasse suggested that instead of removing software, they should try compressing the installer. Slackware already used "gzip", a popular compression algorithm designed in 1992. This could compress the installer to 1 gigabyte. Better, but not small enough. Lasse then tried using "LZMA", a newer and slightly less well-known compression algorithm.

Perfect. The installer compressed to just under 700 megabytes, narrowly fitting onto the CD-ROM.

At first, he was surprised. LZMA compressed files better than gzip, yet it was far rarer. Lasse made a decision to change this. The world needed to start using LZMA, and he would be the one to introduce it to them.

He informed the members of the Tukaani Project about the capabilities of LZMA. They too were surprised, and got to work implementing it.

---

Over the course of a year, the Tukaani Project had created a suite of software named "LZMA Utils". It was a jack-of-all-trades and could manipulate LZMA in every way imaginable. The tools ran on the smallest of chips and on the biggest of servers.

It didn't take long for the word to spread. By 2007, LZMA Utils had accumulated a large community of both users and contributors. Although gzip still stood as the dominant algorithm, LZMA was finally respected.

Lasse wasn't satisfied, though. He had grown so close to LZMA and learned all of its flaws. The algorithm was good, yes, but the files it produced were fragile. It was prone to corrupting during file transfers, leaving it entirely useless. Lasse's coding skills had also improved, and starting afresh would let him build back stronger.

He needed to make a new file format.

---

His plans for the format were fuzzy at best. He knew he wanted to use LZMA, but there were so many other unknowns. He couldn't make it alone, so he contacted the person who knew compression best. He reached out to Igor Pavlov, the creator of LZMA and 7-Zip.

Igor was very receptive to Lasse's inquiries. Together they worked on a new format, with assistance from Ville. They chose to use Igor's latest algorithm - LZMA2. It split data into smaller chunks and compressed each in parallel. If a chunk couldn't be compressed, it would be left as-is.

Development of the file format took a year due to Lasse's own priorities drawing him away. But at last, in 2009, the format was ready. All it needed now was a name. He named it "XZ", and LZMA Utils was officially rebranded to XZ Utils.

---

XZ was an instant success with developers and found itself used almost everywhere. Linux distros started including XZ Utils pre-installed. Some distros even used XZ Utils to compress the installer itself. Competitor file formats came and went, but XZ was one of the few that stayed. Lasse's project was a success.

After the creation of XZ Utils, the Tukaani Project began to slowly drift apart. Some of Lasse's friends found jobs, others had families. He, too, became increasingly busy. Yet, as its creator, XZ Utils remained his responsibility. It was popular enough that he needed to keep fixing it. There were millions relying on him.
