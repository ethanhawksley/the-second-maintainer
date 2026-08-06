# Chapter 6

Jia Tan had spent two and a half years working on XZ Utils with Lasse. Two and a half years building trust to become a maintainer. Two and a half years spent waiting. All this time, he hadn't been a maintainer from the goodness of his heart. No, he had been planning to create a backdoor in the software - where he could fully control any computer he wished.

Despite there being so many users of XZ Utils, many were still using outdated versions. Jia needed them to update in order to compromise them. The best way to achieve this would be to create some much-wanted features, and he prepared a patch to do exactly that.

XZ Utils included specialist filters to compress code for certain CPU architectures better, such as *x64* and *ARM*. Jia created a filter for the architecture called *RISC-V*. This was a nicher architecture, but steadily growing in popularity. He knew people would update for it.

This feature was combined with sandboxing to form version 5.5.1alpha. Users quickly responded - they loved the features and were excited for the next stable version. Jia had now laid the bait. It was time to add the backdoor.

---

Jia's goal wasn't merely to compromise XZ Utils. In his current position, he could do that easily. He wanted to hijack an even more significant piece of software: OpenSSH. 

OpenSSH is what lets administrators log in and manage servers from anywhere in the world. It lets companies rent out servers in vast data centres without needing to send somebody over with a keyboard. Over 75% of the Fortune 1000 use it day-to-day. Since it was installed on millions of company servers, Jia thought it was a prime target.

However, software as important as OpenSSH is always held under extreme scrutiny. Security researchers pore over every line of code, checking and double-checking for vulnerabilities and backdoors. People have tried and failed to break into OpenSSH - but those people were not Jia Tan.

To prevent themselves from reinventing the wheel, the developers of OpenSSH use what are known as "libraries". Libraries are pre-written sections of code that can be easily used in a developer's programs. OpenSSH depended on a handful of libraries, but Jia cared about one: Systemd.

On most Linux distros, Systemd is the glue that connects the operating system to the programs running on it. OpenSSH uses it to manage notifications and alerts. Due to its privileged position, researchers heavily scrutinise it. Yet, it had a fatal flaw.

Systemd depended on the library XZ Utils. This meant every time a company ran OpenSSH with Systemd, they also ran it with XZ Utils. Unlike the other two, XZ Utils flew under the radar of most security researchers - and now Jia had direct access to modify the code however he wanted.

---

The backdoor was ingenious. Since Hans had added ifunc support to the program, Jia could incorporate it without much suspicion. Ifuncs were typically used to swap the software's own functions, but he manipulated them to swap OpenSSH's code. His target was one of the most important functions: *RSA_public_decrypt*. This was responsible for checking whether the user connecting to the server is allowed to log in. The new function checked if the person verified themself as Jia specifically. If they were, OpenSSH would run whatever arbitrary code he supplied to it. It gave him full control over all the servers he could ever ask for.

Even though he could add whatever code he liked, there were still prying eyes checking what he changed. As a countermeasure, he layered the backdoor behind several layers of obfuscation.

If XZ Utils recognised a researcher was inspecting it with a debugger, it wouldn't inject the backdoor. It would also be disabled if the program wasn't OpenSSH. He was careful to avoid unnecessary risk of exposure.

When XZ Utils was being compiled to an executable, it checked if it was on the Debian or Red Hat Linux distros. These are the two most popular distros used by servers. Jia didn't want to hack individuals: he was after companies and governments.

He hid all this complex code in plain sight. The program's automated tests included compressing and decompressing files. He split the backdoor into two halves. One half of the backdoor's code resided inside a "corrupted" archive file that only he knew how to decompress. The other half was hidden inside a functional archive file, but encoded with a cipher so it appeared to be random if decompressed normally.

In the folder containing the test files was a notice written by Lasse in 2008.

> Many of the files have been created by hand. There is no better "source code" than the files themselves.

Thanks to this, Jia had an excuse to add his archives without anybody inspecting closely. The very next day, he released version 5.6.0. With the backdoor in place, he just needed people to update.

---

Just an hour later, the Linux distro Gentoo made a bug report for XZ Utils. He panicked. How had they found the backdoor so soon? When he checked the report, it turned out it was just a compatibility issue with ifuncs. This was the first version including Hans' optimisations, so there were a few issues that needed ironing out. He quickly wrote a reply explaining the bug to Gentoo and created a fix.

Two days passed, and the Debian distro added version 5.6.0 to their unstable packages. Anybody running unstable Debian would update and be backdoored. Jia sent a few emails to Richard Jones, the XZ Utils packager for the Fedora distro. He asked him to update the version used in Fedora, and Richard happily obliged. Fedora's testing version was now also backdoored.

Jia decided to take precautions to prevent another Gentoo incident. Although the backdoor bypassed Lasse's sandboxing, it didn't hurt to be careful. In what seemed like a routine update, he added a subtle typo to the sandboxing code so it would no longer run.

Meanwhile, a developer of Systemd prepared a patch that threatened to ruin his entire plan. It changed Systemd so it would no longer depend on XZ Utils. This would break the dependency chain from OpenSSH to Systemd to XZ Utils, foiling Jia's entire plan. It was now a race against time to update XZ Utils before Systemd patched it out.

---

After a few days, Red Hat created a new bug report for XZ Utils. They were testing the program with the debugging tool *Valgrind*, and noticed a variety of memory errors. They were related once again to the use of ifuncs. It seemed the Gentoo patch hadn't fixed all of Jia's problems. Since Red Hat Linux was one of his main targets, this was potentially disastrous. He modified the backdoored test files and fixed the error. He invented an excuse to explain his changes.

> The original files were generated with random local to my machine. To better reproduce these files in the future, a constant seed was used to recreate these files.

It was a lie, but a plausible lie. He also modified some of Hans' ifunc code. It was a distraction from the test files, and it worked on Red Hat. They stopped investigating the software too closely. He then released version 5.6.1, containing all the previously mentioned fixes.

---

The next two weeks dragged on for Jia. He waited patiently for the new version to spread. It was now securely in both Debian's and Red Hat's pre-releases for their distros. Once it was released into their main distros, he could finally make use of the backdoor.

On the 25th March, he removed the requirement from *SECURITY.md* for researchers to ensure bugs were reproducible. He hoped that it would guide people to examine the software less closely.

Two days later, Debian unstable updated to 5.6.1, and the next day Jia sent a request to the Ubuntu distro to update to 5.6.1. The package was just about to hit Debian's and Red Hat's stable releases, and Jia couldn't wait.
