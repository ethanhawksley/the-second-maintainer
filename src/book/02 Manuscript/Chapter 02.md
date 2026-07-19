# Chapter 2

In 2021, 12 years after its creation, XZ remained a dominant file format. With its popularity, however, came bug reports. Plenty of bug reports. Even though many of them were minor, it still took plenty of time for Lasse to deal with them all.

It was November 10th when he checked his inbox to find a new email. It came two weeks ago from another developer named Jia Tan, and it contained a patch for XZ Utils. He proposed the creation of a special file named `.editorconfig`, which would control how text editors would format the source code. Lasse applied the patch to XZ Utils, and it did exactly as described. No longer would he have to manage the style of code himself. There were a couple of small issues though, so he began to draft a reply.

> Thanks! I hadn't heard about this before, but it sounds nice.

There hadn't been much activity on XZ Utils recently, so the least he could do would be to be friendly to any new developers. Who knew, maybe he could even stay?

> There are multiple indentation styles

Jia's configuration was well suited to the project. It was clear he had read through the style beforehand. Lasse, being more familiar, noticed a handful of exceptions to Jia's overly simple rules. He explained the edge cases in the email and suggested a more specific version of `.editorconfig`. He ended his email warmly.

> Is it good enough or did I add bad bugs? :-)

It's hard work to maintain software, but when you get genuine help from others, it's all worthwhile.

---

Two days passed, and his email got another response back from Jia. It picked out a tiny mistake he had made in his original email, and provided a fix. Finally, it ended with a nitpick:

> Why do you use tab width 8 for your source files?
> Either way, it's your preference, and I will follow your lead.

Lasse smiled. He was a bit old-fashioned with his habits. He still used tabs that were eight spaces wide, instead of the more modern four, but Jia was understanding and didn't push for a move to four. It was Lasse's project.

He applied the final patch to XZ Utils, and then uploaded the code to GitHub - a website for hosting code publicly. This exchange had rejuvenated Lasse's hope for the project. Maybe, just maybe, he wouldn't have to keep developing XZ Utils alone.

---

Christmas rolled around the corner, and a new email appeared on the mailing list. It was from Sebastian Siewior - a developer of the Debian distro. He asked if parallel decompression would get implemented.

Lasse paused to consider. He'd been meaning to get round to this for a while. Over the years, XZ had earned a reputation for compressing well, but decompressing slowly compared to other formats. If he implemented parallel decompression, this would improve XZ Utils very meaningfully.

Implementing parallel decompression is no mean feat. It would take quite some time for a fully stable implementation of the feature to be ready. The arrival of Jia did give him some hope, though. His reviews would be invaluable if he stuck around.

After an early draft of the feature had been made, and as he hoped, Jia stuck around after adding `.editorconfig`. He highlighted where Lasse should restructure his code, and spotted a simple typo in the documentation.

Sadly for Sebastian, parallel decompression was not ready in time for Christmas. Major releases of XZ Utils were infrequent, and the feature required more testing than usual due to its complexity. Meanwhile, more development was in the works.

---

Two weeks after Sebastian's request, Jia had prepared a new patch. He had ported over the existing testing infrastructure to a new framework named `seatest`, a pun on the name of the C programming language. What shocked Lasse most wasn't the nature of the patch, but rather the size. Hundreds of lines of code, with clear conscious effort put into it.

He smiled. It looked like Jia was here to stay. It was a bit sad to lose the testing infrastructure he had built himself over the years, but it was a step in the right direction for the project. His patch needed some improvements here and there, but was remarkably high quality. Jia clearly knew his stuff.
