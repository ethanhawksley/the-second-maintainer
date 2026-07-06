# Chapter 1

Introduction to open source software.
Collin's backstory, getting into open source, making xz.

# 2005

Small group working on the Tukaani distribution, a Slackware fork.

Wanted to fit the distro on a 700 MiB ISO-9660 image. Using LZMA instead of gzip greatly helped. 

Data in 1000 MiB gzipped was 700 MiB with LZMA.

Previous Slackware packages were .tgz (abbreviation of .tar.gz), and new packages were appropriately .tlz (abbreviation of.tar.lzma)

The first version of LZMA Utils is designed (4.22.0)

Includes a shell script called lzmash, that functioned akin to gzip.

Also included a less than 10 KiB decoder named lzmadec. Built as a lightweight tool for situations where the full library would be too large.

Both lzmash and lzmadec were written by Lasse Collin.

# 2006

LZMA Utils 4.32.0beta1 introduced a tool by Ville Koskinen.
Written in C++, replaced lzmash and LZMA_Alone.

The new tool was also named lzma, like the old LZMA_Alone executable. File format stayed the same, command line flags differed.

# Early 2007

Lasse wrote a decoder library named liblzmadec. Similar API to zlib on the surface, but differed significantly meaning it was not very easy to use in other programs using zlib at the time.

lzmadec was converted to use liblzmadec.

Alexandre Sauvé helped convert the build system to GNU Autotools. Made it easier to test less portable features by the tool.

# 2007-08-16

First version of XZ Utils was called LZMA Utils, version 4.42.0alphas. Programmed in C instead of C++.

The new LZMA Utils was based around liblzma, a compression library with an API modeled after zlib.

# 2007–2008

The .lzma file format was designed for embedded systems with minimal features, and wasn't ideal. It was missing magic bytes and integrity.

Igor and Lasse began developing the new file format.
Helped by Ville Koskinen.
Reviewed by Mark Adler, Mikko Pouru, H. Peter Anvin, and Lars Wirzenius.

The new format took quite a while, Lasse had personal reasons slowing pace of development. He acknowledged it took too long.

# 2008

Igor Pavlov later made a C version of the C++ LZMA encoder.

As development took so long, the old file format had gotten popular. They needed a new file extension, so they chose .xz
With that, a new file format was born.

[Lasse Collin, with help from others](https://github.com/kobolabs/liblzma/blob/87b7682ce4b1c849504e2b3641cebaad62aaef87/doc/history.txt), designs the .xz file format using the LZMA2 compression algorithm, which compresses files to about 70% of what gzip did \[1\]. Over time this format becomes widely used for compressing tar files, Linux kernel images, and many other uses.

.xz added support for multiple compression algorithms and chaining different algorithms together. It also uses LZMA2 instead of original LZMA as the base layer.

# 2009-01-14

Once the file format had been solidified on .xz, LZMA Utils was officially renamed XZ Utils.

Over time, the format becomes widely used for compressing tar files, Linux kernel images, and many other uses.
