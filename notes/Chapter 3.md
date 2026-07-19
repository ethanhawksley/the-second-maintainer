# Chapter 3

Pressure emails begin. Jigar Kumar and Dennis Ens enter.

## 2022-04-27

Jigar Kumar sends first mail, commenting on Jia's patch. Gives some mild feedback.

Subtly jabs at the slow release of new versions, saying

> it will unfortunately be years until the community actually gets this quality of life feature.

## 2022-04-28

Jigar Kumar

> Patches spend years on this mailing list. 5.2.0 release was 7 years ago. There is no reason to think anything is coming soon.

## 2022-05-19

Dennis Ens mails xz-devel asking if XZ for Java is maintained.

> Is XZ for Java still maintained? I asked a question here a week ago
> and have not heard back. When I view the git log I can see it has not
> updated in over a year. I am looking for things like multithreaded
> encoding / decoding and a few updates that Brett Okken had submited
> (but are still waiting for merge). Should I add these things to only
> my local version, or is there a plan for these things in the future?

Lasse replied.

> Yes, by some definition at least, like if someone reports a bug it will get fixed. Development of new features definitely isn't very active. :-(

> Threading would be nice in the Java version. Threaded decompression only
> recently got committed to XZ Utils repository.

> Jia Tan has helped me off-list with XZ Utils and he might have a bigger
> role in the future at least with XZ Utils. It's clear that my resources
> are too limited (thus the many emails waiting for replies) so something
> has to change in the long term.

## 2022-05-27

Jigar Kumar

> Over 1 month and no closer to being merged. Not a surprise.

## 2022-06-07

Jigar replied to Java thread with Dennis Ens

> Progress will not happen until there is new maintainer. XZ for C has sparse
> commit log too. Dennis you are better off waiting until new maintainer happens
> or fork yourself. Submitting patches here has no purpose these days. The
> current maintainer lost interest or doesn't care to maintain anymore. It is sad
> to see for a repo like this.

## 2022-06-08

Lasse pushes back.

> I haven't lost interest but my ability to care has been fairly limited
> mostly due to longterm mental health issues but also due to some other
> things. Recently I've worked off-list a bit with Jia Tan on XZ Utils and
> perhaps he will have a bigger role in the future, we'll see.

> It's also good to keep in mind that this is an unpaid hobby project.

> Anyway, I assure you that I know far too well about the problem that
> not much progress has been made. The thought of finding new maintainers
> has existed for a long time too as the current situation is obviously
> bad and sad for the project.

> A new XZ Utils stable branch should get released this year with
> threaded decoder etc. and a few alpha/beta releases before that.
> Perhaps the moment after the 5.4.0 release would be a convenient moment
> to make changes in the list of project maintainer(s).

> Forks are obviously another possibility and I cannot control that. If
> those happen, I hope that file format changes are done so that no
> silly problems occur (like using the same ID for different things in
> two projects). 7-Zip supports .xz and keeping its developer Igor Pavlov
> informed about format changes (including new filters) is important too.
