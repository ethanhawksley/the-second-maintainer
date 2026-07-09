# Chapter 1

Introduction to open source software.
Lasse Collin's backstory, getting into open source, making xz.

## 2005

Lasse Collin (Larhzu):

- Finland
- Born ~1983
- So early twenties in 2005, and late 30s in 2022
- Pianist in his youth
- Founded the Tukaani project

Ville Koskinen (w-ber):

- Created Bob the Toucan
- Created the C++ `lzma` command utility, replacing Lasse's shell script wrapper `lzmash`
- After leaving, works at Statistics Finland

Mikko Pouru (pma):

- Highly private individual
- Worked with Lasse and Igor Pavlov on the architectural design and review of the .xz file format.
- Does competitive Brazilian Jiu-Jitsu and submission grappling.

Antti Aalto (anpi):

- Finnish scouting community

Daniel Liljeqvist (Dasajev):

- After leaving, Senior DevOps Engineer at Nitro Games

Jaakko Pallari (jaakkop):

- After leaving, made Pallari Consulting

Programmers and uni students worked on Tukaani Linux, a Slackware-based distribution.

Bob the Toucan made by Ville Koskinen.

Wanted to fit the distro on a 700 MiB ISO-9660 image. Using LZMA instead of gzip greatly helped.

Data in 1000 MiB gzipped was 700 MiB with LZMA.

Previous Slackware packages were .tgz (abbreviation of .tar.gz), and new packages were appropriately .tlz (abbreviation of .tar.lzma).

The first version of LZMA Utils is released (4.22.0).

Includes a shell script called lzmash, that functioned akin to gzip.

Also included a less than 10 KiB decoder named lzmadec, wrapping Igor Pavlov's LZMA SDK. Built as a lightweight tool for situations where the full library would be too large.

Both lzmash and the lzmadec wrapper were written by Lasse Collin.

## 2006

LZMA Utils 4.32.0beta1 introduced a tool by Ville Koskinen.
Written in C++, replaced lzmash and LZMA_Alone.

The new tool was also named lzma, like the old LZMA_Alone executable. File format stayed the same, command line flags differed.

## Early 2007

Lasse wrote a decoder library named liblzmadec. Similar API to zlib on the surface, but differed significantly meaning it was not very easy to use in other programs using zlib at the time.

lzmadec was converted to use liblzmadec.

Alexandre Sauvé helped convert the build system to GNU Autotools. Made it easier to test less portable features by the tool.

Tukaani Linux deprecated, but work on compression continued.

## 2007-08-16

First version of XZ Utils was called LZMA Utils, version 4.42.0alpha. Programmed in C instead of C++.

The new LZMA Utils was based around liblzma, a compression library with an API modelled after zlib.

## 2007–2008

The .lzma file format was designed for embedded systems with minimal features, and wasn't ideal. It was missing magic bytes and integrity.

Igor and Lasse began developing the new file format.
Helped by Ville Koskinen.
Reviewed by Mark Adler, Mikko Pouru, H. Peter Anvin, and Lars Wirzenius.

The new format took quite a while, Lasse had personal reasons slowing pace of development. He acknowledged it took too long.

## 2008

Igor Pavlov later made a C version of the C++ LZMA encoder.

As development took so long, the old file format had gotten popular. They needed a new file extension, so they chose .xz
With that, a new file format was born.

[Lasse, with help from others](https://github.com/kobolabs/liblzma/blob/87b7682ce4b1c849504e2b3641cebaad62aaef87/doc/history.txt), designs the .xz file format using the LZMA2 compression algorithm, which compresses files to about 70% of what gzip did.

.xz added support for multiple compression algorithms and chaining different algorithms together. It also uses LZMA2 instead of original LZMA as the base layer.

## 2009-01-14

Once the file format had been solidified on .xz, LZMA Utils was officially renamed XZ Utils .

Over time, the format becomes widely used for compressing tar files, Linux kernel images, and many other uses .
