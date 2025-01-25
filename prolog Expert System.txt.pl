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
    % Asking the user for their income
    write('What is your income? '), read(TempIncome), nl,
   
    % Check if the income is above a threshold of 25,000 for mortgage eligibility
    (TempIncome >= 25000 ->
        Income = TempIncome ;
        % If income is too low, prompt the user to reassess
        write('Income too low for mortgage. Please reassess.'), nl, fail).

% Rule 2: Ask for credit score
ask_credit_score(CreditScore) :-
    % Asking the user for their credit score
    write('What is your credit score? '), read(TempCreditScore), nl,
   
    % Check if the credit score is within the valid range (600 - 999)
    (TempCreditScore >= 600, TempCreditScore =< 999 ->
        CreditScore = TempCreditScore ;
        % If the credit score is invalid, prompt the user to enter a valid score
        write('Invalid credit score. Please enter a valid credit score between 600 and 999.'), nl, ask_credit_score(CreditScore)).
 
% Rule 3: Ask for employment status
ask_employment_status(EmploymentStatus) :-
    % Asking the user for their employment status (options: employed, unemployed, retired)
    write('What is your employment status? (employed, unemployed, retired) '), read(TempEmploymentStatus), nl,
   
    % Check if the employment status is valid
    (member(TempEmploymentStatus, [employed, unemployed, retired]) ->
        EmploymentStatus = TempEmploymentStatus ;
        % If invalid, ask the user to enter a valid response
        write('Invalid input. Please enter one of: employed, unemployed, or retired: '), nl, ask_employment_status(EmploymentStatus)).
 
% Rule 4: Ask for borrow amount with double-check
ask_borrow_amount(BorrowAmount) :-
    % Asking the user for the borrow amount
    write('How much would you like to borrow? '), read(TempBorrowAmount), nl,
   
    % Ensure that the borrow amount is greater than 0
    (TempBorrowAmount > 0 ->
        % Double-checking the borrow amount
        confirm_input('The amount you want to borrow is ', TempBorrowAmount, Yes),
        (Yes == yes ->
            BorrowAmount = TempBorrowAmount ;
            ask_borrow_amount(BorrowAmount)) ;
        % If borrow amount is invalid, ask again
        write('Borrow amount must be greater than 0.'), nl, ask_borrow_amount(BorrowAmount)).
 
% Rule 5: Ask for down payment with double-check
ask_down_payment(DownPayment) :-
    % Asking the user for their down payment
    write('What is your down payment? '), read(TempDownPayment), nl,
   
    % Ensure the down payment is non-negative
    (TempDownPayment >= 0 ->
        % Double-checking the down payment amount
        confirm_input('Your down payment is ', TempDownPayment, Yes),
        (Yes == yes ->
            DownPayment = TempDownPayment ;
            ask_down_payment(DownPayment)) ;
        % If down payment is invalid, ask again
        write('Down payment must be non-negative.'), nl, ask_down_payment(DownPayment)).
 
