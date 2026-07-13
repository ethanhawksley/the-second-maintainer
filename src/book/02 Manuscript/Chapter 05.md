# Chapter 5

Google operates a free service for popular software named `OSS-Fuzz`. It automatically tests new versions, and alerts maintainers to any issues. After the release of 5.4.2, Jia made the proposal to change its vulnerability-reporting email so it would be shared between the two of them. He was obviously trustworthy by this point, so Lasse gave permission for it to be changed.

A week later, Lasse gets reached out to by Gabriela Gutierrez - a Google employee. They had noticed XZ Utils was missing a proper reporting procedure still. Their suggestion was to create a `SECURITY.md` file explaining clearly how to get in touch. After hearing the explanation, he agreed and added their provided one. Jia had a handful of issues with the instructions though. He made a revised version that specified reported vulnerabilities need steps to recreate the issue.

---

Version 5.4.3 was ready on May 4th, after a quiet spell of inactivity. It only contained a couple of fixes to the translations, and some edge cases when compiling the software. Lasse's main reason for the version was a test for Jia. It was the first time he released XZ Utils from start to finish. He used a technology known as `PGP Signing`, where a person can sign a file to prove they created it.

Whilst he watched, Jia managed to go through the full formal process without a hitch. The software was signed correctly, and uploaded online for everyone to download. The transition to Jia releasing XZ Utils would unfortunately break some automatic updates. As a security measure, software signed by a new person often must be manually permitted by an administrator. This update wasn't particularly urgent, so it was good timing to commence the switch.

---

Development picked up as June began. Three months after the project improved its security posture, a new developer appeared. He went by the name Hans Jansen and has prepared a pair of patches for XZ Utils. The patches offered a performance improvement by leveraging a lesser known technique called `indirect functions`, a.k.a. ifuncs. Ifuncs allow a program to rewire itself when it runs. Entire functions can be swapped with each other, according to the specified conditions. Hans' patch focused on the `CRC` function, which creates a fingerprint of compressed files to validate they haven't corrupted.

Lasse took a look and noticed Jia had already reviewed the patch. He picked out the usual reasons a patch needed reworking: bad variable names, too many letters on a line of code, and unnecessary spaces at the end of a line. His opinion of the CRC patch was overall positive:

> Overall this seems like a nice improvement to our function picking strategy for CRC64. It will likely be useful when we implement CRC32 too :)

`CRC32 CLMUL` is just a smaller version of `CRC64`, where the fingerprint is stored with less precision. Hans' patch only changed the `CRC64` function, but it was simple enough Jia could follow his footsteps to implement it for `CRC32` too.

Lasse wasn't as swayed as Jia though. When he ran the automated tests on the patch, they returned some errors. Looking closer, he noticed all of these errors were related to the optional `AddressSanitizer` memory checker. It was responsible for ensuring there were no unsafe modifications to memory. After researching, it turned out this was a well-known incompatibility. Ifuncs rewire the program before the `AddressSanitizer` is ready, resulting in a crash. The typical fix was to disable ifuncs when using the memory checker. He shrugged. It seemed an acceptable trade-off.

With compatibility out the way, his other concern was performance.

> How big difference in speed does your patch make with your code? I would like understand the real-world improvement that ifunc can make.

Hans replied to him quickly.

>  I was noticing a 4-5% improvement. I'm also running all of this on older hardware which may be contributing to the speedup.

A 4-5% speed improvement isn't anything spectacular, but seemed a nice bonus. He fired off a quick private message to Jia to gauge his opinion on the matter. He responded with he was broadly in favour of the addition. In turn, Jia thanked Hans for his contribution, and added the code to XZ Utils.

---

After Hans' ifuncs were added to XZ Utils, Lasse and Jia received another email from Google's `OSS-Fuzz` service. It highlighted the new patch was causing constant crashes whenever the software was tested. They both read through the log trying to spot the issue, and it turned out to be simple. `OSS-Fuzz` was utilising `AddressSanitizer`, just like their own tests had. The fix was simple: exempt ifuncs from Google's automated scans. Jia created a request for this, and within ten minutes, the change was in action.

This made Lasse uncomfortable. By disabling ifuncs in scans, any problems within the ifunc code wouldn't be easily identified ahead of time. At least XZ Utils didn't use ifuncs in many places. He had read the documentation and knew how to spot the common pitfalls with them. The performance impact was also too good to pass up. It wasn't ideal, but he could sleep easy.

---

Work carried on as per usual. August was marked by Jia's release of version 5.4.4. Its major feature was experimental support for web browsers, using a technology called Web Assembly (WASM). When run in a web browser, it did not support all the typical features - only a subset of them. Regardless, it was an impressive feat.

---

Hans returned to XZ Utils at the end of September. His new patches once again focused on the `CRC` algorithms from earlier. The earlier contributions were for `CRC64` fingerprint calculation, and he had finally returned with a similar patch for `CRC32`. It came with benchmarks too, promising up to 70% faster performance. Once again, the speed came by using ifuncs. Lasse could hardly believe his eyes - you don't see improvements this good every day.

Hans kept improving his patch over the next few days until it was all ready. After a few days of following silence, Lasse responded.

> I'm sorry for the delay. Neither Jia or I have been able to look at this in the past days. :-( We are both happy to see an improved version of CRC32.

The code was genuinely solid. They bounced ideas off each other for the next few days, ensuring the final patch was as good as possible. Hans tests the performance when XZ Utils is running in a compatible mode for older computers, and saw the patch was still improving performance. Jia replies to the results first.

> Thanks for benchmarking the 32-bit version. We'll take that into account when deciding how to proceed with 32-bit builds.

He then approved and applied the patch to XZ Utils. Lasse sees this a couple hours later.

> We (or likely it's mostly Jia) will do a few tests later. Thanks again!

---

The next week consisted of consistent work from Jia. He clearly wasn't satisfied with Hans' code. He made new files, shuffled around the order, and rewrote comments explaining how it all worked.

Lasse was hard at work too - he was implementing further "sandboxing" for XZ Utils. To "sandbox" a piece of software means to cut it off from the outside world. He was implementing this to limit the damage that a vulnerability in XZ Utils would have. Any damage caused by XZ Utils will be contained to inside the sandbox, mitigating the issue.

His work on sandboxing drew Jia's attention over, where he made several tweaks with sandboxes too. Firstly, he disabled the sandbox when running the software with `AddressSanitizer` - it was crashing the tests that relied on it. Then he added the same rigorous sandboxing to `xzdec`, the part of XZ Utils dedicated to decompressing .xz files back to their original forms. This made the software far safer to use - even if there was an error, it couldn't spread.

---

A month later in January 2024, Lasse was talking with Jia about the project's homepage. XZ Utils had been using tukaani.org as a homepage the entire time. Jia thought it was important enough it should get it's own domain: xz.tukaani.org. Since he said he would handle the website design, Lasse let him conduct the transfer.

As part of the transfer, Jia was convinced that XZ Utils needed its own logo. It had just been using the Tukaani Project's Bob the Toucan logo. Lasse was reluctant but folded when he saw Jia had already prepared one. It was the letters "XZ", in a bright orange and yellow gradient.

Minor releases continued to be prepared by Jia. Versions 5.4.5 and 5.4.6 both had very minimal changes. The major changes such as the new work on sandboxing were set to release in 5.5.0.
