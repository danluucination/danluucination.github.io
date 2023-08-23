<!doctypehtml><html lang=en><meta charset=utf-8><title>Normalization of deviance</title><meta name=viewport content="width=device-width,initial-scale=1"><link rel="stylesheet" href="/styles.css"></style><link rel=icon href="data:;base64,="> <header><strong>Normalization of deviance</strong> | <i><b><a href=https://patreon.com/danluu>I'm trying some experimental tiers on Patreon</a></b> to see if I can get to <a href=https://twitter.com/danluu/status/1456346963691991041>substack-like levels of financial support for this blog without moving to substack</a>!</i><hr></header><main> <p>Have you ever mentioned something that seems totally normal to you only to be greeted by surprise? Happens to me all the time when I describe something everyone at work thinks is normal. For some reason, my conversation partner's face morphs from pleasant smile to rictus of horror. Here are a few representative examples.</p> <p>There's the company that is perhaps the nicest place I've ever worked, combining the best parts of Valve and Netflix. The people are amazing and you're given near total freedom to do whatever you want. But as a side effect of the culture, they lose perhaps half of new hires in the first year, some voluntarily and some involuntarily. Totally normal, right? Here are a few more anecdotes that were considered totally normal by people in places I've worked. And often not just normal, but laudable.</p> <p>There's the company that's incredibly secretive about infrastructure. For example, there's the team that was afraid that, if they reported bugs to their hardware vendor, the bugs would get fixed and their competitors would be able to use the fixes. Solution: request the firmware and fix bugs themselves! More recently, I know a group of folks outside the company who tried to reproduce the algorithm in the paper the company published earlier this year. The group found that they couldn't reproduce the result, and that the algorithm in the paper resulted in an unusual level of instability; when asked about this, one of the authors responded “well, we have some tweaks that didn't make it into the paper” and declined to share the tweaks, i.e., the company purposely published an unreproducible result to avoid giving away the details, as is normal. This company enforces secrecy by having a strict policy of firing leakers. This is introduced at orientation with examples of people who got fired for leaking (e.g., the guy who leaked that a concert was going to happen inside a particular office), and by announcing firings for leaks at the company all hands. The result of those policies is that I know multiple people who are afraid to forward emails about things like updated info on health insurance to a spouse for fear of forwarding the wrong email and getting fired; instead, they use another computer to retype the email and pass it along, or take photos of the email on their phone.</p> <p>There's the office where I asked one day about the fact that I almost never saw two particular people in the same room together. I was told that they had a feud going back a decade, and that things had actually improved — for years, they literally couldn't be in the same room because one of the two would get too angry and do something regrettable, but things had now cooled to the point where the two could, occasionally, be found in the same wing of the office or even the same room. These weren't just random people, either. They were the two managers of the only two teams in the office.</p> <p>There's the company whose culture is so odd that, when I sat down to write a post about it, I found that I'd <a href=//danluu.com/startup-tradeoffs/#fn:N>not only written more than for any other single post, but more than all other posts combined</a> (which is well over 100k words now, the length of a moderate book). This is the same company where someone recently explained to me how great it is that, instead of using data to make decisions, we use political connections, and that the idea of making decisions based on data is a myth anyway; no one does that. This is also the company where all four of the things they told me to get me to join were false, and the job ended up being the one thing I specifically said I didn't want to do. When I joined this company, my team didn't use version control for months and it was a real fight to get everyone to use version control. Although I won that fight, I lost the fight to get people to run a build, let alone run tests, before checking in, so the build is broken multiple times per day. When I mentioned that I thought this was a problem for our productivity, I was told that it's fine because it affects everyone equally. Since the only thing that mattered was my stack ranked productivity, so I shouldn't care that it impacts the entire team, the fact that it's normal for everyone means that there's no cause for concern.</p> <p>There's the company that created multiple massive initiatives to recruit more women into engineering roles, <a href=//danluu.com/tech-discrimination/ >where women still get rejected in recruiter screens for not being technical enough</a> after being asked questions like &quot;was your experience with algorithms or just coding?&quot;. I thought that my referral with a very strong recommendation would have prevented that, but it did not.</p> <p>There's the company where I worked on a four person effort with a multi-hundred million dollar budget and a billion dollar a year impact, where requests for things that cost hundreds of dollars routinely took months or were denied.</p> <p>You might wonder if I've just worked at places that are unusually screwed up. Sure, the companies are generally considered to be ok places to work and two of them are considered to be among the best places to work, but maybe I've just ended up at places that are overrated. But I have the same experience when I hear stories about how other companies work, even places with stellar engineering reputations, except that it's me that's shocked and my conversation partner who thinks their story is normal.</p> <p>There's the companies that use <a href=https://github.com/box/flaky>@flaky</a>, which includes the vast majority of Python-using SF Bay area unicorns. If you don't know what this is, this is a library that lets you add a Python annotation to those annoying flaky tests that sometimes pass and sometimes fail. When I asked multiple co-workers and former co-workers from three different companies what they thought this did, they all guessed that it re-runs the test multiple times and reports a failure if any of the runs fail. Close, but not quite. It's technically possible to use @flaky for that, but in practice it's used to re-run the test multiple times and reports a pass if any of the runs pass. The company that created @flaky is effectively a storage infrastructure company, and the library is widely used at its biggest competitor.</p> <p>There's the company with a reputation for having great engineering practices that had 2 9s of reliability last time I checked, for reasons that are entirely predictable from their engineering practices. This is the second thing in a row that can't be deanonymized because multiple companies fit the description. Here, I'm not talking about companies trying to be the next reddit or twitter where it's, apparently, totally fine to have 1 9. I'm talking about companies that sell platforms that other companies rely on, where an outage will cause dependent companies to pause operations for the duration of the outage. Multiple companies that build infrastructure find practices that lead to 2 9s of reliability.</p> <p>As far as I can tell, what happens at a lot these companies is that they started by concentrating almost totally on product growth. That's completely and totally reasonable, because companies are worth approximately zero when they're founded; they don't bother with things that protect them from losses, like good ops practices or actually having security, because there's nothing to lose (well, except for user data when the inevitable security breach happens, and if you talk to security folks at unicorns you'll know that these happen).</p> <p>The result is a culture where people are hyper-focused on growth and ignore risk. That culture tends to stick even after company has grown to be worth well over a billion dollars, and the companies have something to lose. Anyone who comes into one of these companies from Google, Amazon, or another place with solid ops practices is shocked. Often, they try to fix things, and then leave when they can't make a dent.</p> <p>Google probably has the best ops and security practices of any tech company today. It's easy to say that you should take these things as seriously as Google does, but it's instructive to see how they got there. If you look at the codebase, you'll see that various services have names ending in z, as do a curiously large number of variables. I'm told that's because, once upon a time, someone wanted to add monitoring. It wouldn't really be secure to have <code>google.com/somename</code> expose monitoring data, so they added a z. <code>google.com/somenamez</code>. For security. At the company that is now the best in the world at security. They're now so good at security that multiple people I've talked to (all of whom joined after this happened) vehemently deny that this ever happened, even though the reasons they give don't really make sense (e.g., to avoid name collisions) and I have this from sources who were there at the time this happened.</p> <p>Google didn't go from adding z to the end of names to having the world's best security because someone gave a rousing speech or wrote a convincing essay. They did it after getting embarrassed a few times, which gave people who wanted to do things “right” the leverage to fix fundamental process issues. It's the same story at almost every company I know of that has good practices. Microsoft was a joke in the security world for years, until multiple disastrously bad exploits forced them to get serious about security. This makes it sound simple, but if you talk to people who were there at the time, the change was brutal. Despite a mandate from the top, there was vicious political pushback from people whose position was that the company got to where it was in 2003 without wasting time on practices like security. Why change what's worked?</p> <p>You can see this kind of thing in every industry. A classic example that tech folks often bring up is hand-washing by doctors and nurses. It's well known that germs exist, and that washing hands properly very strongly reduces the odds of transmitting germs and thereby significantly reduces hospital mortality rates. Despite that, trained doctors and nurses still often don't do it. Interventions are required. Signs reminding people to wash their hands save lives. But when people stand at hand-washing stations to require others walking by to wash their hands, even more lives are saved. People can ignore signs, but they can't ignore being forced to wash their hands.</p> <p>This mirrors a number of attempts at tech companies to introduce better practices. If you tell people they should do it, that helps a bit. If you enforce better practices via code review, that helps a lot.</p> <p>The data are clear that humans are really bad at taking the time to do things that are well understood to incontrovertibly reduce the risk of rare but catastrophic events. We will rationalize that taking shortcuts is the right, reasonable thing to do. There's a term for this: the normalization of deviance. It's well studied in a number of other contexts including healthcare, aviation, mechanical engineering, aerospace engineering, and civil engineering, but we don't see it discussed in the context of software. In fact, I've never seen the term used in the context of software.</p> <p>Is it possible to learn from other's mistakes instead of making every mistake ourselves? The state of the industry make this sound unlikely, but let's give it a shot. <a href=http://www.ncbi.nlm.nih.gov/pmc/articles/PMC2821100/ >John Banja has a nice summary paper on the normalization of deviance in healthcare</a>, with lessons we can attempt to apply to software development. One thing to note is that, because Banja is concerned with patient outcomes, there's a close analogy to devops failure modes, but normalization of deviance also occurs in cultural contexts that are less directly analogous.</p> <p>The first section of the paper details a number of disasters, both in healthcare and elsewhere. Here's one typical example:</p> <blockquote> <p>A catastrophic negligence case that the author participated in as an expert witness involved an anesthesiologist's turning off a ventilator at the request of a surgeon who wanted to take an x-ray of the patient's abdomen (Banja, 2005, pp. 87-101). The ventilator was to be off for only a few seconds, but the anesthesiologist forgot to turn it back on, or thought he turned it back on but had not. The patient was without oxygen for a long enough time to cause her to experience global anoxia, which plunged her into a vegetative state. She never recovered, was disconnected from artificial ventilation 9 days later, and then died 2 days after that. It was later discovered that the anesthesia alarms and monitoring equipment in the operating room had been deliberately programmed to a “suspend indefinite” mode such that the anesthesiologist was not alerted to the ventilator problem. Tragically, the very instrumentality that was in place to prevent such a horror was disabled, possibly because the operating room staff found the constant beeping irritating and annoying.</p> </blockquote> <p>Turning off or ignoring notifications because there are too many of them and they're too annoying? An erroneous manual operation? This could be straight out of the post-mortem of more than a few companies I can think of, except that the result was a tragic death instead of the loss of millions of dollars. If you <a href=//danluu.com/postmortem-lessons/ >read a lot of tech post-mortems</a>, every example in Banja's paper will feel familiar even though the details are different.</p> <p>The section concludes,</p> <blockquote> <p>What these disasters typically reveal is that the factors accounting for them usually had “<a href="http://www.jstor.org/stable/223506?seq=1#page_scan_tab_contents">long incubation periods, typified by rule violations, discrepant events that accumulated unnoticed, and cultural beliefs about hazards that together prevented interventions that might have staved off harmful outcomes</a>”. Furthermore, it is especially striking how multiple rule violations and lapses can coalesce so as to enable a disaster's occurrence.</p> </blockquote> <p>Once again, this could be from an article about technical failures. That makes the next section, on why these failures happen, seem worth checking out. The reasons given are:</p> <h4 id=the-rules-are-stupid-and-inefficient>The rules are stupid and inefficient</h4> <p>The example in the paper is about delivering medication to newborns. To prevent “drug diversion,” nurses were required to enter their password onto the computer to access the medication drawer, get the medication, and administer the correct amount. In order to ensure that the first nurse wasn't stealing drugs, if any drug remained, another nurse was supposed to observe the process, and then enter their password onto the computer to indicate they witnessed the drug being properly disposed of.</p> <p>That sounds familiar. How many technical postmortems start off with “someone skipped some steps because they're inefficient”, e.g., “the programmer force pushed a bad config or bad code because they were sure nothing could go wrong and skipped staging/testing”? The infamous <a href=https://azure.microsoft.com/en-us/blog/final-root-cause-analysis-and-improvement-areas-nov-18-azure-storage-service-interruption/ >November 2014 Azure outage</a> happened for just that reason. At around the same time, a dev at one of Azure's competitors overrode the rule that you shouldn't push a config that fails tests because they knew that the config couldn't possibly be bad. When that caused the canary deploy to start failing, they overrode the rule that you can't deploy from canary into staging with a failure because they knew their config couldn't possibly be bad and so the failure must be from something else. That postmortem revealed that the config was technically correct, but exposed a bug in the underlying software; it was pure luck that the latent bug the config revealed wasn't as severe as the Azure bug.</p> <p>Humans are bad at reasoning about how failures cascade, so we implement bright line rules about when it's safe to deploy. But the same thing that makes it hard for us to reason about when it's safe to deploy makes the rules seem stupid and inefficient.</p> <h4 id=knowledge-is-imperfect-and-uneven>Knowledge is imperfect and uneven</h4> <p>People don't automatically know what should be normal, and when new people are onboarded, they can just as easily learn deviant processes that have become normalized as reasonable processes.</p> <p><a href=http://jvns.ca>Julia Evans</a> described to me how this happens:</p> <p><em>new person joins</em><br> <strong>new person</strong>: WTF WTF WTF WTF WTF<br> <strong>old hands</strong>: yeah we know we're concerned about it<br> <strong>new person</strong>: WTF WTF wTF wtf wtf w...<br> <em>new person gets used to it</em><br> <em>new person #2 joins</em><br> <strong>new person #2</strong>: WTF WTF WTF WTF<br> <strong>new person</strong>: yeah we know. we're concerned about it.<br></p> <p>The thing that's really insidious here is that people will really buy into the WTF idea, and they can spread it elsewhere for the duration of their career. Once, after doing some work <a href=//danluu.com/julialang/ >on an open source project that's regularly broken and being told that it's normal to have a broken build, and that they were doing better than average</a>, I ran the numbers, found that project was basically worst in class, and wrote something about the idea that <a href=//danluu.com/broken-builds/ >it's possible to have a build that nearly always passes with relatively low effort</a>. The most common comment I got in response was, &quot;Wow that guy must work with superstar programmers. But let's get real. We all break the build at least a few times a week&quot;, as if running tests (or for that matter, even attempting to compile) before checking code in requires superhuman abilities. But once people get convinced that some deviation is normal, they often get really invested in the idea.</p> <h4 id=i-m-breaking-the-rule-for-the-good-of-my-patient>I'm breaking the rule for the good of my patient</h4> <p>The example in the paper is of someone who breaks the rule that you should wear gloves when finding a vein. Their reasoning is that wearing gloves makes it harder to find a vein, which may result in their having to stick a baby with a needle multiple times. It's hard to argue against that. No one wants to cause a baby extra pain!</p> <p>The second worst outage I can think of occurred when someone noticed that a database service was experiencing slowness. They pushed a fix to the service, and in order to prevent the service degradation from spreading, they ignored the rule that you should do a proper, slow, staged deploy. Instead, they pushed the fix to all machines. It's hard to argue against that. No one wants their customers to have degraded service! Unfortunately, the fix exposed a bug that caused a global outage.</p> <h4 id=the-rules-don-t-apply-to-me-you-can-trust-me>The rules don't apply to me/You can trust me</h4> <blockquote> <p>most human beings perceive themselves as good and decent people, such that they can understand many of their rule violations as entirely rational and ethically acceptable responses to problematic situations. They understand themselves to be doing nothing wrong, and will be outraged and often fiercely defend themselves when confronted with evidence to the contrary.</p> </blockquote> <p>As companies grow up, they eventually have to impose security that prevents every employee from being able to access basically everything. And at most companies, when that happens, some people get really upset. “Don't you trust me? If you trust me, how come you're revoking my access to X, Y, and Z?”</p> <p>Facebook famously <a href=http://www.wsj.com/articles/SB10001424052702304898704577478483529665936>let all employees access everyone's profile</a> for a long time, and you can even find HN comments indicating that some recruiters would explicitly mention that as a perk of working for Facebook. And I can think of more than one well-regarded unicorn where everyone still has access to basically everything, even after their first or second bad security breach. It's hard to get the political capital to restrict people's access to what they believe they need, or are entitled, to know. A lot of trendy startups have core values like “trust” and “transparency” which make it difficult to argue against universal access.</p> <h4 id=workers-are-afraid-to-speak-up>Workers are afraid to speak up</h4> <p>There are people I simply don't give feedback to because I can't tell if they'd take it well or not, and once you say something, it's impossible to un-say it. In the paper, the author gives an example of a doctor with poor handwriting who gets mean when people ask him to clarify what he's written. As a result, people guess instead of asking.</p> <p>In most company cultures, people feel weird about giving feedback. Everyone has stories about a project that lingered on for months or years after it should have been terminated because no one was willing to offer explicit feedback. This is a problem even when cultures discourage meanness and encourage feedback: cultures of niceness seem to have as many issues around speaking up as cultures of meanness, if not more. In some places, people are afraid to speak up because they'll get attacked by someone mean. In others, they're afraid because they'll be branded as mean. It's a hard problem.</p> <h4 id=leadership-withholding-or-diluting-findings-on-problems>Leadership withholding or diluting findings on problems</h4> <p>In the paper, this is characterized by flaws and weaknesses being diluted as information flows up the chain of command. One example is how a supervisor might take sub-optimal actions to avoid looking bad to superiors.</p> <p>I was shocked the first time I saw this happen. I must have been half a year or a year out of school. I saw that we were doing something obviously non-optimal, and brought it up with the senior person in the group. He told me that he didn't disagree, but that if we did it my way and there was a failure, it would be really embarrassing. He acknowledged that my way reduced the chance of failure without making the technical consequences of failure worse, but it was more important that we not be embarrassed. Now that I've been working for a decade, I have a better understanding of how and why people play this game, but I still find it absurd.</p> <h4 id=solutions>Solutions</h4> <p>Let's say you notice that your company has a problem that I've heard people at most companies complain about: people get promoted for heroism and putting out fires, not for preventing fires; and people get promoted for shipping features, not for doing critical maintenance work and bug fixing. How do you change that?</p> <p>The simplest option is to just do the right thing yourself and ignore what's going on around you. That has some positive impact, but the scope of your impact is necessarily limited. Next, you can convince your team to do the right thing: I've done that a few times for practices I feel are really important and are sticky, so that I won't have to continue to expend effort on convincing people once things get moving.</p> <p>But if the incentives are aligned against you, it will require an ongoing and probably unsustainable effort to keep people doing the right thing. In that case, the problem becomes convincing someone to change the incentives, and then making sure the change works as designed. How to convince people is worth discussing, but long and messy enough that it's beyond the scope of this post. As for making the change work, I've seen many “obvious” mistakes repeated, both in places I've worked and those whose internal politics I know a lot about.</p> <p>Small companies have it easy. When I worked at a 100 person company, the hierarchy was individual contributor (IC) -&gt; team lead (TL) -&gt; CEO. That was it. The CEO had a very light touch, but if he wanted something to happen, it happened. Critically, he had a good idea of what everyone was up to and could basically adjust rewards in real-time. If you did something great for the company, there's a good chance you'd get a raise. Not in nine months when the next performance review cycle came up, but basically immediately. Not all small companies do that effectively, but with the right leadership, they can. That's impossible for large companies.</p> <p>At large company A (LCA), they had the problem we're discussing and a mandate came down to reward people better for doing critical but low-visibility grunt work. There were too many employees for the mandator to directly make all decisions about compensation and promotion, but the mandator could review survey data, spot check decisions, and provide feedback until things were normalized. My subjective perception is that the company never managed to achieve parity between boring maintenance work and shiny new projects, but got close enough that people who wanted to make sure things worked correctly didn't have to significantly damage their careers to do it.</p> <p>At large company B (LCB), ICs agreed that it's problematic to reward creating new features more richly than doing critical grunt work. When I talked to managers, they often agreed, too. But nevertheless, the people who get promoted are disproportionately those who ship shiny new things. I saw management attempt a number of cultural and process changes at LCB. Mostly, those took the form of pronouncements from people with fancy titles. For really important things, they might produce a video, and enforce compliance by making people take a multiple choice quiz after watching the video. The net effect I observed among other ICs was that people talked about how disconnected management was from the day-to-day life of ICs. But, for the same reasons that normalization of deviance occurs, that information seems to have no way to reach upper management.</p> <p>It's sort of funny that this ends up being a problem about incentives. As an industry, we spend a lot of time thinking about how to incentivize consumers into doing what we want. But then we set up incentive systems that are generally agreed upon as incentivizing us to do the wrong things, and we do so via a combination of a game of telephone and cargo cult diffusion. Back when Microsoft was ascendant, we copied their interview process and asked brain-teaser interview questions. Now that Google is ascendant, we copy their interview process and ask algorithms questions. If you look around at trendy companies that are younger than Google, most of them basically copy their ranking/leveling system, with some minor tweaks. The good news is that, unlike many companies people previously copied, Google has put a lot of thought into most of their processes and made data driven decisions. The bad news is that Google is unique in a number of ways, which means that their reasoning often doesn't generalize, and that <a href=//danluu.com/why-ecc/ >people often cargo cult practices long after they've become deprecated at Google</a>.</p> <p>This kind of diffusion happens for technical decisions, too. Stripe <a href=https://www.hakkalabs.co/articles/trouble-with-event-processing-try-the-method-that-stripe-has-mastered-with-mongodb>built a reliable message queue on top of Mongo</a>, so we build <a href=https://aphyr.com/posts/284-jepsen-mongodb>reliable</a> message <a href=http://stackoverflow.com/questions/9274777/mongodb-as-a-queue-service>queues</a> on top of <a href=https://aphyr.com/posts/322-jepsen-mongodb-stale-reads>Mongo</a><sup class=footnote-ref id=fnref:J><a rel=footnote href=#fn:J>1</a></sup>. It's cargo cults all the way down<sup class=footnote-ref id=fnref:P><a rel=footnote href=#fn:P>2</a></sup>.</p> <p>The paper has specific sub-sections on how to prevent normalization of deviance, which I recommend reading in full.</p> <ul> <li>Pay attention to weak signals</li> <li>Resist the urge to be unreasonably optimistic</li> <li>Teach employees how to conduct emotionally uncomfortable conversations</li> <li>System operators need to feel safe in speaking up</li> <li>Realize that oversight and monitoring are never-ending</li> </ul> <p>Let's look at how the first one of these, “pay attention to weak signals”, interacts with a single example, the “WTF WTF WTF” a new person gives off when the join the company.</p> <p>If a VP decides something is screwed up, people usually listen. It's a strong signal. And when people don't listen, the VP knows what levers to pull to make things happen. But when someone new comes in, they don't know what levers they can pull to make things happen or who they should talk to almost by definition. They give out weak signals that are easily ignored. By the time they learn enough about the system to give out strong signals, they've acclimated.</p> <p>“Pay attention to weak signals” sure sounds like good advice, but how do we do it? Strong signals are few and far between, making them easy to pay attention to. Weak signals are abundant. How do we filter out the ones that aren't important? And how do we get an entire team or org to actually do it? These kinds of questions can't be answered in a generic way; this takes real thought. We mostly put this thought elsewhere. Startups spend a lot of time thinking about growth, and while they'll all tell you that they care a lot about engineering culture, revealed preference shows that they don't. With a few exceptions, big companies aren't much different. At LCB, I looked through the competitive analysis slide decks and they're amazing. They look at every last detail on hundreds of products to make sure that everything is as nice for users as possible, from onboarding to interop with competing products. If there's any single screen where things are more complex or confusing than any competitor's, people get upset and try to fix it. It's quite impressive. And then when LCB onboards employees in my org, a third of them are missing at least one of, an alias/account, an office, or a computer, a condition which can persist for weeks or months. The competitive analysis slide decks talk about how important onboarding is because you only get one chance to make a first impression, and then employees are onboarded with the impression that the company couldn't care less about them and that it's normal for quotidian processes to be pervasively broken. LCB can't even to get the basics of employee onboarding right, let alone really complex things like acculturation. This is understandable — external metrics like user growth or attrition are measurable, and targets like how to tell if you're acculturating people so that they don't ignore weak signals are softer and harder to determine, but that doesn't mean they're any less important. People write a lot about how things like using fancier languages or techniques like TDD or agile will make your teams more productive, but having a strong engineering culture is much larger force multiplier.</p> <p><small> Thanks to Sophie Smithburg and Marc Brooker for introducing me to the term Normalization of Deviance, and Kelly Eskridge, Leah Hanson, Sophie Rapoport, Sophie Smithburg, Julia Evans, Dmitri Kalintsev, Ralph Corderoy, Jamie Brandon, Egor Neliuba, and Victor Felder for comments/corrections/discussion. </small></p> <p><link rel=prefetch href=//danluu.com/startup-tradeoffs/ > <link rel=prefetch href=//danluu.com/why-ecc/ > <link rel=prefetch href=//danluu.com/ ></p> <div class=footnotes> <hr> <ol> <li id=fn:J><p>People seem to think I'm joking here. I can understand why, but try Googling <code>mongodb message queue</code>. You'll find statements like “replica sets in MongoDB work extremely well to allow automatic failover and redundancy”. Basically every company I know of that's done this and has anything resembling scale finds this to be non-optimal, to say the least, but you can't actually find blog posts or talks that discuss that. All you see are the posts and talks from when they first tried it and are in the honeymoon period. This is common with many technologies. You'll mostly find glowing recommendations in public even when, in private, people will tell you about all the problems. Today, if you do the search mentioned above, you'll get a ton of posts talking about how amazing it is to build a message queue on top of Mongo, this footnote, and a maybe couple of blog posts by Kyle Kingsbury depending on your exact search terms.</p> <p>If there were an acute failure, you might see a postmortem, but while we'll do postmortems for &quot;the site was down for 30 seconds&quot;, we rarely do postmortems for &quot;this takes 10x as much ops effort as the alternative and it's a death by a thousand papercuts&quot;, &quot;we architected this thing poorly and now it's very difficult to make changes that ought to be trivial&quot;, or &quot;a competitor of ours was able to accomplish the same thing with an order of magnitude less effort&quot;. I'll sometimes do informal postmortems by asking everyone involved oblique questions about what happened, but more for my own benefit than anything else, because I'm not sure people really want to hear the whole truth. This is especially sensitive if the effort has generated a round of promotions, which seems to be more common the more screwed up the project. The larger the project, the more visibility and promotions, even if the project could have been done with much less effort.</p> <a class=footnote-return href=#fnref:J><sup>[return]</sup></a></li> <li id=fn:P>I've spent a lot of time asking about why things are the way they are, both in areas where things are working well, and in areas where things are going badly. Where things are going badly, everyone has ideas. But where things are going well, as in the small company with the light-touch CEO mentioned above, almost no one has any idea why things work. It's magic. If you ask, people will literally tell you that it seems really similar to some other place they've worked, except that things are magically good instead of being terrible for reasons they don't understand. But it's not magic. It's hard work that very few people understand. Something I've seen multiple times is that, when a VP leaves, a company will become a substantially worse place to work, and it will slowly dawn on people that the VP was doing an amazing job at supporting not only their direct reports, but making sure that everyone under them was having a good time. It's hard to see until it changes, but if you don't see anything obviously wrong, either you're not paying attention or someone or many someones have put a lot of work into making sure things run smoothly. <a class=footnote-return href=#fnref:P><sup>[return]</sup></a></li> </ol> </div> </main><nav><div class=np> <a href=cpu-bugs/ >← We should expect more CPU bugs</a> <a href=startup-tradeoffs/ >Big companies v. startups →</a> </div> <div class=np> <a href= >Archive</a> <a href=https://www.patreon.com/danluu>Patreon</a> <a href=https://mastodon.social/@danluu>Mastodon</a> <a href=https://threads.net/@danluu.danluu>Threads</a> </div></nav>