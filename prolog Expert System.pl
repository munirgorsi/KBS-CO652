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
    rule_7(FirstTimeBuyer),
    rule_8(MaritalStatus),
    rule_9(Dependents),
    rule_10(Income, PropertyValue),
    rule_11(Age),
    rule_12(EmploymentDuration, Income),
    rule_13(FirstTimeBuyer),
    rule_14(MaritalStatus),
    rule_15(Deposit),
    rule_16(Loans),
    rule_17(CreditScore),
    rule_18(Age, PropertyValue),
    rule_19(Income, PropertyValue),
    rule_20(Loans).

% Rule 1: Age should be at least 18
rule_1(Age) :-
    Age >= 18, !.
rule_1(_) :-
    write('You must be at least 18 years old to apply for a mortgage.'), nl, fail.
).

 
