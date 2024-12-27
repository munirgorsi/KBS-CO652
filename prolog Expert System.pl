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
    nl,
    evaluate_eligibility(Answers).

% Process the list of questions and collect answers
questions([], []).
questions([Question|RestQuestions], [Answer|RestAnswers]) :-
    write(Question),
    nl,
    read(Answer),
    questions(RestQuestions, RestAnswers).

% Evaluate eligibility based on answers
evaluate_eligibility([Age, Income, PropertyValue, Deposit, _]) :-
    (   Deposit >= 0.2 * PropertyValue, % Check if deposit is at least 20% of property value
        Income >= 0.05 * PropertyValue  % Check if annual income is at least 5% of property value (UK standard)
    ->  write('Congratulations! You are eligible for the mortgage.'), nl
    ;   write('Unfortunately, you are not eligible for the mortgage. You need to improve your credit score'), nl
    ).

 
