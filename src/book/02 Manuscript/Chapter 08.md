# Chapter 8

The Common Vulnerabilities and Exposures (CVE) system has been cataloguing vulnerabilities since 1999. Each vulnerability is assigned an ID, and most are assigned a severity score. The XZ Utils backdoor had the ID CVE-2024-3094 and the maximum severity score of 10.0/10.0. In the field of computer security, remote code execution is the worst-case scenario.

The US federal Cybersecurity and Infrastructure Security Agency read the email and issued an advisory. They recommended developers downgrade XZ Utils to the uncompromised version 5.4.6. Linux distros quickly caught wind and removed the malicious versions. Red Hat wrote an announcement explaining the gravity of the situation. Many of their users switched to an older version as a precaution.

GitHub disabled the XZ Utils repository and both Lasse's and Jia's accounts. This prevented anyone from downloading the malware. However, it also prevented researchers from analysing it. Thankfully, Lasse's copy of the source code was still available on `tukaani.org`, so they could investigate unimpeded.

---

Andres created a series of posts on the social media site Mastodon. It was intended as a simple warning to his followers to update, and a cautionary tale on how it could easily have been missed.

> We got unreasonably lucky here, and we can't just bank on that going forward.

Instead, mainstream news outlets discovered the story. The Economist published an article explaining how the backdoor had been discovered. Wired described how Jia earned trust and became a maintainer of XZ Utils. The New York Times dug into Andres and the aftermath of the exploit. He was invited to numerous interviews and podcasts, and had become an overnight household name in cybersecurity.

In the interviews, he explained how disorienting the whole event was.

> I’m a fairly private person who just sits in front of the computer and hacks on code.

After all, he was a database developer, not a security expert.

---

Lasse was away on holiday when the news broke. He had found Jia's latest behaviour peculiar, but he hadn't expected Jia to have implemented a backdoor without him realising. When he tried to log into his GitHub account, he discovered he had been locked out due to security concerns. He turned his attention to the Linux mailing list and began to write an email.

> I'm on holiday and only happened to look at my emails, and it seems to be a major mess.
>
> My proper investigation efforts likely start in the first days of April. That is, I currently know only a few facts which alone are bad enough.

He made sure to stop forwarding email from xz@tukaani.org to Jia and formally removed his maintainer rights. The rest of his holiday went nicely, albeit tainted by the backdoor.

Once he returned home, he persuaded GitHub to reinstate his personal account. Recovering the XZ Utils repository was harder, though after a week it was back online. Then started the slow reviewing of Jia's code. Lasse sat down and read through every single patch ever made by Jia. He noted down anything suspicious in each patch. What shocked him was how, even with hindsight, there was remarkably little suspicion. Jia's contributions to the project had genuinely helped. All his malicious code was only inserted in the run-up to version 5.6.0.

It took Lasse two months, but he finally finished purging the backdoor from XZ Utils. The project was finally safe with 5.6.2.

Now that Jia was gone, he decided to onboard a new maintainer to assist with development. Sam James - a developer of the Gentoo Linux distro - volunteered himself and was accepted. But what happened with Jia?

---

As soon as the news of the backdoor broke, Jia fell silent. He stopped responding to emails or creating patches. For all intents and purposes, he had vanished.

When investigators dug into his past, they came up entirely blank. There was no trace of him before 2021, and the traces after then don't point to a real individual. The consensus agreed that Jia Tan was an entirely fabricated identity. It wasn't just Jia Tan: Jigar Kumar, Dennis Ens, and Hans Jansen all have no traces either.

Government agencies attempted to track down the perpetrators, but none were found. The most widespread theory is that nation-state hacking groups used these names. Historically, nation-state actors have hacked software slowly over several years. It seems plausible, but we do not know for certain. We may never know who was behind the attack.

At least we can be thankful Andres Freund took time out of his day to investigate 500 milliseconds.