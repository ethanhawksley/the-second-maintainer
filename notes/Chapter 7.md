# Chapter 7

Andres Freund discovers the code by himself.
Andres alerts the relevant security email addresses.

Andres Freund:
- German software engineer, open-source developer, and database specialist
- Focused on Postgres
- Contributed to Postgres since 2009
- Principal Software Engineer at Microsoft

## 2024-02-26

xz-utils 5.6.0-0.1 in debian unstable.

## 2024-02-28

xz-utils 5.6.0-0.2 in debian unstable.

## 2024-02-XX

Andres testing PostgreSQL in late February.

Using the -fno-omit-frame-pointer flag in testing.

The attacker hadn't anticipated this configuration, so it created Valgrind errors.

## 2024-03-05

xz-utils 5.6.0-0.2 in debian testing.

## 2024-03-27

Andres testing Postgres performance on a slow server without turbo boost.

In order to free up more CPU for Postgres, Andres starts investigating the resource usage of other processes.

The server was facing automated probing attacks from the wider internet, SSH password authentication disabled.

Andres noticed that SSH login attempts took 500ms longer than usual (800ms instead of 300ms).

Attempted to use standard debuggers but they just wouldn't work (anti-debugging measures in place).

Using his debugging knowledge, he uses Intel PT (Processor Trace) which leverages hardware-level tracing.

Intel PT successfully bypassed the anti-debugging measures, and didn't affect the performance so timings were still accurate.

Privately notifies Debian he's investigating. Behind the scenes, Debian immediately escalates to Red Hat.

Red Hat's Product Security department begins analysing the package.

Discovers that it is slower due to hooking and overwriting the ifuncs.

## 2024-03-28

Can't focus in his meetings, he knows he's sitting on a major backdoor.

Afternoon, discovers that the backdoor had been hidden in the release tarball, and git is entirely clean.

A modified line on the build-to-host.m4 activated the backdoor.

Discovers Jia Tan submitted an urgent request for Ubuntu maintainers to merge XZ Utils 5.6.1 into Ubuntu Stable.

Formally escalates to distros@openwall.
Debian and Arch work to secretly roll back XZ to 5.4.5

Debian [rolls back 5.6.1](https://tracker.debian.org/news/1515519/accepted-xz-utils-561really545-1-source-into-unstable/), introducing 5.6.1+really5.4.5-1.

Arch Linux [changes 5.6.1 to build from Git](https://gitlab.archlinux.org/archlinux/packaging/packages/xz/-/commit/881385757abdc39d3cfea1c3e34ec09f637424ad).

## 2024-03-29

Andres publicly declares bug on oss-security 08:51 AM.
https://www.openwall.com/lists/oss-security/2024/03/29/4
