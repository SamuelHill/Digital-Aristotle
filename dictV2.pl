% These are the word rules. This allows you to query the system without having to know
% what type of word you are looking at.

word(X,L):-
	noun_check(X,L).
word(X,L):-
	verb_check(X,L).
word(X,L):-
	preposition(X,L).
word(X,L):-
	conjunction(X,L).
word(X,L):-
	particle(X,L).
word(X,L):-
	number(X,L).
word(X,L):-
	adverb(X,L).
word(X,L):-
	article(X,L).

% This is the ‘append function’. In the first rule we handle the case when the first list
% is empty. In the second, we recursively split the first list and add each item to
% Result until we get an empty list in the first goal. Then we move to the first rule
% where our Result is set to our second list, and the fact terminates the recursion. As
% we pop out of each recursive step, we add on the first list.

append([],List,List).
append([Head|Tail],List2,[Head|Result]):-
	append(Tail,List2,Result).

/******************************************************
 *  _____  _      _   _                               *
 * |  __ \(_)    | | (_)                              *
 * | |  | |_  ___| |_ _  ___  _ __   __ _ _ __ _   _  *
 * | |  | | |/ __| __| |/ _ \| '_ \ / _` | '__| | | | *
 * | |__| | | (__| |_| | (_) | | | | (_| | |  | |_| | *
 * |_____/|_|\___|\__|_|\___/|_| |_|\__,_|_|   \__, | *
 *                                              __/ | *
 *                                             |___/  *
 ******************************************************/

% Adverbs take the form adverb(greek_word, [english_meaning]).
adverb(και, [even]).
adverb(εὐ, [well]).
adverb(νυν, [now]).
adverb(οὐ, [not]).
adverb(οὐκ, [not]).
adverb(οὐχ, [not]).

% The article takes the form article(greek_word, [gender,case,number]).
article(ὁ, [masculine,nominative,singular]).
article(του, [masculine,genitive,singular]).
article(τῳ, [masculine,dative,singular]).
article(τον, [masculine,accusative,singular]).
article(οἱ, [masculine,nominative,plural]).
article(των, [masculine,genitive,plural]).
article(τοις, [masculine,dative,plural]).
article(τους, [masculine,accusative,plural]).
article(ἡ, [feminine,nominative,singular]).
article(της, [feminine,genitive,singular]).
article(τῃ, [feminine,dative,singular]).
article(την, [feminine,accusative,singular]).
article(αἱ, [feminine,nominative,plural]).
article(των, [feminine,genitive,plural]).
article(ταις, [feminine,dative,plural]).
article(τας, [feminine,accusative,plural]).
article(το, [neuter,nominative,singular]).
article(του, [neuter,genitive,singular]).
article(τῳ, [neuter,dative,singular]).
article(το, [neuter,accusative,singular]).
article(τα, [neuter,nominative,plural]).
article(των, [neuter,genitive,plural]).
article(τοις, [neuter,dative,plural]).
article(τα, [neuter,accusative,plural]).

% Conjunctions take the form conjunction(greek_word, [english_meaning]).
conjunction(και, [and]).
conjunction(γαρ, [for]).
conjunction(δε, [but]).
conjunction(ἠ, [or]).
conjunction(μεν, [on_the_one_hand]).
conjunction(δε, [on_the_other_hand]).

% Interjections take the form interjection(greek_word, [english_meaning]).
interjection(ὠ, [oh]).

% These are the noun rules. These rules define the different types of nouns, and their
% formation. The general form is:
% noun(X,Y,L):-
%	stem(X,A),
%	ending(Y,B),
%	append(A,B,L).
% (Stem and ending must match)

% First Declension (long A)
noun(X,Y,L):-
	firstDecLA(X,A),
	normalfirstLA(Y,B),
	append(A,B,L).

% First Declension (short A)
noun(X,Y,L):-
	firstDecSA(X,A),
	normalfirstSA(Y,B),
	append(A,B,L).

% Second Declension (masc/fem)
noun(X,Y,L):-
	secondDecMF(X,A),
	normalsecondMF(Y,B),
	append(A,B,L).

% Second Declension (neuter)
noun(X,Y,L):-
	secondDecΝ(X,A),
	normalsecondN(Y,B),
	append(A,B,L).

