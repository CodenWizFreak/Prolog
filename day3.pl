employee(101, 'Lakshmi Shrivastava', 'AMAZON', '2019-07-15').
employee(102, 'Amit Verma', 'TCS', '2020-06-10').
employee(103, 'Riya Sharma', 'CTS', '2018-08-25').
employee(104, 'Arjun Mehta', 'AMAZON', '2019-09-05').
employee(105, 'Sneha Das', 'TCS', '2021-07-20').
employee(106, 'Rahul Gupta', 'WIPRO', '2017-11-30').
employee(107, 'Ananya Roy', 'CTS', '2022-01-12').
employee(108, 'Sourav Sen', 'INFOSYS', '2020-04-05').
employee(109, 'Lakshmi Shrivastava', 'MICROSOFT', '2016-09-18').
employee(110, 'Varun Agarwal', 'AMAZON', '2015-12-02').

company('AMAZON', 'Seattle', 'E-commerce & Cloud Computing').
company('TCS', 'Mumbai', 'IT Services & Consulting').
company('CTS', 'Chennai', 'IT Services & Solutions').
company('WIPRO', 'Bangalore', 'IT Services & Consulting').
company('INFOSYS', 'Bangalore', 'IT Services & Consulting').
company('MICROSOFT', 'Redmond', 'Software & Cloud Computing').

education(101, 'B.Tech', 'CSE', 'HIT').
education(102, 'M.Tech', 'CSE-AIML', 'HIT').
education(103, 'B.Tech', 'CSE-DS', 'HIT').
education(104, 'B.Tech', 'CSE-AIML', 'HIT').
education(105, 'M.Tech', 'CSE', 'HIT').
education(106, 'B.Tech', 'ECE', 'HIT').
education(107, 'M.Tech', 'CSE-DS', 'HIT').
education(108, 'B.Tech', 'CSE', 'IIT').
education(109, 'M.Tech', 'CSE', 'HIT').
education(110, 'B.Tech', 'CSE', 'HIT').

find_employee_with_company(Name) :-
    employee(EmpID, Name, Company, DOJ),
    company(Company, Location, Industry),
    format('Employee ID: ~w, Name: ~w, Company: ~w, DOJ: ~w~n', [EmpID, Name, Company, DOJ]),
    format('Company: ~w, Location: ~w, Industry: ~w~n', [Company, Location, Industry]).

find_hit_employees :-
    employee(EmpID, Name, Company, DOJ),
    education(EmpID, Qualification, Department, 'HIT'),
    company(Company, Location, Industry),
    format('Employee ID: ~w, Name: ~w, Qualification: ~w, Department: ~w, Institute: HIT~n', 
           [EmpID, Name, Qualification, Department]),
    format('Company: ~w, Location: ~w, Industry: ~w~n', [Company, Location, Industry]).

find_amazon_employees :-
    employee(EmpID, Name, 'AMAZON', DOJ),
    education(EmpID, Qualification, Department, Institute),
    format('Employee ID: ~w, Name: ~w, DOJ: ~w, Qualification: ~w, Department: ~w, Institute: ~w~n',
           [EmpID, Name, DOJ, Qualification, Department, Institute]).

find_it_companies :-
    company(Company, Location, 'IT Services & Consulting'),
    format('Company: ~w, Location: ~w~n', [Company, Location]).

find_mtech_employees :-
    education(EmpID, 'M.Tech', Department, Institute),
    employee(EmpID, Name, Company, DOJ),
    format('Employee ID: ~w, Name: ~w, Qualification: M.Tech, Department: ~w, Institute: ~w~n',
           [EmpID, Name, Department, Institute]),
    format('Company: ~w, DOJ: ~w~n', [Company, DOJ]).
