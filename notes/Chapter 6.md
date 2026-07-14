# Chapter 6

Jia adds the malicious code.
Distributions start to add the code.
Linux Landlock detection broken.
Systemd removing dependency on xz, race against time.

## 2024-02-23

Jia [merges hidden backdoor binary code](https://git.tukaani.org/?p=xz.git;a=commitdiff;h=cf44e4b7f5dfdbf8c78aef377c10f71e274f63c0) well hidden inside some binary test input files. The README already said (from long before Jia showed up) “This directory contains bunch of files to test handling of .xz, .lzma (LZMA_Alone), and .lz (lzip) files in decoder implementations. Many of the files have been created by hand with a hex editor, thus there is no better “source code” than the files themselves.” Having these kinds of test files is very common for this kind of library. Jia took advantage of this to add a few files that wouldn’t be carefully reviewed.

## 2024-02-24

Jia [tags and builds v5.6.0](https://git.tukaani.org/?p=xz.git;a=commitdiff;h=2d7d862e3ffa8cec4fd3fdffcd84e984a17aa429) and publishes an xz-5.6.0.tar.gz distribution with an extra, malicious build-to-host.m4 that adds the backdoor when building a deb/rpm package. This m4 file is not present in the source repository, but many other legitimate ones are added during package as well, so it’s not suspicious by itself. But the script has been modified from the usual copy to add the backdoor.

The backdoor requires Jia's secret key in order to activate, otherwise it does nothing. This defeats all automatic scanners that could try detecting it.

## 2024-02-24

Gentoo [starts seeing crashes in 5.6.0](https://bugs.gentoo.org/925415). This seems to be an actual ifunc bug, rather than a bug in the hidden backdoor, since this is the first xz with Hans Jansen’s ifunc changes, and Gentoo does not patch sshd to use libsystemd, so it doesn’t have the backdoor.

## 2024-02-26

Debian [adds xz-utils 5.6.0-0.1](https://tracker.debian.org/news/1506761/accepted-xz-utils-560-01-source-into-unstable/) to unstable.

## 2024-02-27

Jia starts emailing Richard W.M. Jones to update Fedora 40 (privately confirmed by Rich Jones).

## 2024-02-28

Debian [adds xz-utils 5.6.0-0.2](https://tracker.debian.org/news/1507917/accepted-xz-utils-560-02-source-into-unstable/) to unstable.

## 2024-02-28

The program needs to detect support for sandboxing when compiling, otherwise it won't sandbox. Jia added a typo to the test so it would [always fail](https://git.tukaani.org/?p=xz.git;a=commit;h=328c52da8a2bbb81307644efdb58db2c422d9ba7). A full stop at the start of an empty line was easily missed.

Jia [breaks landlock detection](https://git.tukaani.org/?p=xz.git;a=commitdiff;h=a100f9111c8cc7f5b5f0e4a5e8af3de7161c7975) in configure script by adding a subtle typo in the C program used to check for [landlock support](https://docs.kernel.org/userspace-api/landlock.html). The configure script tries to build and run the C program to check for landlock support, but since the C program has a syntax error, it will never build and run, and the script will always decide there is no landlock support. Lasse is listed as the committer; he may have missed the subtle typo, or the author may be forged. Probably the former, since Jia did not bother to forge committer on his many other changes. This patch seems to be setting up for something besides the sshd change, since landlock support is part of the xz command and not liblzma. Exactly what is unclear.

## 2024-02-29

On GitHub, @teknoraver [sends pull request](https://github.com/systemd/systemd/pull/31550) to stop linking liblzma into libsystemd. It appears that this would have defeated the attack. [Kevin Beaumont speculates](https://doublepulsar.com/inside-the-failed-attempt-to-backdoor-ssh-globally-that-got-caught-by-chance-bbfe628fafdd) that knowing this was on the way may have accelerated the attacker’s schedule. @teknoraver [commented on HN](https://news.ycombinator.com/item?id=39916125) that the liblzma PR was one in a series of dependency slimming changes for libsystemd; there were [two](https://github.com/systemd/systemd/pull/31131#issuecomment-1917693005) [mentions](https://github.com/systemd/systemd/pull/31131#issuecomment-1918667390) of it in late January.

## 2024-03-04

RedHat distributions [start seeing Valgrind errors](https://bugzilla.redhat.com/show_bug.cgi?id=2267598) in liblzma’s `_get_cpuid` (the entry to the backdoor). The race is on to fix this before the Linux distributions dig too deeply.

[Jia quickly applies a hotfix to the backdoor](https://git.tukaani.org/?p=xz.git;a=commitdiff;h=e5faaebbcf02ea880cfc56edc702d4f7298788ad), silencing the Valgrind errors that had been appearing.

## 2024-03-05

The [libsystemd PR is merged](https://github.com/systemd/systemd/commit/3fc72d54132151c131301fc7954e0b44cdd3c860) to remove liblzma. Another race is on, to get liblzma backdoor’ed before the distros break the approach entirely.

## 2024-03-05

Debian [adds xz-utils 5.6.0-0.2](https://tracker.debian.org/news/1509743/xz-utils-560-02-migrated-to-testing/) to testing.

## 2024-03-05

Jia commits [two ifunc](https://git.tukaani.org/?p=xz.git;a=commitdiff;h=ed957d39426695e948b06de0ed952a2fbbe84bd1) [bug fixes](https://git.tukaani.org/?p=xz.git;a=commitdiff;h=4e1c97052b5f14f4d6dda99d12cbbd01e66e3712). These seem to be real fixes for the actual ifunc bug. One commit links to the Gentoo bug and also to an [upstream GCC bug](https://gcc.gnu.org/bugzilla/show_bug.cgi?id=114115).

## 2024-03-08

Jia [commits purported Valgrind fix](https://git.tukaani.org/?p=xz.git;a=commitdiff;h=82ecc538193b380a21622aea02b0ba078e7ade92). This is a misdirection, but an effective one.

## 2024-03-09

Jia [commits updated backdoor files](https://git.tukaani.org/?p=xz.git;a=commitdiff;h=74b138d2a6529f2c07729d7c77b1725a8e8b16f1). This is the actual Valgrind fix, changing the two test files containing the attack code. “The original files were generated with random local to my machine. To better reproduce these files in the future, a constant seed was used to recreate these files.”

## 2024-03-09

Jia [tags and build v5.6.1](https://git.tukaani.org/?p=xz.git;a=commitdiff;h=fd1b975b7851e081ed6e5cf63df946cd5cbdbb94) and publishes xz 5.6.1 distribution, containing a new backdoor. To date I have not seen any analysis of how the old and new backdoors differ.

## 2024-03-20

Lasse sends LKML a patch set [replacing his personal email](https://lkml.org/lkml/2024/3/20/1009) with [both himself and Jia](https://lkml.org/lkml/2024/3/20/1008) as maintainers of the xz compression code in the kernel. There is no indication that Lasse was acting nefariously here, just cleaning up references to himself as sole maintainer. Of course, Jia may have prompted this, and being able to send xz patches to the Linux kernel would have been a nice point of leverage for Jia’s future work.


## 2024-03-25

Jia [changes SECURITY.md so reporting bugs no longer needs to go in depth](https://git.tukaani.org/?p=xz.git;a=commitdiff;h=af071ef7702debef4f1d324616a0137a5001c14c;hp=0b99783d63f27606936bb79a16c52d0d70c0b56f)

Hans Jansen is back, [filing a Debian bug](https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1067708) to get xz-utils updated to 5.6.1. Like in the 2022 pressure campaign, more name###@mailhost addresses that don’t otherwise exist on the internet show up to advocate for it.

## 2024-03-27

Debian unstable updates to 5.6.1.

## 2024-03-28

Jia [files an Ubuntu bug](https://bugs.launchpad.net/ubuntu/+source/xz-utils/+bug/2059417) to get xz-utils updated to 5.6.1 from Debian.
