-- query #1
SELECT * FROM item;

-- query #2
SELECT * FROM invoice
WHERE invoice.in_id > 50 AND invoice.in_date > 1/1/2006 AND invoice.in_date < 1/1/2007 AND invoice.in_description LIKE '%ohp%' AND invoice.in_total = invoice.in_totalafterdiscount AND invoice.in_total <> 100 OR NOT invoice.in_cu_id >= 5 AND invoice.in_id BETWEEN 1 AND 10000 OR invoice.in_id > 49+1 AND invoice.in_total+33 <> 5 AND invoice.in_total = - invoice.in_totalafterdiscount * 2 ;

-- query #3
SELECT customer.cu_id , invoice.in_id , invoicedetail.ind_qty , item.it_serialnumber , movement.mo_description , movement_details.mod_it_id , users.us_id , users.us_code , purchaseorder.po_description , supplier.su_name FROM customer , invoice , invoicedetail , item , movement , movement_details , users , purchaseorder , supplier
WHERE supplier.su_name = 'Mike' AND customer.cu_id = invoice.in_cu_id AND invoicedetail.ind_in_id = invoice.in_id AND invoicedetail.ind_it_id = item.it_id AND movement_details.mod_mo_id = movement.mo_id AND movement.mo_us_id = users.us_id AND purchaseorder.po_us_id =users.us_id AND purchaseorder.po_us_id = users.us_id AND purchaseorder.po_su_id = supplier.su_id ;

-- query #4
SELECT customer.cu_id , customer.cu_name , customer.cu_telephone , customer.cu_fax , customer.cu_email FROM customer ORDER BY customer.cu_id , customer.cu_name DESC , customer.cu_telephone DESC, customer.cu_fax , customer.cu_email DESC ;

-- query #5
SELECT SUM(invoice.in_total) , AVG(invoice.in_totalafterdiscount) , MAX(invoice.in_total) , COUNT(customer.cu_id) , SUM(invoicedetail.ind_qty) FROM customer , invoice , invoicedetail WHERE customer.cu_id = invoice.in_cu_id AND invoice.in_id = invoicedetail.ind_in_id GROUP BY invoice.in_id ;

-- query #6
SELECT SUM(invoice.in_total) , AVG(invoice.in_totalafterdiscount) , MAX(invoice.in_total) , COUNT(customer.cu_id) , SUM(invoicedetail.ind_qty) FROM customer , invoice , invoicedetail
WHERE customer.cu_id = invoice.in_cu_id AND invoice.in_id = invoicedetail.ind_in_id GROUP BY invoice.in_id HAVING COUNT(invoice.in_id)>0 AND SUM(invoice.in_total) = AVG(invoice.in_totalafterdiscount) ;

-- query #7
SELECT customer.cu_name FROM customer WHERE customer.cu_name = (SELECT users.us_name FROM users WHERE users.us_class = 'administrator') AND customer.cu_fax = (SELECT supplier.su_fax FROM supplier WHERE supplier.su_phone = '123456') AND customer.cu_email = (SELECT supplier.su_email FROM supplier WHERE supplier.su_address LIKE '%h%') ;
