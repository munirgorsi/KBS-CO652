% Simple Mortgage Expert System

% Interface name: mortgage_advisor

% Entry point for the expert system
    write('Well Come to Simple Mortgage Expert System Build up By Mohammad Qasim Matloob and Muhammad Munir.'),
    nl,
    write('Please respond to the following questions in order to verify your mortgage eligibility:'),
    nl,
    questions(["What is your age?", 
               "What is your annual income before Tax(£)?", 
               "Expected value of the property you want to buy?(£)",
               "How much deposit do you have (£)?", 
               "Do you have any existing loans?",
              "What is your current credit score?",
              "How long have you been employed? (in years)",
              "Are you a first-time buyer?",
              "What is your marital status?",
              "Do you have any dependents?"],
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
evaluate_eligibility([Age, Income, PropertyValue, Deposit, Loans, CreditScore, EmploymentDuration, FirstTimeBuyer, MaritalStatus, Dependents]) :-
    rule_1(Age),
    rule_2(Income, PropertyValue),
    rule_3(Deposit, PropertyValue),
    rule_4(Loans),
    rule_5(CreditScore),
    rule_6(EmploymentDuration),

% Rule 1: Age should be at least 18
rule_1(Age) :-
    Age >= 18, !.
rule_1(_) :-
    write('You must be at least 18 years old to apply for a mortgage.'), nl, fail.

% Rule 2: Income should be at least 5% of the property value
rule_2(Income, PropertyValue) :-
    Income >= 0.05 * PropertyValue, !.
rule_2(_, _) :-
    write('Your income should be at least 5% of the property value.'), nl, fail.

% Rule 3: Deposit should be at lesat 20% of the property value
rule_3(Deposit,PropertyValue) :-
Deposit >= 0.2 * PropertyValue, !.
rule_3(_,_) :-
write('YourDeposit should be at lesat 20% of the property value. ') nl, fail.

% Rule 4: No existing loans or manageable debt
rule_4('no') :- !.
rule_4('yes') :-
    write('You must have no existing loans or manageable debt to qualify for the mortgage.'), nl, fail.


% Rule 5: Credit score should be above a threshold (e.g., 600)
rule_5(CreditScore) :-
    CreditScore >= 600, !.
rule_5(_) :-
    write('Your credit score is too low for mortgage approval. A minimum score of 600 is required.'), nl, fail.
 
% Rule 6: Employment duration should be at least 1 year
rule_6(EmploymentDuration) :-
    EmploymentDuration >= 1, !.
rule_6(_) :-
    write('You must have been employed for at least 1 year.'), nl, fail.