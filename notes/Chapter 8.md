# Chapter 8

Distributions recall the version, aftermath, news coverage.

## 2024-03-29

United States federal Cybersecurity and Infrastructure Security Agency (CISA)
CISA issues urgent global security advisory.

Red Hat assigns CVE-2024-3094, 10.0 Critical.

Lasse realises what has happened.

RedHat [announces that the backdoored xz shipped](https://www.redhat.com/en/blog/urgent-security-alert-fedora-41-and-rawhide-users) in Fedora Rawhide and Fedora Linux 40 beta.

GitHub disables the XZ Utils repository, and both Lasse and Jia's accounts.

Andres [announces the vulnerability](https://mastodon.social/@AndresFreundTec/112180083704606941) on Mastodon.

macOS homebrew, Arch, and Kali all downgraded from 5.6.1.

## 2024-03-30

Debian [shuts down builds](https://fulda.social/@Ganneff/112184975950858403) to rebuild their build machines using Debian stable (in case the malware xz escaped their sandbox?).

## 2024-03-30

Haiku OS [moves to GitHub source repo snapshots](https://github.com/haikuports/haikuports/commit/3644a3db2a0ad46971aa433c105e2cce9d141b46).

xz@tukaani.org changed to no-longer forward to Jia Tan.

## 2024-04-02

Lasse's account reinstated.
The Economist release [piece](https://www.economist.com/science-and-technology/2024/04/02/a-stealth-attack-came-close-to-compromising-the-worlds-computers) explaining the discovery of the backdoor.

## 2024-04-03

Wired release [deep dive](https://www.wired.com/story/jia-tan-xz-backdoor/) into the identity of Jia Tan

The New York Times [write](https://www.nytimes.com/2024/04/03/technology/prevent-cyberattack-linux.html) focusing on the backstory of Andres.

Ubuntu 24.04 LTS beta [postponed](https://en.ubunlog.com/Ubuntu-24-04-beta-delayed-due-to-xz-security-flaw/)to 11th April as a precaution.

## 2024-04-06

Guardian release [piece](https://www.theguardian.com/commentisfree/2024/apr/06/xz-utils-linux-malware-open-source-software-cyber-attack-andres-freund), largely mirroring The Economist.

## 2024-04-[07-09]

TheSameSam added to Tukaani project as co-maintainer. Lasse remains lead maintainer.

## 2024-04-09

GitHub makes XZ Utils source available again. git.tukaani.org had been available the whole time.

## 2024-04-15

The Open Source Security and the OpenJS foundations announce similar social engineering attacks [found](https://openjsf.org/blog/openssf-openjs-alert-social-engineering-takeovers) in the wild. They were ultimately foiled but still real.

## 2024-05-29

Lasse, after having regained control over repo, publishes 5.6.2, patching the backdoor.

## Conclusion

Researchers realise if Andres had only been a few days slower, millions of computers would have became infected.

Jia Tan's email address never showed up in any data breaches, and appears to be a created persona.

Campaign matches some signals of Cozy Bear, a Russian APT. However, this is just a heuristic.

Time zones match Chinese work hours.

However, widely accepted that it is the work of a state actor, not an individual person.

Discussions on trust.

Banks, governments, and billion dollar companies relied on Lasse, an unpaid volunteer.

Insufficient support given to the various volunteers keeping software afloat.
