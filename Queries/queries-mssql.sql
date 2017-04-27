-- query #1
SELECT * FROM Item;

-- query #2
SELECT * FROM Invoice
WHERE Invoice.in_id > 50 AND Invoice.in_date > 1/1/2006 AND Invoice.in_date < 1/1/2007 AND Invoice.in_description LIKE '%ohp%' AND Invoice.in_total = Invoice.in_totalafterdiscount AND Invoice.in_total <> 100 OR NOT Invoice.in_cu_id >= 5 AND Invoice.in_id BETWEEN 1 AND 10000 OR Invoice.in_id > 49+1 AND Invoice.in_total+33 <> 5 AND Invoice.in_total = - Invoice.in_totalafterdiscount * 2 ;


-- query #3
SELECT Customer.cu_id , Invoice.in_id , InvoiceDetail.ind_qty , Item.it_serialnumber , Movement.mo_description , Movement_Details.mod_it_id , Users.us_id , Users.us_code , PurchaseOrder.po_description , Supplier.su_name FROM Customer , Invoice , InvoiceDetail , Item , Movement , Movement_Details , Users , PurchaseOrder , Supplier
WHERE Supplier.su_name = 'Mike' AND Customer.cu_id = Invoice.in_cu_id AND InvoiceDetail.ind_in_id = Invoice.in_id AND InvoiceDetail.ind_it_id = Item.it_id AND Movement_Details.mod_mo_id = Movement.mo_id AND Movement.mo_us_id = Users.us_id AND PurchaseOrder.po_us_id =Users.us_id AND PurchaseOrder.po_us_id = Users.us_id AND PurchaseOrder.po_su_id = Supplier.su_id

-- query #4
SELECT Customer.cu_id , Customer.cu_name , Customer.cu_telephone , Customer.cu_fax , Customer.cu_email FROM Customer ORDER BY Customer.cu_id , Customer.cu_name DESC , Customer.cu_telephone DESC, Customer.cu_fax , Customer.cu_email DESC ;

-- query #5
SELECT SUM(Invoice.in_total) , AVG(Invoice.in_totalafterdiscount) , MAX(Invoice.in_total) , COUNT(Customer.cu_id) , SUM(InvoiceDetail.ind_qty) FROM Customer , Invoice , InvoiceDetail WHERE Customer.cu_id = Invoice.in_cu_id AND Invoice.in_id = InvoiceDetail.ind_in_id GROUP BY Invoice.in_id ;

-- query #6
SELECT SUM(Invoice.in_total) , AVG(Invoice.in_totalafterdiscount) , MAX(Invoice.in_total) , COUNT(Customer.cu_id) , SUM(InvoiceDetail.ind_qty) FROM Customer , Invoice , InvoiceDetail
WHERE Customer.cu_id = Invoice.in_cu_id AND Invoice.in_id = InvoiceDetail.ind_in_id GROUP BY Invoice.in_id HAVING COUNT(Invoice.in_id)>0 AND SUM(Invoice.in_total) = AVG(Invoice.in_totalafterdiscount) ;

-- query #7
SELECT Customer.cu_name FROM Customer WHERE Customer.cu_name = (SELECT Users.us_name FROM Users WHERE Users.us_class = 'administrator') AND Customer.cu_fax = (SELECT Supplier.su_fax FROM Supplier WHERE Supplier.su_phone = '123456') AND Customer.cu_email = (SELECT Supplier.su_email FROM Supplier WHERE Supplier.su_address LIKE '%h%') ;
