USE uniDB;

CREATE TABLE category (
ca_id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
ca_description varchar(50) default NULL,
ca_code varchar(50) default NULL
)

CREATE TABLE customer (
cu_id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
cu_name varchar(50) default NULL,
cu_telephone varchar(50) default NULL,
cu_fax varchar(50) default NULL,
cu_email varchar(50) default NULL
)

CREATE TABLE invoice (
in_id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
in_cu_id int default NULL,
in_date datetime default NULL,
in_description char(50) default NULL,
in_total int default NULL,
in_discount char(50) default NULL,
in_totalafterdiscount int default NULL,
-- KEY `in_cu_id` (`in_cu_id`)
CONSTRAINT AK_TransactionID UNIQUE(in_cu_id)
)

CREATE TABLE invoicedetail (
ind_id int NOT NULL IDENTITY(1,1) PRIMARY KEY,
ind_in_id int default NULL,
ind_it_id int default NULL,
ind_qty int default NULL,
-- de default grootte voor t-sql is float maar we forcen het hier toch
ind_total float(53) default NULL,
CONSTRAINT ind_in_id UNIQUE(ind_in_id),
CONSTRAINT ind_it_id UNIQUE(ind_it_id)
)

CREATE TABLE item (
it_id int NOT NULL IDENTITY(1,1) PRIMARY KEY,
it_ca_id int default NULL,
it_lo_id int default NULL,
it_serialnumber char(50) default NULL,
it_code char(50) default NULL,
it_barcode char(10) default NULL,
it_expirydate datetime default NULL,
it_description char(50) default NULL,
it_manufacturer char(50) default NULL,
it_price float(53) default NULL,
it_qtity int default NULL,
CONSTRAINT it_ca_id UNIQUE(it_ca_id),
CONSTRAINT it_lo_id UNIQUE(it_lo_id)
)

CREATE TABLE location (
lo_id int NOT NULL IDENTITY(1,1) PRIMARY KEY,
lo_description varchar(50) default NULL,
lo_code varchar(50) default NULL
)

CREATE TABLE movement (
mo_id int NOT NULL IDENTITY(1,1) PRIMARY KEY,
mo_us_id int default NULL,
mo_description char(50) default NULL,
mo_date datetime default NULL,
CONSTRAINT mo_us_id UNIQUE(mo_us_id)
)

CREATE TABLE movement_details (
mod_id int NOT NULL IDENTITY(1,1) PRIMARY KEY,
mod_mo_id int default NULL,
mod_it_id int default NULL,
mod_qtity int default NULL,
mod_fromlocation char(50) default NULL,
mod_tolocation char(50) default NULL,
CONSTRAINT mod_it_id UNIQUE(mod_it_id),
CONSTRAINT mod_mo_id UNIQUE(mod_mo_id)
)

CREATE TABLE purchaseorder (
po_id int NOT NULL IDENTITY(1,1) PRIMARY KEY,
po_us_id int default NULL,
po_su_id int default NULL,
po_description char(50) default NULL,
po_dateofissue datetime default NULL,
po_recievedate datetime default NULL,
po_status char(50) default NULL,
CONSTRAINT po_us_id UNIQUE (po_us_id),
CONSTRAINT po_su_id UNIQUE (po_su_id)
)

CREATE TABLE purchaseorder_details (
pod_id int NOT NULL IDENTITY(1,1) PRIMARY KEY,
pod_po_id int default NULL,
pod_it_id int default NULL,
pod_qtity int default NULL,
pod_remainingqtity int default NULL,
CONSTRAINT pod_po_id UNIQUE(pod_po_id),
CONSTRAINT pod_it_id UNIQUE(pod_it_id)
)

CREATE TABLE reciept (
re_id int NOT NULL IDENTITY(1,1) PRIMARY KEY,
re_cu_id int default NULL,
re_date datetime default NULL,
re_amount int default NULL,
re_modeofpayment varchar(50) default NULL,
re_checknumber varchar(50) default NULL,
re_bank varchar(50) default NULL,
CONSTRAINT re_cu_id UNIQUE(re_cu_id)
)

CREATE TABLE stockcount (
st_id int NOT NULL IDENTITY(1,1) PRIMARY KEY,
st_us_id int default NULL,
st_description varchar(50) default NULL,
st_date datetime default NULL,
st_status varchar(50) default NULL,
CONSTRAINT st_us_id UNIQUE(st_us_id)
)

CREATE TABLE stockcount_details (
std_id int NOT NULL IDENTITY(1,1) PRIMARY KEY,
std_st_id int default NULL,
std_it_id int default NULL,
std_qtity int default NULL,
std_remainingqtity int default NULL,
CONSTRAINT std_st_id UNIQUE(std_st_id),
CONSTRAINT std_it_id UNIQUE(std_it_id)
)

CREATE TABLE supplier (
su_id int NOT NULL IDENTITY(1,1) PRIMARY KEY,
su_name varchar(50) default NULL,
su_phone varchar(50) default NULL,
su_address varchar(50) default NULL,
su_fax varchar(50) default NULL,
su_email varchar(50) default NULL
)

CREATE TABLE users (
us_id int NOT NULL IDENTITY(1,1) PRIMARY KEY,
us_code varchar(50) default NULL,
us_name varchar(50) default NULL,
us_password varchar(50) default NULL,
us_class varchar(50) default NULL,
)

ALTER TABLE invoice
ADD FOREIGN KEY (in_cu_id) REFERENCES customer (cu_id);
ALTER TABLE invoicedetail
ADD FOREIGN KEY (ind_it_id) REFERENCES item (it_id),
FOREIGN KEY (ind_in_id) REFERENCES invoice (in_id);
ALTER TABLE item
ADD FOREIGN KEY (it_ca_id) REFERENCES category (ca_id),
FOREIGN KEY (it_lo_id) REFERENCES location (lo_id);
ALTER TABLE movement
ADD FOREIGN KEY (mo_us_id) REFERENCES users (us_id);
ALTER TABLE movement_details
ADD FOREIGN KEY (mod_mo_id) REFERENCES movement (mo_id),
FOREIGN KEY (mod_it_id) REFERENCES item (it_id);
ALTER TABLE purchaseorder
ADD FOREIGN KEY (po_su_id) REFERENCES supplier (su_id),
FOREIGN KEY (po_us_id) REFERENCES users (us_id);
ALTER TABLE purchaseorder_details
ADD FOREIGN KEY (pod_po_id) REFERENCES purchaseorder (po_id),
FOREIGN KEY (pod_it_id) REFERENCES item (it_id);
ALTER TABLE reciept
ADD FOREIGN KEY (re_cu_id) REFERENCES customer (cu_id);
ALTER TABLE stockcount
ADD FOREIGN KEY (st_us_id) REFERENCES users (us_id);
ALTER TABLE stockcount_details
ADD FOREIGN KEY (std_st_id) REFERENCES stockcount (st_id),
FOREIGN KEY (std_it_id) REFERENCES item (it_id);