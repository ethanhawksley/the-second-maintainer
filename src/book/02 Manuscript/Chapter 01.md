# Chapter 1 {.recto}

2005, Finland. Open source software is seeing an explosive growth in popularity. Whilst much of the wider world has migrated to Windows XP, a global enclave of nerds is enjoying the meteoric rise of Linux - a fully free operating system born out of the early 90s maintained by a community of volunteers.

Lasse Collin, a Finnish student in his early twenties, belongs to this group of nerds. He is embedded deep in the nerd subculture, having formed many friendships over IRC (Internet Relay Chat). 

The Linux operating system is the overarching term that encompasses its many distributions, or distros for short. There are many options to choose from: Ubuntu, SUSE, Fedora, and more. Lasse's personal favourite is Slackware Linux, a distro that had been going strong ever since its creation in 1993. In fact, he likes it so much that one day he decides to create a derivative of it.

Logging on to IRC, he messages his friends to tell them about the plan. They jump on board and begin brainstorming immediately. Of course, any good project needs a good project name. After much deliberation, they settle on the Tukaani Project. Tukaani is Finnish for a toucan, so Lasse's friend Ville Koskinen then designs their project mascot - Bob the Toucan. The distro needs a name too, so they pick Tukaani Linux.

However, they quickly stumbled into a problem. Slackware Linux is a distro that comes with lots of software preinstalled, which inflates the size of the installer to the point where it could no longer fit on a CD-ROM. To install it, you would require more expensive DVD-ROMs.

Instead of removing some of the software from the operating system, Lasse proposes they first try compressing the installer. Slackware already used gzip, a widely used compression algorithm designed in 1992. This could compress the installer to a gigabyte in size. Better, but not quite small enough. He then tries using LZMA, a newer and slightly lesser known compression algorithm.

Perfect.

The installer managed to compress to just under 700 megabytes, narrowly fitting onto the CD.

At first, he was taken aback. The compression was so much better than gzip, yet he almost never sees anybody using LZMA. Inside Lasse's head, an idea popped into existence. The world needed to start using LZMA, and he would be the one to introduce it to them.

After informing the members of the Tukaani Project about the capabilities of LZMA, they were all swayed by the idea and got to work.

---

Later that year, Lasse and the team had managed to create a Swiss-army knife of software and libraries for the LZMA algorithm, named "LZMA Utils".

It didn't take long for the word to spread, and by 2007 LZMA Utils had a large community of both users and contributors. Although gzip still stood as the dominant algorithm, LZMA sat widely respected.

Lasse wasn't satisfied though. Knowing LZMA so closely meant he couldn't look past its problems. The algorithm was good, yes, but the files it produced were fragile. If just one bit of the file is tweaked, the whole file falls apart like a house of cards. His coding skills had also improved, and starting afresh would do good.

He needed to make a new file format.

---

Starting with a blank slate is very difficult. His ideas for the format were fuzzy at best. He knew LZMA and so wanted to use that, but how to incorporate it into the format in a robust way was tricky, with an infinite number of permutations possible. He knew he needed help, so he reached out to the person that knew LZMA best - Igor Pavlov, creator of LZMA.

Igor was very receptive to Lasse's inquiries. Together they work on a new format, with assistance from Ville. Instead of reusing LZMA for the underlying compression, they settle on using its successor - LZMA2. When data is compressed, it is split into smaller chunks so it can be processed in parallel for faster speeds. In addition, any data that cannot be compressed is kept as is, instead of bloating the overall file size.

Aside from adjusting the underlying algorithm used, the new format includes a handful of other useful features. The file now starts with a 6 byte fingerprint so it can be recognised, even without the file extension. It also added "filter chains", where the data can be altered before compression so it can have a smaller final size.

The file format took a year to make due to Lasse's own priorities drawing him away. But at last, in 2009, the format was ready. All it needed now was a name. He named it "XZ", and LZMA Utils was officially rebranded to XZ Utils.

---

XZ was a hit with developers around the world. Linux distros started including XZ Utils with the installer. Some distros even compressed the installer itself with XZ Utils. Lasse's project was a success. Over the following years, XZ found itself embedded almost anywhere you could find data that needed compressing. Competitor file formats came and gone, but XZ was one of the few that stayed.

Once XZ Utils was created, the Tukaani Project began to drift apart. Slowly, Lasse's companions and co-maintainers found new responsibilities. Some found jobs, others had families. He, too, also found new responsibilities. Yet XZ Utils remained. That's the curse of software development, once a project is popular and relied on, people are counting on you to keep it maintained and bug-free. In Lasse's case, millions of people relying on him.