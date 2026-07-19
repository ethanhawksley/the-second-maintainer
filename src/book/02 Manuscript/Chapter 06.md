# Chapter 6

Jia Tan sat back in his chair and smiled. Two and a half years working on XZ Utils with Lasse. Two and a half years building trust and becoming a maintainer. Two and a half years spent waiting for this point.

First, he created a new major feature. XZ Utils efficiently compressed machine code for various hardware types. His feature added support for compressing `RISC-V` software, a somewhat uncommon type. Even though it was not widely used, it was notable enough that most people would update.

He packaged the feature together with Lasse's sandboxing work, and released the bundle as version 5.5.1alpha. Users responded quickly and positively - they were excited for the next major version to become available. Time for the next phase.

---

His goal wasn't to compromise XZ Utils. That would be far too easy, and even though it was widely used, he knew he could do better. His aim was an even more significant piece of software: OpenSSH. 

OpenSSH's purpose was to allow administrators to log in and manage servers from anywhere in the world. It let companies rent out servers in vast data centres without needing to send somebody over with a keyboard, which led to over 75% of the Fortune 1000 using it day-to-day. Since it was installed on millions of company servers, it was a prime target.

However, software as important as OpenSSH was held under extreme scrutiny. Security researchers pored over every line of code, checking and double-checking for backdoors. People had tried and failed to break into OpenSSH - but those people were not Jia Tan.

It would be very inefficient if programmers had to keep coding the same logic over and over. To resolve this, they create "libraries". Libraries are pre-written sections of code that can be easily added to their programs. They are known as "dependencies". OpenSSH had a handful of dependencies, but Jia cared about one - Systemd.

On most Linux distros, Systemd is the glue that connects the operating system to the programs running on it. OpenSSH uses it to manage notifications and alerts. Due to its privileged position, researchers heavily scrutinised it. Yet it had a fatal flaw.

Systemd depended on XZ Utils. Every time a company ran OpenSSH with Systemd, they also ran it with XZ Utils. Unlike the other two, XZ Utils did not attract much attention from researchers. Jia had direct access to the code and was trusted by Lasse. He effectively had full control, so he began to make use of it.
---

The backdoor was ingenious. Since Hans had added ifunc support to the program, Jia could incorporate it without much suspicion. Ifuncs were typically used to swap the software's own functions, but he manipulated them to swap perhaps OpenSSH's most secure function: `RSA_public_decrypt`. This was responsible for checking whether the user connecting to the server is allowed to log in. The new function still let people log in as usual, but if the person verified themself as Jia specifically, OpenSSH ran whatever arbitrary code he supplied to it. It gave him full control over all the servers he could ever ask for.

Even though he could add whatever code he liked, there were still prying eyes checking what he changed. As a countermeasure, he layered the backdoor behind several layers of obfuscation.

If the code recognised researchers were inspecting it with tools like debuggers, it would disable itself to avoid detection. It would also be disabled if the program wasn't OpenSSH. Jia only cared about breaking into OpenSSH, so no need to risk discovery on other programs.

When XZ Utils was being compiled to an executable, it also checked if it was being compiled for the Debian or Red Hat Linux distros. These are the most popular distros for company servers to use, as opposed to what individuals would use.

He hid all this complex code in plain sight. The automated tests tried compressing and decompressing various files to ensure the program worked. He split the backdoor into two halves. One half of the backdoor's code resided inside a "corrupted" archive file that only he knew how to decompress. The other half was hidden inside a functional archive file, but encoded with a cipher so it appeared to be random if decompressed normally.

In the folder containing the test files was a notice written by Lasse in 2008.

> Many of the files have been created by hand. There is no better "source code" than the files themselves.

Thanks to this, Jia had an excuse to add his archives without anybody inspecting closely. The very next day, he released version 5.6.0. With the backdoor in place, he just needed people to update.

---

Just an hour later, the Linux distro Gentoo made a bug report for XZ Utils. He panicked. How had they found the backdoor so soon? When he checked the report, it turned out it was just a compatibility issue with ifuncs. This was the first version including Hans' optimisations, so there were a few issues that needed ironing out. He quickly wrote a reply explaining the bug to Gentoo and created a fix.

Two days passed, and the Debian distro added version 5.6.0 to their unstable packages. Anybody running unstable Debian would update and be backdoored. Jia sent a few emails to Richard Jones, the XZ Utils packager for the Fedora distro. He asked him to update the version used in Fedora, and Richard happily obliged. Fedora's testing version was now also backdoored.

Jia decided to take precautions to prevent another Gentoo incident. Although the backdoor bypassed Lasse's sandboxing, it didn't hurt to be careful. In what seemed like a routine update, he added a subtle typo to the sandboxing code so it would no longer run.

Meanwhile, a developer of Systemd prepared a patch that threatened to ruin his entire plan. It changed Systemd so it would no longer depend on XZ Utils. This would break the dependency chain from OpenSSH to Systemd to XZ Utils, foiling Jia's entire plan. It was now a race against time to update XZ Utils before Systemd patched it out.

---

After a few days, Red Hat created a new bug report for XZ Utils. They were testing the program with the debugging tool `Valgrind`, and noticed a variety of memory errors. They were related once again to the use of ifuncs. It seemed the Gentoo patch hadn't fixed all of Jia's problems. Since Red Hat Linux was one of his main targets, this was potentially disastrous. He modified the backdoored test files and fixed the error. He invented an excuse to explain his changes.

> The original files were generated with random local to my machine. To better reproduce these files in the future, a constant seed was used to recreate these files.

It was a lie, but a plausible lie. He also modified some of Hans' ifunc code. It was a distraction from the test files, and it worked on Red Hat. They stopped investigating the software too closely. He then released version 5.6.1, containing all the previously mentioned fixes.

---

The next two weeks dragged on for Jia. He waited patiently for the new version to spread. It was now securely in both Debian's and Red Hat's pre-releases for their distros. Once it was released into their main distros, he could finally make use of the backdoor.

Whilst he waited, on the 25th March he simplified the `SECURITY.md`. He removed the requirement for all bugs to be fully researched and reproducible, with the aim that it would guide people to examine the software less closely.

Two days later, Debian unstable updated to 5.6.1, and the next day Jia sent a request to the Ubuntu distro to update to 5.6.1. The package was just about to hit Debian's and Red Hat's stable releases, and Jia couldn't wait.
