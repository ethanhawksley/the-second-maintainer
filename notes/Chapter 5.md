# Chapter 5

oss-fuzz moved to Jia email.
Hans Jensen appears, introduces IFUNC.
Jia disables IFUNC in oss-fuzz runs.
Project homepage moved to GitHub Pages under Jia's control.

## 2023-03-20

Jia [updates Google oss-fuzz configuration](https://github.com/google/oss-fuzz/commit/6403e93344476972e908ce17e8244f5c2b957dfd) to send bugs to them.

## 2023-06-22

Hans Jansen sends [a pair](https://git.tukaani.org/?p=xz.git;a=commitdiff;h=23b5c36fb71904bfbe16bb20f976da38dadf6c3b) of [patches](https://git.tukaani.org/?p=xz.git;a=commitdiff;h=b72d21202402a603db6d512fb9271cfa83249639), merged by Lasse, that use the “[GNU indirect function](https://maskray.me/blog/2021-01-18-gnu-indirect-function)” feature to select a fast CRC function at startup time. The final commit is [reworked by Lasse](https://git.tukaani.org/?p=xz.git;a=commitdiff;h=ee44863ae88e377a5df10db007ba9bfadde3d314) and merged by Jia. This change is important because it provides a hook by which the backdoor code can modify the global function tables before they are remapped read-only. While this change could be an innocent performance optimisation by itself, Hans returns in 2024 to promote the backdoored xz and otherwise does not exist on the internet.

Jia gives the pull request a full go ahead, but Lasse remains skeptical on the [GitHub PR](https://github.com/tukaani-project/xz/pull/53).

## 2023-07-07

Jia [disables ifunc support during oss-fuzz builds](https://github.com/google/oss-fuzz/commit/d2e42b2e489eac6fe6268e381b7db151f4c892c5), claiming ifunc is incompatible with address sanitiser. This may well be innocuous on its own, although it is also more groundwork for using ifunc later.

## 2023-08-02

Jia releases 5.4.4, mostly translations and documentation. Can build against WASI SDK (WebAssembly) without threading.

## 2023-09-25

Hans [returns](https://github.com/tukaani-project/xz/pull/64). Rearranges the CRC library code, with good speedup. Gets approved by Jia and okayed by Lasse. Continues to work on it.

## 2023-09-29

Hans finishes the code 29th September.

## 2023-10-05

Lasse gets back at 5th October.
> I'm sorry for the delay. Neither Jia or I have been able to look at this in the past days. :-( 

They continue to back and forth. Discuss 32bit implementation. Hans gives it a go, but is testing in 32bit mode on a 64bit computer as that's all he has.

Also try benchmarking it against assembly.

## 2023-10-13

Jia merges it. Lasse finds out its merged 3 hours later.

> I'm glad this has been merged. Thanks!

Decide to do more tests in their own time for comparisons on 32-bit computers.

> We (or likely it's mostly Jia) will do a few tests later.

> We committed some changes to reorganise the code.

Hans then says he was intending to add further improvements, but realised his CPU didn't support the required instruction sets.

Lasse thanked him and then moved on.

## 2023-10-18

Jia does a full pass over the CRC code, making heavy modifications and optimisations. It also brings it more in line with the project's style.

## 2023-10-22

Lasse adds sandboxing support.

## 2023-10-23

Jia disables sandboxing when testing with AddressSanitizer

## 2023-11-01

Jia releases 5.4.5
Fixes edge case with windows reserved filenames con and nul.
Lots of fixes to the build system.

## 2023-11-30

Jia modified how the build system handled ifunc detection. This made it more dynamic and configurable.

## 2023-12-19

Jia added full strict sandboxing to xzdec. It is loosely sandboxed for all but the last file to be extracted, which it then changes to be fully strict.

## 2024-01-19

Jia [moves web site to GitHub pages](https://git.tukaani.org/?p=xz.git;a=commitdiff;h=c26812c5b2c8a2a47f43214afe6b0b840c73e4f5), giving them control over the XZ Utils web page. Lasse presumably created the DNS records for the xz.tukaani.org subdomain that points to GitHub pages. After the attack was discovered, Lasse deleted this DNS record to move back to [tukaani.org](https://tukaani.org), which he controls.

## 2024-01-26

Jia releases 5.4.6
Incredibly minor update.
Regression fixed from 5.4.2