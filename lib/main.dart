import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:kalpas_test/Features/HomeScreen/home_screen.dart';

double h = 0.0;
double w = 0.0;
void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

// Map a={
//   "status": "ok",
//   "totalResults": 10,
//   "articles": [
//     {
//       "source": {
//         "id": "techcrunch",
//         "name": "TechCrunch"
//       },
//       "author": "Mike Butcher",
//       "title": "Devastated by his image being posted to a porn site, this founder hit on an AI startup idea | TechCrunch",
//       "description": "Realising that a former partner had, unbeknownst to him, put previously private, intimate videos of them onto a porn site, tech founder Dan Purcell felt",
//       "url": "https://techcrunch.com/2024/04/30/devastated-by-his-image-being-posted-to-a-porn-site-this-founder-hit-on-an-ai-startup-idea/",
//       "urlToImage": "https://techcrunch.com/wp-content/uploads/2024/04/L-R-Jonny-Smyth-Dan-Purcell.jpg?resize=1200,782",
//       "publishedAt": "2024-04-30T09:48:40Z",
//       "content": "Realising that a former partner had, unbeknownst to him, put previously private, intimate videos of them onto a porn site, tech founder Dan Purcell felt devastated. He resolved to come up with a solu… [+5526 chars]"
//     },
//     {
//       "source": {
//         "id": "techcrunch",
//         "name": "TechCrunch"
//       },
//       "author": "Tage Kene-Okafor",
//       "title": "Nigeria's YC-backed Chowdeck hopes to scale food delivery, a notoriously tough market, with $2.5M funding | TechCrunch",
//       "description": "Lagos-based Chowdeck, armed with $2.5 million, aims to make its mark in a food delivery space that has burned the likes of Jumia and Bolt.",
//       "url": "https://techcrunch.com/2024/04/30/chowdeck-hopes-to-scale-notoriously-tough-food-delivery-market/",
//       "urlToImage": "https://techcrunch.com/wp-content/uploads/2024/04/133AC792-2954-45EE-BD76-D0B22FA6FB34.jpeg?w=1080",
//       "publishedAt": "2024-04-30T08:11:03Z",
//       "content": "Food is significant to Nigerians, with households spending nearly 60% of their income on it, the highest globally, according to official reports. This strong affinity for food, coupled with the rise … [+6426 chars]"
//     },
//     {
//       "source": {
//         "id": "techcrunch",
//         "name": "TechCrunch"
//       },
//       "author": "Natasha Lomas",
//       "title": "neuroClues wants to put high speed eye tracking tech in the doctor's office | TechCrunch",
//       "description": "The eyes aren't just a window into the soul; tracking saccades can help doctors pick up a range of brain health issues. That's why French-Belgian medtech Making it easier for healthcare service providers to diagnose issues with brain health is why French-Belg…",
//       "url": "https://techcrunch.com/2024/04/30/neuroclues/",
//       "urlToImage": "https://techcrunch.com/wp-content/uploads/2024/04/Image_1.jpg?resize=1200,673",
//       "publishedAt": "2024-04-30T05:23:22Z",
//       "content": "The eyes aren’t just a window into the soul; tracking saccades can help doctors pick up a range of brain health issues. That’s why French-Belgian medtech startup neuroClues is building accessible, hi… [+6803 chars]"
//     },
//     {
//       "source": {
//         "id": "techcrunch",
//         "name": "TechCrunch"
//       },
//       "author": "Kyle Wiggers",
//       "title": "Google Gemini: Everything you need to know about the new generative AI platform | TechCrunch",
//       "description": "Wondering what all the fuss is about Gemini, Google's next-gen generative AI model family? Here's a handy roundup to get you up to speed.",
//       "url": "https://techcrunch.com/2024/04/29/what-is-google-gemini-ai/",
//       "urlToImage": "https://techcrunch.com/wp-content/uploads/2023/12/google-bard-gemini-v2.jpg?resize=1200,675",
//       "publishedAt": "2024-04-29T23:29:14Z",
//       "content": "Google’s trying to make waves with Gemini, its flagship suite of generative AI models, apps and services.\r\nSo what is Gemini? How can you use it? And how does it stack up to the competition?\r\nTo make… [+10321 chars]"
//     },
//     {
//       "source": {
//         "id": "techcrunch",
//         "name": "TechCrunch"
//       },
//       "author": "Amanda Silberling",
//       "title": "Social media companies have too much political power, 78% of Americans say in Pew survey | TechCrunch",
//       "description": "Finally, something that both sides of the aisle can agree on: social media companies are too powerful. According to a survey by the Pew Research Center,",
//       "url": "https://techcrunch.com/2024/04/29/social-media-companies-political-power-pew-survey/",
//       "urlToImage": "https://techcrunch.com/wp-content/uploads/2021/12/congress-instagram.jpg?resize=1200,675",
//       "publishedAt": "2024-04-29T22:27:44Z",
//       "content": "Finally, something that both sides of the aisle can agree on: social media companies are too powerful.\r\nAccording to a survey by the Pew Research Center, 78% of American adults say social media compa… [+2718 chars]"
//     },
//     {
//       "source": {
//         "id": "techcrunch",
//         "name": "TechCrunch"
//       },
//       "author": "Dominic-Madori Davis",
//       "title": "Inside the ‘cold war’ at Techstars as CEO Mäelle Gavet hires, fires, fights to force change | TechCrunch",
//       "description": "Financial losses, founder revolts, public firings and overflowing office sewage mark the storied institution’s annus horribilis.",
//       "url": "https://techcrunch.com/2024/04/29/inside-the-cold-war-at-techstars-as-ceo-maelle-gavet-hires-fires-fights-to-force-change/",
//       "urlToImage": "https://techcrunch.com/wp-content/uploads/2024/04/techstars-all-stars-gavet.jpg?resize=1200,675",
//       "publishedAt": "2024-04-29T19:50:18Z",
//       "content": "Last spring, founders from all over the world began their treks to Techstars Stockholm accelerator program. Their backdrop was solemn: a bank run was in the process of crushing Silicon Valley Bank, a… [+24125 chars]"
//     },
//     {
//       "source": {
//         "id": "techcrunch",
//         "name": "TechCrunch"
//       },
//       "author": "Romain Dillet",
//       "title": "As VC firms invest more in B2B startups, Intuition is a new VC fund focusing on consumer tech | TechCrunch",
//       "description": "Intuition, a new VC firm based in Paris, is doing something radical and betting on consumer tech as its exclusive investment vertical.",
//       "url": "https://techcrunch.com/2024/04/29/as-vc-firms-invest-more-in-b2b-startups-intuition-is-a-new-vc-fund-focusing-on-consumer-tech/",
//       "urlToImage": "https://techcrunch.com/wp-content/uploads/2024/04/Intuition.jpg?resize=1200,778",
//       "publishedAt": "2024-04-29T18:25:22Z",
//       "content": "In 2024, its hard to wake up without reading about yet another large funding round in an enterprise AI company. Intuition, a new VC firm based in Paris, is doing something radical and betting on cons… [+4730 chars]"
//     },
//     {
//       "source": {
//         "id": "techcrunch",
//         "name": "TechCrunch"
//       },
//       "author": "Anna Heim",
//       "title": "Solo GP fund Andrena Ventures hopes to carry startup talent onto its next challenges | TechCrunch",
//       "description": "Gideon Valkin's solo VC firm Andrena Ventures raised $12 million from backers including several VCs and entrepreneurs, and made its first investment into AI startup Nustom.",
//       "url": "https://techcrunch.com/2024/04/29/andrena-ventures-solo-gp/",
//       "urlToImage": "https://techcrunch.com/wp-content/uploads/2024/04/Gideon-Valkin-Andrena-Ventures-image-credits-Nikki-van-Diermen.jpg?w=1200",
//       "publishedAt": "2024-04-29T16:30:48Z",
//       "content": "In the world of startups, its not uncommon to see talent from successful companies go on to found their own ventures. This is particularly evident in fintech in Europe, where alumni from unicorns lik… [+3388 chars]"
//     },
//     {
//       "source": {
//         "id": "techcrunch",
//         "name": "TechCrunch"
//       },
//       "author": "Romain Dillet",
//       "title": "Carbonfact is a carbon management platform designed specifically for the fashion industry | TechCrunch",
//       "description": "French startup Carbonfact believes that the best carbon accounting solutions will focus on one vertical. That’s why the company has decided to provide a",
//       "url": "https://techcrunch.com/2024/04/29/carbonfact-is-a-carbon-management-platform-designed-specifically-for-the-fashion-industry/",
//       "urlToImage": "https://techcrunch.com/wp-content/uploads/2024/04/Carbonfact-Founders.jpg?resize=1200,800",
//       "publishedAt": "2024-04-29T13:32:49Z",
//       "content": "French startup Carbonfact believes that the best carbon accounting solutions will focus on one vertical. Thats why the company has decided to provide a carbon management and reporting tool for the fa… [+3956 chars]"
//     },
//     {
//       "source": {
//         "id": "techcrunch",
//         "name": "TechCrunch"
//       },
//       "author": "Aria Alamalhodaei",
//       "title": "TechCrunch Space: Rapidly responsive... space stations!? | TechCrunch",
//       "description": "Welcome back to TechCrunch Space. Let's jump in!",
//       "url": "https://techcrunch.com/2024/04/29/techcrunch-space-rapidly-responsive-space-stations/",
//       "urlToImage": "https://techcrunch.com/wp-content/uploads/2019/12/tc-space-hero.gif?w=941",
//       "publishedAt": "2024-04-27T00:02:52Z",
//       "content": "Hello and welcome back to TechCrunch Space. Let’s jump in!\r\nWant to reach out with a tip? Email Aria at aria.techcrunch@gmail.com or send me a message on Signal at 512-937-3988. You also can send a n… [+1689 chars]"
//     }
//   ]
// };
