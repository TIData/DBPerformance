USE `uniDB`;
CREATE TABLE `category` (
`ca_id` int(11) NOT NULL auto_increment,
`ca_description` varchar(50) default NULL,
`ca_code` varchar(50) default NULL,
PRIMARY KEY (`ca_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE `customer` (
`cu_id` int(11) NOT NULL auto_increment,
`cu_name` varchar(50) default NULL,
`cu_telephone` varchar(50) default NULL,
`cu_fax` varchar(50) default NULL,
`cu_email` varchar(50) default NULL,
PRIMARY KEY (`cu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE `invoice` (
`in_id` int(11) NOT NULL auto_increment,
`in_cu_id` int(11) default NULL,
`in_date` datetime default NULL,
`in_description` char(50) default NULL,
`in_total` int(11) default NULL,
`in_discount` char(50) default NULL,
`in_totalafterdiscount` int(11) default NULL,
PRIMARY KEY (`in_id`),
KEY `in_cu_id` (`in_cu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=FIXED;
CREATE TABLE `invoicedetail` (
`ind_id` int(11) NOT NULL auto_increment,
`ind_in_id` int(11) default NULL,
`ind_it_id` int(11) default NULL,
`ind_qty` int(11) default NULL,
`ind_total` float(53,10) default NULL,
PRIMARY KEY (`ind_id`),
KEY `ind_in_id` (`ind_in_id`),
KEY `ind_it_id` (`ind_it_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE `item` (
`it_id` int(11) NOT NULL auto_increment,
`it_ca_id` int(11) default NULL,
`it_lo_id` int(11) default NULL,
`it_serialnumber` char(50) default NULL,
`it_code` char(50) default NULL,
`it_barcode` char(10) default NULL,
`it_expirydate` datetime default NULL,
`it_description` char(50) default NULL,
`it_manufacturer` char(50) default NULL,
`it_price` float(53,10) default NULL,
`it_qtity` int(11) default NULL,
PRIMARY KEY (`it_id`),
KEY `it_ca_id` (`it_ca_id`),
KEY `it_lo_id` (`it_lo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=FIXED;
CREATE TABLE `location` (
`lo_id` int(11) NOT NULL auto_increment,
`lo_description` varchar(50) default NULL,
`lo_code` varchar(50) default NULL,
PRIMARY KEY (`lo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE `movement` (
`mo_id` int(11) NOT NULL auto_increment,
`mo_us_id` int(11) default NULL,
`mo_description` char(50) default NULL,
`mo_date` datetime default NULL,
PRIMARY KEY (`mo_id`),
KEY `mo_us_id` (`mo_us_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=FIXED;
CREATE TABLE `movement_details` (
`mod_id` int(11) NOT NULL auto_increment,
`mod_mo_id` int(11) default NULL,
`mod_it_id` int(11) default NULL,
`mod_qtity` int(11) default NULL,
`mod_fromlocation` char(50) default NULL,
`mod_tolocation` char(50) default NULL,
PRIMARY KEY (`mod_id`),
KEY `mod_it_id` (`mod_it_id`),
KEY `mod_mo_id` (`mod_mo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=FIXED;
CREATE TABLE `purchaseorder` (
`po_id` int(11) NOT NULL auto_increment,
`po_us_id` int(11) default NULL,
`po_su_id` int(11) default NULL,
`po_description` char(50) default NULL,
`po_dateofissue` datetime default NULL,
`po_recievedate` datetime default NULL,
`po_status` char(50) default NULL,
PRIMARY KEY (`po_id`),
KEY `po_us_id` (`po_us_id`),
KEY `po_su_id` (`po_su_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=FIXED;
CREATE TABLE `purchaseorder_details` (
`pod_id` int(11) NOT NULL auto_increment,
`pod_po_id` int(11) default NULL,
`pod_it_id` int(11) default NULL,
`pod_qtity` int(11) default NULL,
`pod_remainingqtity` int(11) default NULL,
PRIMARY KEY (`pod_id`),
KEY `pod_po_id` (`pod_po_id`),
KEY `pod_it_id` (`pod_it_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE `reciept` (
`re_id` int(11) NOT NULL auto_increment,
`re_cu_id` int(11) default NULL,
`re_date` datetime default NULL,
`re_amount` int(11) default NULL,
`re_modeofpayment` varchar(50) default NULL,
`re_checknumber` varchar(50) default NULL,
`re_bank` varchar(50) default NULL,
PRIMARY KEY (`re_id`),
KEY `re_cu_id` (`re_cu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE `stockcount` (
`st_id` int(11) NOT NULL auto_increment,
`st_us_id` int(11) default NULL,
`st_description` varchar(50) default NULL,
`st_date` datetime default NULL,
`st_status` varchar(50) default NULL,
PRIMARY KEY (`st_id`),
KEY `st_us_id` (`st_us_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE `stockcount_details` (
`std_id` int(11) NOT NULL auto_increment,
`std_st_id` int(11) default NULL,
`std_it_id` int(11) default NULL,
`std_qtity` int(11) default NULL,
`std_remainingqtity` int(11) default NULL,
PRIMARY KEY (`std_id`),
KEY `std_st_id` (`std_st_id`),
KEY `std_it_id` (`std_it_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE `supplier` (
`su_id` int(11) NOT NULL auto_increment,
`su_name` varchar(50) default NULL,
`su_phone` varchar(50) default NULL,
`su_address` varchar(50) default NULL,
`su_fax` varchar(50) default NULL,
`su_email` varchar(50) default NULL,
PRIMARY KEY (`su_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE `users` (
`us_id` int(11) NOT NULL auto_increment,
`us_code` varchar(50) default NULL,
`us_name` varchar(50) default NULL,
`us_password` varchar(50) default NULL,
`us_class` varchar(50) default NULL,
PRIMARY KEY (`us_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
ALTER TABLE `invoice`
ADD FOREIGN KEY (`in_cu_id`) REFERENCES `customer` (`cu_id`);
ALTER TABLE `invoicedetail`
ADD FOREIGN KEY (`ind_it_id`) REFERENCES `item` (`it_id`),
ADD FOREIGN KEY (`ind_in_id`) REFERENCES `invoice` (`in_id`);
ALTER TABLE `item`
ADD FOREIGN KEY (`it_ca_id`) REFERENCES `category` (`ca_id`),
ADD FOREIGN KEY (`it_lo_id`) REFERENCES `location` (`lo_id`);
ALTER TABLE `movement`
ADD FOREIGN KEY (`mo_us_id`) REFERENCES `users` (`us_id`);
ALTER TABLE `movement_details`
ADD FOREIGN KEY (`mod_mo_id`) REFERENCES `movement` (`mo_id`),
ADD FOREIGN KEY (`mod_it_id`) REFERENCES `item` (`it_id`);
ALTER TABLE `purchaseorder`
ADD FOREIGN KEY (`po_su_id`) REFERENCES `supplier` (`su_id`),
ADD FOREIGN KEY (`po_us_id`) REFERENCES `users` (`us_id`);
ALTER TABLE `purchaseorder_details`
ADD FOREIGN KEY (`pod_po_id`) REFERENCES `purchaseorder` (`po_id`),
ADD FOREIGN KEY (`pod_it_id`) REFERENCES `item` (`it_id`);
ALTER TABLE `reciept`
ADD FOREIGN KEY (`re_cu_id`) REFERENCES `customer` (`cu_id`);
ALTER TABLE `stockcount`
ADD FOREIGN KEY (`st_us_id`) REFERENCES `users` (`us_id`);
ALTER TABLE `stockcount_details`
ADD FOREIGN KEY (`std_st_id`) REFERENCES `stockcount` (`st_id`),
ADD FOREIGN KEY (`std_it_id`) REFERENCES `item` (`it_id`);