# Chapter 1

Lasse backstory.
Built XZ unpaid, used by millions, unrecognised.
Exhausted, doing it for a noble cause, selfless.

## 2005

Small group working on the Tukaani distribution, a Slackware fork.

Wanted to fit the distro on a 700 MiB ISO-9660 image. Using LZMA instead of gzip greatly helped. 

Data in 1000 MiB gzipped was 700 MiB with LZMA.

Previous Slackware packages were .tar.gz, and new packages were appropriately .tar.lzma

--- 

The first version of LZMA Utils is designed (4.22.0)

Includes a shell script called lzmash, that functioned akin to gzip.

Also included a less than 10 KiB decoder named lzmadec. Built primarily for embedded systems.

Both lzmash and lzmadec were written by Lasse Collin.

---

LZMA Utils 4.32.0beta1 introduced a tool by Ville Koskinen.
Written in C++, replaced lzmash and LZMA_Alone.

The new tool was also named lzma, like the old LZMA_Alone executable. File format stayed the same, command line flags differed.

Lasse wrote a decoder library named liblzmadec. Similar API to zlib, but differed subtly.

lzmadec was converted to use liblzmadec.

Alexandre Sauvé helped convert the build system to GNU Autotools. Made it easier to test less portable features by the tool.

---

The .lzma file format was designed for embedded systems with minimal features, and wasn't ideal. It was missing magic bytes and integrity.

Igor and Lasse began developing the new file format with some help from Ville Koskinen. Mark Adler, Mikko Pouru, H. Peter Anvin, and Lars Wirzenius minorly helped.

The new format took quite a while, Lasse had personal reasons slowing pace of development. He acknowledged it took too long.

As development took so long, the old file format had gotten popular. They needed a new file extension, so they chose .xz arbitrarily. With that, a new file format was born.

.xz added support for multiple compression algorithms and chaining different algorithms together. It also uses LZMA2 instead of original LZMA as the base layer.

---

First version of XZ Utils was called LZMA Utils, version 4.42.0alphas. Programmed in C instead of C++.

Igor Pavlov later made a C version of the C++ LZMA encoder.

The new LZMA Utils was based around liblzma, a compression library with an API modeled after zlib.

Once the file format had been solidified on .xz, LZMA Utils was officially renamed XZ Utils.

Over time, the format becomes widely used for compressing tar files, Linux kernel images, and many other uses.