% First Declension long A endings
normalfirstLA(η, [nominative,singular]).
normalfirstLA(ης, [genitive,singular]).
normalfirstLA(ῃ, [dative,singular]).
normalfirstLA(ην, [accusative,singular]).
normalfirstLA(η, [vocative,singular]).
normalfirstLA(αι, [nominative,plural]).
normalfirstLA(ων, [genitive,plural]).
normalfirstLA(αις, [dative,plural]).
normalfirstLA(ας, [accusative,plural]).
normalfirstLA(αι, [vocative,plural]).

% First Declension short A endings
normalfirstSA(α, [nominative,singular]).
normalfirstSA(ας, [genitive,singular]).
normalfirstSA(ᾳ, [dative,singular]).
normalfirstSA(αν, [accusative,singular]).
normalfirstSA(α, [vocative,singular]).
normalfirstSA(αι, [nominative,plural]).
normalfirstSA(ων, [genitive,plural]).
normalfirstSA(αις, [dative,plural]).
normalfirstSA(ας, [accusative,plural]).
normalfirstSA(αι, [vocative,plural]).

% Second Declension masc/fem endings
normalsecondMF(ος, [nominative,singular]).
normalsecondMF(ου, [genitive,singular]).
normalsecondMF(ῳ, [dative,singular]).
normalsecondMF(ον, [accusative,singular]).
normalsecondMF(ε, [vocative,singular]).
normalsecondMF(οι, [nominative,plural]).
normalsecondMF(ων, [genitive,plural]).
normalsecondMF(οις, [dative,plural]).
normalsecondMF(ους, [accusative,plural]).
normalsecondMF(οι, [vocative,plural]).

% Second Declension neuter endings
normalsecondN(ον, [nominative,singular]).
normalsecondN(ου, [genitive,singular]).
normalsecondN(ῳ, [dative,singular]).
normalsecondN(ον, [accusative,singular]).
normalsecondN(ον, [vocative,singular]).
normalsecondN(α, [nominative,plural]).
normalsecondN(ων, [genitive,plural]).
normalsecondN(οις, [dative,plural]).
normalsecondN(α, [accusative,plural]).
normalsecondN(α, [vocative,plural]).

% First Declension long A stems
firstDecLA(μαχ, [battle,feminine]).
firstDecLA(τεχν, [art,feminine]).
firstDecLA(ψυχ, [soul,feminine]).

% First Declension short A stems
firstDecSA(ἀγορ, [market_place,feminine]).
firstDecSA(οἰκι, [house,feminine]).
firstDecSA(φιλι, [friendship,feminine]).
firstDecSA(χωρ, [land,feminine]).

% Second Declension masc/fem stems
secondDecMF(ἀγγελ, [messenger,masculine]).
secondDecMF(ἀδελφ, [brother,masculine]).
secondDecMF(ἀνθρωπ, [man,masculine]).
secondDecMF(θε, [god,masculine]).
secondDecMF(θε, [goddess,feminine]).
secondDecMF(λογ, [word,masculine]).
secondDecMF(νησ, [island,feminine]).
secondDecMF(ξεν, [foreigner,masculine]).
secondDecMF(ὁδ, [road,feminine]).
secondDecMF(ὁμηρ, [homer,masculine]). % Can’t capitalize Homer…
secondDecMF(πολεμ, [war,masculine]).
secondDecMF(στεφαν, [crown,masculine]).
secondDecMF(φιλ, [friend,masculine]).
secondDecMF(χρυσ, [gold,masculine]).

% Second Declension neuter stems
secondDecΝ(βιβλι, [book,neuter]).
secondDecΝ(δωρ, [gift,neuter]).
secondDecΝ(ἐργ, [work,neuter]).
secondDecN(ζῳ, [animal,neuter]).

