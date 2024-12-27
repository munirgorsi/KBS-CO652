% Simple Mortgage Expert System
 
% Interface name: mortgage_advisor
 
% Entry point for the expert system
mortgage_advisor :-
    write('Well Come to Simple Mortgage Expert System Build By Mohammad Qasim Matloob and Muhammad Munir.'),
    nl,
    write('To check eligibility for the mortgage, please answer the following questions:'),
    nl,
    questions(["What is your age?",
               "What is your annual income before Tax(£)?",
               "What is the expected value of the property you want to buy?(£)",
               "How much deposit do you have (£)?",
               "Do you have any existing loans?"],
              Answers),
    write('Your answers: '),
    write(Answers),
    nl.
 
% Process the list of questions and collect answers
questions([], []).
questions([Question|RestQuestions], [Answer|RestAnswers]) :-
    write(Question),
    nl,
    read(Answer),
    questions(RestQuestions, RestAnswers).
 
