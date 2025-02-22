create table StrTest(PaymentDetails varchar(max))
insert into StrTest values ('Full Name = Abdullayev Shoxruh Account = 20201123456789790001 CorrAccount = 105USD777132005'),
              ('Full Name = Alimboev Hamid Account = 20001123459872543510 CorrAccount = 110USD000177007')
insert into StrTest values ('Full Name = Musdanov Kamol Account = 20201123456789790001 CorrAccount = 1005USD777132005')



select SUBSTRING(PaymentDetails,charindex('Full Name = ', Paymentdetails)+DATALENGTH('Full Name = '),
									charindex('Account', Paymentdetails)-DATALENGTH('Full Name = ')-2) as FullName,
		SUBSTRING(Paymentdetails,charindex('Account', Paymentdetails)+DATALENGTH('Account = '),
									charindex('CorrAccount', Paymentdetails)-charindex('Account', Paymentdetails)-DATALENGTH('Account = ')-1) as Account,
		SUBSTRING(Paymentdetails,charindex('CorrAccount', Paymentdetails)+DATALENGTH('CorrAccount = '),
									DATALENGTH(Paymentdetails)-charindex('CorrAccount', Paymentdetails)-DATALENGTH('CorrAccount = ')+1) as CorrAccount,		
		SUBSTRING(Paymentdetails,charindex('CorrAccount', Paymentdetails)+DATALENGTH('CorrAccount = '),
									Patindex('%[1234567890]USD%', Paymentdetails)-charindex('CorrAccount', Paymentdetails)-DATALENGTH('CorrAccount = ')+1) as Amount_USD
									
from StrTest
select * from StrTest

--Abdullayev Shoxruh
--20201123456789790001
--105USD777132005
--105