% Numbers take the form number(greek_indeclinable_numeral, [#]).
number(ἑξ, [6]).
number(πεντε, [5]).

% Particles take the form particle(greek_word, [english_meaning]).
particle(ἀρα, [question]).

% Prepositions take the form preposition(greek_word, [english_meaning]).
preposition(εἰς, [into]).
preposition(ἐκ, [from]).
preposition(ἐξ, [from]).
preposition(ἐν, [in]).
preposition(ἀπο, [from]).
preposition(παρα, [from]).
preposition(παρα, [at]).
preposition(παρα, [to]).
preposition(προ, [before]).

% These are the verb rules. These rules define the different types of verbs, and their
% formation. The general form is:
% verb(X,Y,L):-
%	stem(X,A),
%	ending(Y,B),
%	append(A,B,L).
% Each verb has 6 principal parts, each part with a few variations. These are the stems, 
% and they are labeled according to the principal part and its alterations. Each ending
% is part of a group that tells us the tense, mood, and voice. These groups of endings
% are labeled with those 3 pieces of information (abbreviated).

% Present Indicative Active
verb(X,Y,L):-
	ppi(X,A),
	prinact(Y,B),
	append(A,B,L).

% Present Infinative Active
verb(X,Y,L):-
	ppi(X,A),
	prifact(Y,B),
	append(A,B,L).

% Imperfect Indicative Active
verb(X,Y,L):-
	augppi(X,A),
	iminact(Y,B),
	append(A,B,L).

% Future Indicative Active
verb(X,Y,L):-
	ppii(X,A),
	fuinact(Y,B),
	append(A,B,L).

% Aorist Indicative Active
verb(X,Y,L):-
	ppiii(X,A),
	aoinact(Y,B),
	append(A,B,L).

% Aorist Infinative Active
verb(X,Y,L):-
	noaugppiii(X,A),
	aoifact(Y,B),
	append(A,B,L).

% Present Indicative Active endings
prinact(ω, [present,indicative,active,first,singular]).
prinact(εις, [present,indicative,active,second,singular]).
prinact(ει, [present,indicative,active,third,singular]).
prinact(ομεν, [present,indicative,active,first,plural]).
prinact(ετε, [present,indicative,active,second,plural]).
prinact(ουσι, [present,indicative,active,third,plural]).
prinact(ουσιν, [present,indicative,active,third,plural]).

% Present Infinative Active ending
prifact(ειν, [present,infinitive,active]).

% Imperfect Indicative Active endings
iminact(ον, [imperfect,indicative,active,first,singular]).
iminact(ες, [imperfect,indicative,active,second,singular]).
iminact(ε, [imperfect,indicative,active,third,singular]).
iminact(εν, [imperfect,indicative,active,third,singular]).
iminact(ομεν, [imperfect,indicative,active,first,plural]).
iminact(ετε, [imperfect,indicative,active,second,plural]).
iminact(ον, [imperfect,indicative,active,third,plural]).

% Future Indicative Active endings
fuinact(ω, [future,indicative,active,first,singular]).
fuinact(εις, [future,indicative,active,second,singular]).
fuinact(ει, [future,indicative,active,third,singular]).
fuinact(ομεν, [future,indicative,active,first,plural]).
fuinact(ετε, [future,indicative,active,second,plural]).
fuinact(ουσι, [future,indicative,active,third,plural]).
fuinact(ουσιν, [future,indicative,active,third,plural]).

% Aorist Indicative Active endings
aoinact(α, [aorist,indicative,active,first,singular]).
aoinact(ας, [aorist,indicative,active,second,singular]).
aoinact(ε, [aorist,indicative,active,third,singular]).
aoinact(εν, [aorist,indicative,active,third,singular]).
aoinact(αμεν, [aorist,indicative,active,first,plural]).
aoinact(ατε, [aorist,indicative,active,second,plural]).
aoinact(αν, [aorist,indicative,active,third,plural]).

% Aorist Infinative Active ending
aoifact(αι, [aorist,infinitive,active]).

% Principal Part I stems
ppi(κελευ, [order]).
ppi(λυ, [destroy]).
ppi(παιδευ, [educate]).
ppi(πεμπ, [send]).

% Augmented Principal Part I stems
augppi(ἐκελευ, [order]).
augppi(ἐλυ, [destroy]).
augppi(ἐπαιδευ, [educate]).
augppi(ἐπεμπ, [send]).

% Principal Part II stems
ppii(κελευσ, [order]).
ppii(λυσ, [destroy]).
ppii(παιδευσ, [educate]).
ppii(πεμψ, [send]).

% Principal Part III stems
ppiii(ἐκελευσ, [order]).
ppiii(ἐλυσ, [destroy]).
ppiii(ἐπαιδευσ, [educate]).
ppiii(ἐπεμψ, [send]).

% Unaugmented Principal Part III stems
noaugppiii(κελευσ, [order]).
noaugppiii(λυσ, [destroy]).
noaugppiii(παιδευσ, [educate]).
noaugppiii(πεμψ, [send]).

/*****************************************************
 *   _____                                           *
 *  / ____|                                          *
 * | |  __ _ __ __ _ _ __ ___  _ __ ___   __ _ _ __  *
 * | | |_ | '__/ _` | '_ ` _ \| '_ ` _ \ / _` | '__| *
 * | |__| | | | (_| | | | | | | | | | | | (_| | |    *
 *  \_____|_|  \__,_|_| |_| |_|_| |_| |_|\__,_|_|    *
 *                                                   *
 *****************************************************/

% if tale is ; or . then remove
tail_not_mark(Atom, Removed, Mark):-
	atom_concat(Removed, Mark, Atom),
	is_period(Mark),
	!. 
tail_not_mark(Atom, Removed, ''):-
	Atom = Removed.

% Used in tail_not_mark to check if the ending has punctuation
is_period(.).
is_period(;).

% Checks how EmptyList can equal InputList with Spliter removed, then returns ListOut
split_atom(Spliter, InputList, ListOut):-
	atomic_list_concat(EmptyList, Spliter, InputList),
	delete(EmptyList, '', ListOut).

% Calls flatten/3 from flatten/2 with one input List and one output Flattened
flatten(List, Flattened):-
	flatten(List, [], Flattened).

% Handles when List is [], returns [].
flatten([], Flattened, Flattened).

% Splits the first argument into head and tail, then calls flatten on both.
flatten([Item|Tail], L, Flattened):-
	flatten(Item, L1, Flattened),
	flatten(Tail, L, L1).

% In the case of Item being a singular item in a list, this flattens Item into the second
% argument, which is the list being returned.
flatten(Item, Flattened, [Item|Flattened]):-
	\+ is_list(Item).

inputsentence:-
	% Read from user_input as a list of character codes, and store them in Input
	read_line_to_codes(user_input, Input),
	% Convert string (list of character codes) to an atom, and store that in InputAtom
	string_to_atom(Input,InputAtom),
	% Check to see if the tail has punctuation. If yes, remove it
	tail_not_mark(InputAtom, RemovedPunc, _),
	% Split the RemovedPunc atom into a list of atoms separated by the occurrence of 	% ’,’ and stores this list in CommaSep
	atomic_list_concat(CommaSep, ',', RemovedPunc),
	% Split the CommaSep list into more lists based on ‘ ’s
	maplist(split_atom(' '), CommaSep, SplitList),
	% Make the list 2D
	flatten(SplitList,FlatList),
	% Go through list and translate each word directly.
	search(FlatList).

% In the case of an empty list, return true.
search([]).

% Otherwise, Iterate through the List, translating each word as you go.
search([X|Rest]):-
	translate(X),
	tab(1),
	search(Rest).

% Translate function for articles
translate(X):-
	article(X,_),
	write(the).

% Translate function for preposition
translate(X):-
	preposition(X,[D]),
	write(D).

% Translate function for conjunctions
translate(X):-
	conjunction(X,[D]),
	write(D).

% Translate function for particles
translate(X):-
	particle(X,[D]),
	write(D).

% Translate function for numbers
translate(X):-
	number(X,[D]),
	write(D).

% Translate function for adverbs
translate(X):-
	adverb(X,[D]),
	write(D).

% Translate function for interjections
translate(X):-
	interjection(X,[D]),
	write(D).

% Translate function for nouns.
translate(X):-
	noun_check(X,[Word,_,Case,Number]),
	nounNumCheck(Word,Number,Noun),
	caseChanges(Case),
	write(Noun).

% Translate function for verbs.
translate(X):-
	verb_check(X,[Word,Tense,Mood,Voice,Number,Person]),
	verbTransformer(Word,Tense,Mood,Voice,Transformed),
	addSubject(Transformed,Number,Person,Verb),
	write(Verb).

% Translate function for verbs (only infinitives).
translate(X):-
	verb_check(X,[Word,Tense,Mood,Voice]),
	verbTransformer(Word,Tense,Mood,Voice,Verb),
	write(Verb).

% Checks the possible combinations of stem and ending from noun(X,Y,L) against the input W
noun_check(W,L):-
	noun(X,Y,L),
	atom_concat(X,Y,W).

% Checks if the word is supposed to be plural, if it is, pluralize it.
nounNumCheck(W,plural,P):-
	pluralizeNoun(W,P).
% Otherwise leave it alone.
nounNumCheck(W,singular,P):-
	P = W.

% How the system pluralizes nouns, takes the form pluralizeNoun(word,word_plural).
pluralizeNoun(man,men).
pluralizeNoun(battle,battles).
pluralizeNoun(art,arts).
pluralizeNoun(soul,souls).
pluralizeNoun(market_place,market_places).
pluralizeNoun(house,houses).
pluralizeNoun(friendship,friendships).
pluralizeNoun(land,lands).
pluralizeNoun(messenger,messengers).
pluralizeNoun(brother,brothers).
pluralizeNoun(god,gods).
pluralizeNoun(goddess,goddesses).
pluralizeNoun(word,words).
pluralizeNoun(island,islands).
pluralizeNoun(foreigner,foreigners).
pluralizeNoun(road,roads).
pluralizeNoun(homer,homers).
pluralizeNoun(war,wars).
pluralizeNoun(crown,crowns).
pluralizeNoun(friend,friends).
pluralizeNoun(gold,golds).
pluralizeNoun(book,books).
pluralizeNoun(gift,gifts).
pluralizeNoun(work,works).
pluralizeNoun(animal,animals).

% This checks all of the cases and returns true when one matches. (It always will)
caseChanges(nominative).
% In the special case of genitive, we add ‘of ‘ before the noun
caseChanges(genitive):-
	write(of),
	tab(1).
caseChanges(dative).
caseChanges(accusative).
caseChanges(vocative).

% Checks the possible combinations of stem and ending from verb(X,Y,L) against the input W
verb_check(W,L):-
	verb(X,Y,L),
	atom_concat(X,Y,W).

% These are the rules for how a verb gets transformed from its definition to the proper 
% tense, voice, and mood of that word.
verbTransformer(Word,present,indicative,active,Transformed):-
	prinactTransform(Word,Transformed).

verbTransformer(Word,imperfect,indicative,active,Transformed):-
	iminactTransform(Word,Transformed).

verbTransformer(Word,future,indicative,active,Transformed):-
	fuinactTransform(Word,Transformed).

verbTransformer(Word,aorist,indicative,active,Transformed):-
	aoinactTransform(Word,Transformed).

verbTransformer(Word,present,infinitive,active,Transformed):-
	prifactTransform(Word,Transformed).

verbTransformer(Word,aorist,infinitive,active,Transformed):-
	aoifactTransform(Word,Transformed).

% Transforms for present indicative active
prinactTransform(order,order).
prinactTransform(destroy,destroy).
prinactTransform(educate,educate).
prinactTransform(send,send).

% Transforms for imperfect indicative active
iminactTransform(order,used_to_order).
iminactTransform(destroy,used_to_destroy).
iminactTransform(educate,used_to_educate).
iminactTransform(send,used_to_send).

% Transforms for future indicative active
fuinactTransform(order,will_order).
fuinactTransform(destroy,will_destroy).
fuinactTransform(educate,will_educate).
fuinactTransform(send,will_send).

% Transforms for aorist indicative active
aoinactTransform(order,ordered).
aoinactTransform(destroy,destroyed).
aoinactTransform(educate,educated).
aoinactTransform(send,sent).

% Transforms for present infinative active
prifactTransform(order,to_order).
prifactTransform(destroy,to_destroy).
prifactTransform(educate,to_educate).
prifactTransform(send,to_send).

% Transforms for aorist infinative active
aoifactTransform(order,to_order).
aoifactTransform(destroy,to_destroy).
aoifactTransform(educate,to_educate).
aoifactTransform(send,to_send).

% Subject addition, adds a subject to our verb
addSubject(Transformed,first,singular,Verb):-
	atom_concat(i_,Transformed,Verb).

addSubject(Transformed,second,singular,Verb):-
	atom_concat(you_,Transformed,Verb).

addSubject(Transformed,third,singular,Verb):-
	atom_concat(it_,Transformed,Verb).

addSubject(Transformed,first,plural,Verb):-
	atom_concat(we_,Transformed,Verb).

addSubject(Transformed,second,plural,Verb):-
	atom_concat(you_,Transformed,Verb).

addSubject(Transformed,third,plural,Verb):-
	atom_concat(they_,Transformed,Verb).
