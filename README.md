# Digital Aristotle

Attic Greek parser/translator in SWI-Prolog. This project was completed as part of CSC 343, Intro to Artificial Intelligence, at Furman University under the direction of Tom Allen. This repo is just a write up of the project and the code from 2012 I wrote for it. This was then developed further as part of an independent study with Tom Allen to the more fleshed out version documented here.

All the code is in dictV2.pl, to translate a word use word(W,L) - example shown in results - and to translate a sentence use inputsentence. Haven't run this in a while. No guarantees.

## Introduction:

The objective of this project was to create a Greek to English translator using the vocabulary from the first two chapters of Hansen and Quinn’s Greek textbook.<sup>1</sup> The goal was to achieve the typical accuracy of most translators, where the meaning is conveyed but there are a few errors that a native speaker would not make.<sup>2</sup>

## Methodology:

This program uses a "transfer" model (DCG-based machine translation technique) that translates individual words in Greek to their English equivalent in Prolog.<sup>3,4</sup>

The program is organized into two parts:

- a database of Greek words, or parts of words, with information about each.
- rules about grammar that help to limit the number of possible translations.

Other than these rules, there are a handful of rules meant for I/O to query the system for translations. Due to the nature of the Greek and English languages, there are sometimes multiple possible translations. Prolog handles this by giving all possible answers.

## Verb Approach:

![ἐπαίδευαμεν highlighted by component parts](images/ἐπαίδευαμεν.png?raw=true)

To translate the Greek language to English requires more complexity than simply rewriting the Greek characters for the letters in our Latin script. For example, in Greek: verbs have 6 principle parts, while English only has 3 (do, did, done). Each of these parts forms the stem of a word that can additionally be augmented, ἐ-, or not. Furthermore, each set of augment and stem can have dozens of endings. In total, any given verb in Greek can have nearly 1400 forms (see below Figure for an idea of this).

![παιδευω verb tree](images/παιδευω-Verb-Tree.png?raw=true)

To figure out what a verb is, the program navigates a decision tree that operates like this:

![how the system parses words generally, in this case a verb](images/Verb-Parse.png?raw=true)

This means that the program first checks the beginning of the word for an augment - stem pairing, then, after finding a pairing (or just the stem), the program checks to see if any of the endings with the aug-stem pair match the given verb.

## Results:

To test this system I used the Drills for practice from the end of each chapter<sup>1</sup>. Some of the drills ask you to identify a word, then pluralize it. Here, the system works perfectly:

![παιδευσεις Drill](images/παιδευσεις-Drill.png?raw=true)

When translating a sentence, the system works rather well with simple sentences - giving one translation,

![sentence with 1 translation from Hansen and Quinn](images/sentence-1.png?raw=true)

but because some Greek words can have multiple meanings there are sometimes faults (below is a sentence with 24 possible translations).

![sentence with 24 translations from Hansen and Quinn](images/sentence-24.png?raw=true)

## Conclusion:

The last sentence from the results section shows a critical downfall of this lexical level system - it doesn’t know syntax or semantics. If it knew Greek syntax, it would have known that the article οἱ agrees with θεοι making it masculine and nominative. The agreement of subject, θεοι, and verb, ἐπεμπον, makes ἐπεμπον plural, and δωρα can’t be nominative because θεοι already is. Going a step farther, if it knew semantics δωρα would be accusative because if it was vocative the gifts would be being addressed.

To improve this system, aside from adding more words, the next step is to add syntax and semantics. This would result in more accurate translations, though still limited to the dictionary I give it. From here, to allow the English translations to be more natural, I could add an English grammar that would take the translated words, and their relations to one another, and produce grammatically correct English sentences. Another possible approach would be to incorporate a statistical model that takes regular pairings of words from translations to produce a more natural output.

All these potential improvements may be better handled by a different technique such as a Lexical Functional Grammar or something a bit more out there such as the EA NLU system<sup>5</sup>.

## References:

1. H\. Hansen, G. M. Quinn (2011). Greek an Intensive Course. Bronx, NY: Fordham University Press, , pp. 1-110
1. S\. Russell and P. Norvig (2010). Artificial Intelligence - A Modern Approach.
1. Rinke (2013, June 18). SWI-Prolog’s manual.
1. D\. Meurers (2005, January 06). Implementing finite state machines and learning Prolog along the way.
1. E\. Tomai and Kenneth D. Forbus (2009). EA NLU: Practical Language Understanding for Cognitive Modeling.
