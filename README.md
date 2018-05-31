# README

Welcome to Articulate!

Find Your Voice…

A web app for practicing public speeches and presentations. A user can hit 'start', perform their speech, and get immediate results on both their performance and content. 

![Alt text](/public/articulate1.png?raw=true "Home Page")

A user can demo the capabilities of the app before signing up. If a user then decides to register, they can still save the details of that demo to their user profile. This required overwriting devise without losing any security.

![Alt text](/public/articulate2.png?raw=true "Profile")

We used the Web Speech API to parse speech to text in-browser, then sent that text to IBM Watson's Alchemy (RIP) and Tone Analyzer APIs to be analyzed. 

Once the data comes back from Watson, our server parses and interprets it into useful, human-readable feedback. The more you use Articulate, the more personal your feedback will become. 

![Alt text](/public/articulate3.png?raw=true "Show1")

Built by a team of four over the course of a week using Rails, React, and PostgreSQL. Unfortunately, do to the recent demise of the Alchemy API, service will be suspended until we adapt our server to the new Natural Language Understanding API.

![Alt text](/public/articulate4.png?raw=true "Show2")

***

Public speaking is hard. We here at articulate strive to make sure that what you want to say, is what your audience will hear. Nervous about a speech, presentation, or perhaps an email to your boss? Run it by us. Using IBM Watson’s Language API’s we’ll analyze your ideas and give you easy to understand feedback.

Registration is optional, but we’d like to get to know you better. If you do choose to sign up, the more you use Articulate, the more personal your feedback will become. We know everyone is different. That’s why each registered user result is compared to their overall average. We don’t want you to just understand our feedback, we want you to understand HOW we got there.

Speak Clearly, Speak Confidently, Articulate!

Contributors:

Alexandra Cooper, Alexander Giacobbe, Patrick Kolodgy, Mark Tanca

[Presentation](https://www.youtube.com/watch?v=jjf0m_xhJmI&feature=youtu.be&t=34m41s)
