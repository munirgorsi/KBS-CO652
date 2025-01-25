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