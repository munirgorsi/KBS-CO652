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
 
% Confirmation rule: double-check user input for borrow amount and down payment
confirm_input(Prompt, Value, Yes) :-
    % Prompt the user for confirmation of the entered value
    write(Prompt), write(Value), write('. Is this correct? (yes/no) '), read(Yes), nl.
 
% Evaluate mortgage eligibility with additional professional rules
evaluate_mortgage(Income, CreditScore, EmploymentStatus, BorrowAmount, DownPayment, Age, HomeOwnership, MortgageTerm, MonthlyDebt, HomeOwnershipHistory) :-
    % Displaying the user's input summary
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
   
    % Professional Rule 11: Income check (must be >= 50,000)
    (Income >= 50000 ->
        nl, write('Income is acceptable.') ;
        write('Income too low. Please reassess.'), nl, fail),
   
    % Professional Rule 12: Credit Score check (must be >= 650)
    (CreditScore >= 650 ->
        nl, write('Credit score is acceptable.') ;
        write('Credit score too low. Please reassess.'), nl, fail),
   
    % Professional Rule 13: Down Payment check (must be >= 20,000)
    (DownPayment >= 20000 ->
        nl, write('Down payment is sufficient.') ;
        write('Down payment too low. Please reconsider your savings.'), nl, fail),
   
    % Professional Rule 14: Borrow Amount check (must be <= 5 times the income)
    (BorrowAmount =< (Income * 5) ->
        nl, write('Borrow amount is acceptable relative to income.') ;
        write('Borrow amount too high. You may need to reassess the amount you want to borrow.'), nl, fail),
   
    % Professional Rule 15: Debt-to-Income Ratio (DTI) check (must be < 40%)
    (MonthlyDebt / Income < 0.4 ->
        nl, write('Your debt-to-income ratio is acceptable.') ;
        write('Debt-to-income ratio too high. Please work on reducing debt before applying.'), nl, fail),

% Professional Rule 16: Employment Status check (no "self-employed" option)
    (EmploymentStatus \= unemployed ->
        nl, write('Employment status is acceptable.') ;
        write('Employment status is not acceptable for mortgage approval.'), nl, fail),
   
    % Professional Rule 17: Age Range check (between 18 and 70)
    (Age >= 18, Age =< 70 ->
        nl, write('Age is acceptable.') ;
        write('Age is out of acceptable range. You must be between 18 and 70 years old to apply for a mortgage.'), nl, fail),
   
    % Professional Rule 18: Home Ownership History check
    (HomeOwnershipHistory == yes ->
        nl, write('Home ownership history is considered positive for mortgage approval.') ;
        write('Home ownership history is not necessary but may impact your loan terms.'), nl),
   
    % Rule 19 If all checks are passed, show acceptance message
    nl,
    write('************************************************************'), nl,
    write('                 Congratulations!'), nl,
    write('        Your mortgage application is ACCEPTED!'), nl,
    write('************************************************************'), nl.
 
% In case of failure (any condition not met), show rejection message
evaluate_mortgage(_, _, _, _, _, _, _, _, _, _) :-
    write('************************************************************'), nl,
    write('                     MORTGAGE REJECTED'), nl,
    write('    Unfortunately, you do not meet the eligibility criteria.'), nl,
    write('************************************************************'), nl.
