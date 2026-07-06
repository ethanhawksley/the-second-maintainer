# Chapter 5

oss-fuzz moved to Tan email.
Jensen appears, introduces IFUNC.
Tan disables IFUNC in oss-fuzz runs.
Project homepage moved to GitHub Pages under Tan's control.

## 2023-03-20
Jia Tan [updates Google oss-fuzz configuration](https://github.com/google/oss-fuzz/commit/6403e93344476972e908ce17e8244f5c2b957dfd) to send bugs to them.

## 2023-06-22
Hans Jansen sends [a pair](https://git.tukaani.org/?p=xz.git;a=commitdiff;h=23b5c36fb71904bfbe16bb20f976da38dadf6c3b) of [patches](https://git.tukaani.org/?p=xz.git;a=commitdiff;h=b72d21202402a603db6d512fb9271cfa83249639), merged by Lasse Collin, that use the “[GNU indirect function](https://maskray.me/blog/2021-01-18-gnu-indirect-function)” feature to select a fast CRC function at startup time. The final commit is [reworked by Lasse Collin](https://git.tukaani.org/?p=xz.git;a=commitdiff;h=ee44863ae88e377a5df10db007ba9bfadde3d314) and merged by Jia Tan. This change is important because it provides a hook by which the backdoor code can modify the global function tables before they are remapped read-only. While this change could be an innocent performance optimization by itself, Hans Jansen returns in 2024 to promote the backdoored xz and otherwise does not exist on the internet.

## 2023-07-07
Jia Tan [disables ifunc support during oss-fuzz builds](https://github.com/google/oss-fuzz/commit/d2e42b2e489eac6fe6268e381b7db151f4c892c5), claiming ifunc is incompatible with address sanitizer. This may well be innocuous on its own, although it is also more groundwork for using ifunc later.

## 2024-01-19
Jia Tan [moves web site to GitHub pages](https://git.tukaani.org/?p=xz.git;a=commitdiff;h=c26812c5b2c8a2a47f43214afe6b0b840c73e4f5), giving them control over the XZ Utils web page. Lasse Collin presumably created the DNS records for the xz.tukaani.org subdomain that points to GitHub pages. After the attack was discovered, Lasse Collin deleted this DNS record to move back to [tukaani.org](https://tukaani.org), which he controls.

