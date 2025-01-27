% Main rule to start the system
start :-
    % Welcome message
    write('Welcome to the Mortgage Advisor Expert System build up by Mohammad Qasim Matloob & Muhammad Munir!'), nl,
   
    % Asking the user for their income
    ask_income(Income),
   
    % Asking the user for their credit score
    ask_credit_score(CreditScore),
   
    % Asking the user for their employment status
    ask_employment_status(EmploymentStatus),
   
    % Asking the user for the amount they would like to borrow
    ask_borrow_amount(BorrowAmount),
   
    % Asking the user for their down payment
    ask_down_payment(DownPayment),
   
    % Asking the user for their age
    ask_age(Age),
   
    % Asking the user if they have previously owned a home
    ask_home_ownership(HomeOwnership),
   
    % Asking the user for their preferred mortgage term
    ask_mortgage_term(MortgageTerm),
   
    % Asking the user for their total monthly debt payment
    ask_monthly_debt(MonthlyDebt),
   
    % Asking the user if they have had a previous mortgage
    ask_previous_mortgage(HomeOwnershipHistory),
   
    % Evaluate the mortgage eligibility based on the user's input
    evaluate_mortgage(Income, CreditScore, EmploymentStatus, BorrowAmount, DownPayment, Age, HomeOwnership, MortgageTerm, MonthlyDebt, HomeOwnershipHistory).
 
% Rule 1: Ask for income
ask_income(Income) :-
    write('What is your income? '), read(TempIncome), nl,
    (TempIncome >= 25000 ->
        Income = TempIncome ;
        write('Income too low for mortgage. Please reassess.'), nl, fail).
 
% Rule 2: Ask for credit score
ask_credit_score(CreditScore) :-
    write('What is your credit score? (0 to 999) '), read(TempCreditScore), nl,
    (TempCreditScore >= 600, TempCreditScore =< 999 ->
        CreditScore = TempCreditScore ;
        write('Invalid credit score. Please enter a valid credit score between 600 and 999.'), nl, ask_credit_score(CreditScore)).
 
% Rule 3: Ask for employment status
ask_employment_status(EmploymentStatus) :-
    write('What is your employment status? (employed, unemployed, retired) '), read(TempEmploymentStatus), nl,
    (member(TempEmploymentStatus, [employed, unemployed, retired]) ->
        EmploymentStatus = TempEmploymentStatus ;
        write('Invalid input. Please enter one of: employed, unemployed, or retired: '), nl, ask_employment_status(EmploymentStatus)).
 
% Rule 4: Ask for borrow amount with double-check
ask_borrow_amount(BorrowAmount) :-
    write('How much would you like to borrow? '), read(TempBorrowAmount), nl,
    (TempBorrowAmount > 0 ->
        confirm_input('The amount you want to borrow is ', TempBorrowAmount, Yes),
        (Yes == yes -> BorrowAmount = TempBorrowAmount ; ask_borrow_amount(BorrowAmount)) ;
        write('Borrow amount must be greater than 0.'), nl, ask_borrow_amount(BorrowAmount)).
 
% Rule 5: Ask for down payment with double-check
ask_down_payment(DownPayment) :-
    write('What is your down payment? '), read(TempDownPayment), nl,
    (TempDownPayment >= 0 ->
        confirm_input('Your down payment is ', TempDownPayment, Yes),
        (Yes == yes -> DownPayment = TempDownPayment ; ask_down_payment(DownPayment)) ;
        write('Down payment must be non-negative.'), nl, ask_down_payment(DownPayment)).
 
% Rule 6: Ask for age
ask_age(Age) :-
    write('What is your age? '), read(TempAge), nl,
    (TempAge >= 0 ->
        Age = TempAge ;
        write('Invalid age. Please enter a valid age.'), nl, ask_age(Age)).
 
% Rule 7: Ask for home ownership
ask_home_ownership(HomeOwnership) :-
    write('Have you previously owned a home? (yes/no) '), read(TempHomeOwnership), nl,
    (member(TempHomeOwnership, [yes, no]) ->
        HomeOwnership = TempHomeOwnership ;
        write('Invalid input. Please enter yes or no.'), nl, ask_home_ownership(HomeOwnership)).
 
