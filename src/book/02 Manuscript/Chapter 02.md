# Chapter 2

In 2021, twelve years after its creation, XZ remained a dominant file format. With its popularity, however, came bug reports. Plenty of bug reports. Even though many bugs were minor, they still took time out of his day for Lasse to deal with them all.

It was November 10th when he checked his inbox and found an email had arrived two weeks prior. Lasse was not known for regularly checking his emails - he frequently took internet breaks. The email was addressed from another developer named Jia Tan, and it contained a patch for XZ Utils. He proposed adding the special file *.editorconfig*, that provided configuration for how text editors would format code. Lasse hoped it could settle the debates he'd had over formatting. When he added the patch to the code, there were a few problems. He began to draft a reply to Jia.

> Thanks! I hadn't heard about this before, but it sounds nice.

There hadn't been much activity on XZ Utils recently, so Lasse was glad to see any new faces. Who knew, if he was lucky maybe Jia would stay?

The main issue with the proposed *.editorconfig* was it needed to be more thorough. Jia had added formatting rules for some files but not all.

> There are multiple indentation styles, even under src.

Lasse proceeded to explain the different styles that had accumulated over the years. It had grown quite complicated and only he understood it all. He ended his email warmly.

> Is it good enough or did I add bad bugs? :-)

It was hard work to maintain software, but when you got genuine help from others, it was all worthwhile.

---

It took two days for Jia to reply. When he did, he found and fixed a couple more problems with the patch. He ended his email with a nitpick:

> Why do you use tab width 8 for your source files?
> Either way, it's your preference, and I will follow your lead.

Lasse smiled as he read it. The modern standard for the width of a tab was 4, yet he still used 8. He appreciated that Jia was understanding and not pushy for a move to four. XZ Utils was Lasse's project, after all.

He applied the patch to XZ Utils, and then uploaded the code to GitHub - a website for hosting code publicly. This exchange had rejuvenated Lasse's hope for the project. Maybe, just maybe, he wouldn't have to keep developing XZ Utils alone.

---

Christmas rolled around the corner, and a new email appeared on the mailing list. It was from Sebastian Siewior - a developer of the Debian distro. He asked if parallel decompression would get implemented, since decompressing different chunks simultaneously would greatly speed up the process.

Lasse paused to consider. He'd been meaning to get round to this for a while. Over the years, XZ had earned a reputation for compressing well, but decompressing slowly. If he implemented parallel decompression, it would help close the gap between XZ and other compression formats.

Implementing parallel decompression would be no mean feat. It could take quite some time before a finished implementation was ready. The arrival of Jia did give him some hope, though. If he stayed, the extra help would be invaluable.

Lasse created an early draft of the feature. As he had hoped, Jia stuck around to comment. He highlighted where Lasse should restructure his code, and spotted a simple typo in the documentation. They both continued to iterate on improving parallel decompression.

Unfortunately for Sebastian, parallel decompression was not ready in time for Christmas. Major releases of XZ Utils were infrequent, and the feature required more testing than usual due to its complexity. Meanwhile, more development was in the works.

---

Two weeks after Sebastian's request, Jia had prepared a new patch. He had ported over the existing automated tests to a new framework named *seatest*. These automated tests were responsible for ensuring the software always functioned properly - if new code broke XZ Utils, he would be alerted.

What shocked Lasse most was the size. The patch was hundreds of lines of code, with clear effort put into it. He smiled. It looked like Jia was here to stay. It was a shame to lose the testing infrastructure he had built himself over the years, but it was a step in the right direction for the project. Jia's patch needed some improvements here and there, but was remarkably high quality. Jia clearly knew his stuff.