% Rule 8: Ask for preferred mortgage term
ask_mortgage_term(MortgageTerm) :-
    write('What is your preferred mortgage term (in years)? '), read(TempMortgageTerm), nl,
    (TempMortgageTerm > 0 ->
        MortgageTerm = TempMortgageTerm ;
        write('Invalid mortgage term. Please enter a positive number of years.'), nl, ask_mortgage_term(MortgageTerm)).
 
% Rule 9: Ask for total monthly debt payment
ask_monthly_debt(MonthlyDebt) :-
    write('What is your total monthly debt payment? '), read(TempMonthlyDebt), nl,
    (TempMonthlyDebt >= 0 ->
        MonthlyDebt = TempMonthlyDebt ;
        write('Monthly debt payment must be non-negative. Please enter again.'), nl, ask_monthly_debt(MonthlyDebt)).
 
% Rule 10: Ask for previous mortgage history
ask_previous_mortgage(HomeOwnershipHistory) :-
    write('Have you had a previous mortgage? (yes/no) '), read(TempHomeOwnershipHistory), nl,
    (member(TempHomeOwnershipHistory, [yes, no]) ->
        HomeOwnershipHistory = TempHomeOwnershipHistory ;
        write('Invalid input. Please enter yes or no.'), nl, ask_previous_mortgage(HomeOwnershipHistory)).
 
% Confirmation rule: double-check user input
confirm_input(Prompt, Value, Yes) :-
    write(Prompt), write(Value), write('. Is this correct? (yes/no) '), read(Yes), nl.
 
% Evaluate mortgage eligibility
evaluate_mortgage(Income, CreditScore, EmploymentStatus, BorrowAmount, DownPayment, Age, HomeOwnership, MortgageTerm, MonthlyDebt, HomeOwnershipHistory) :-
    write('Thank you for providing the information!'), nl,
    write('Here is the summary of your inputs:'), nl,
    write('Income: '), write(Income), nl,
    write('Credit Score: '), write(CreditScore), nl,
    write('Employment Status: '), write(EmploymentStatus), nl,
    write('Borrow Amount: '), write(BorrowAmount), nl,
    write('Down Payment: '), write(DownPayment), nl,
    write('Age: '), write(Age), nl,
    write('Home Ownership: '), write(HomeOwnership), nl,
    write('Mortgage Term: '), write(MortgageTerm), nl,
    write('Monthly Debt: '), write(MonthlyDebt), nl,
    write('Previous Mortgage: '), write(HomeOwnershipHistory), nl,
 
    % Eligibility checks
    (Income >= 50000 ->
        nl, write('Income is acceptable.') ;
        write('Income too low. Please reassess.'), nl, fail),
 
    (CreditScore >= 650 ->
        nl, write('Credit score is acceptable.') ;
        write('Credit score too low. Please reassess.'), nl, fail),
 
    (DownPayment >= 20000 ->
        nl, write('Down payment is sufficient.') ;
        write('Down payment too low. Please reconsider your savings.'), nl, fail),
 
    (BorrowAmount =< (Income * 5) ->
        nl, write('Borrow amount is acceptable relative to income.') ;
        write('Borrow amount too high. Please reassess.'), nl, fail),
 
    (MonthlyDebt / Income < 0.4 ->
        nl, write('Your debt-to-income ratio is acceptable.') ;
        write('Debt-to-income ratio too high. Please reduce debt before applying.'), nl, fail),
 
    (EmploymentStatus \= unemployed ->
        nl, write('Employment status is acceptable.') ;
        write('Employment status is not acceptable for mortgage approval.'), nl, fail),
 
    (Age >= 18, Age =< 70 ->
        nl, write('Age is acceptable.') ;
        write('Age is out of acceptable range. You must be between 18 and 70 years old to apply for a mortgage.'), nl, fail),
 
    (HomeOwnershipHistory == yes ->
        nl, write('Home ownership history is positive.') ;
        write('Home ownership history is not required but can affect terms.'), nl),
 
    nl,
    write('************************************************************'), nl,
    write('                 Congratulations!'), nl,
    write('        Your mortgage application is ACCEPTED!'), nl,
    write('************************************************************'), nl.
 
evaluate_mortgage(_, _, _, _, _, _, _, _, _, _) :-
    write('************************************************************'), nl,
    write('                     MORTGAGE REJECTED'), nl,
    write('    Unfortunately, you do not meet the eligibility criteria.'), nl,
    write('************************************************************'), nl.