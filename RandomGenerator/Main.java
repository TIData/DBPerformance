import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Formatter;
import java.util.Random;
import java.util.Scanner;

/**
 * Created by sebastiaan on 24/04/2017.
 */
public class Main {

    public static final String OUTPUT_DIR = "output";
    public static final int AMOUNT = 1000000;
    private Random random = new Random();

    public static void main(String[] args) {
        new Main().generateTables();
    }

    public void generateTables() {
        generateCategory();
        generateCustomer();
        generateInvoice();
        generateLocation();
        generateUser();
        generateSupplier();
        generateReciept();
        generatePurchaseOrder();
        generateItem();
        generateInvoiceDetail();
        generateMovement();
        generateMovementDetails();
        generatePurchaseOrderDetails();
    }

    private void generatePurchaseOrderDetails() {
        try {
            FileOutputStream fos = new FileOutputStream(OUTPUT_DIR + "/" + "13purchaseorderdetails.sql");
            Formatter formatter = new Formatter(fos);
            for(int i = 0; i < AMOUNT; i++) {
                formatter.format("insert into purchaseorder_details (pod_po_id, pod_it_id, pod_qtity, pod_remainingqtity) values (%d, %d, %d, %d);\n", i+1,i+1, generateInt(), generateInt());
            }
            formatter.flush();
            formatter.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
        }
    }

    private void generateMovementDetails() {
        try {
            FileOutputStream fos = new FileOutputStream(OUTPUT_DIR + "/" + "12movementdetails.sql");
            Formatter formatter = new Formatter(fos);
            for(int i = 0; i < AMOUNT; i++) {
                formatter.format("insert into movement_details (mod_mo_id, mod_it_id, mod_qtity, mod_fromlocation, mod_tolocation) values (%d, %d, %d, '%s', '%s');\n", i+1,i+1, generateInt(), generateVarChar(), generateVarChar());
            }
            formatter.flush();
            formatter.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
        }
    }

    private void generateMovement() {
        try {
            FileOutputStream fos = new FileOutputStream(OUTPUT_DIR + "/" + "11movement.sql");
            Formatter formatter = new Formatter(fos);
            for(int i = 0; i < AMOUNT; i++) {
                formatter.format("insert into movement (mo_us_id, mo_description, mo_date) values (%d, '%s', '%s');\n", i+1,generateVarChar(), generateDate());
            }
            formatter.flush();
            formatter.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
        }
    }

    private void generateInvoiceDetail() {
        try {
            FileOutputStream fos = new FileOutputStream(OUTPUT_DIR + "/" + "10invoicedetail.sql");
            Formatter formatter = new Formatter(fos);
            for(int i = 0; i < AMOUNT; i++) {
                formatter.format("insert into invoicedetail (ind_in_id, ind_it_id, ind_qty, ind_total) values (%d, %d, %d, %f);\n", i+1, i+1, generateInt(), generateDouble());
            }
            formatter.flush();
            formatter.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
        }
    }

    private void generateItem() {
        try {
            FileOutputStream fos = new FileOutputStream(OUTPUT_DIR + "/" + "9item.sql");
            Formatter formatter = new Formatter(fos);
            for(int i = 0; i < AMOUNT; i++) {
                formatter.format("insert into item (it_ca_id, it_lo_id, it_serialnumber, it_code, it_barcode, it_expirydate, it_description, it_manufacturer, it_price, it_qtity) values (%d, %d, '%s', '%s', '%s', '%s', '%s', '%s', %f, %d);\n", i+1, i+1, generateVarChar(), generateVarChar(), generateVarCharShort(), generateDate(), generateVarChar(), generateVarChar(), generateDouble(), generateInt());
            }
            formatter.flush();
            formatter.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
        }
    }

    private String generateVarCharShort() {
        char[] chars = "abcdefghijklmnopqrstuvwxyz".toCharArray();
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < random.nextInt(10); i++) {
            char c = chars[random.nextInt(chars.length)];
            sb.append(c);
        }
        String output = sb.toString();
        return output;
    }

    private void generatePurchaseOrder() {
        try {
            FileOutputStream fos = new FileOutputStream(OUTPUT_DIR + "/" + "8purchaseorder.sql");
            Formatter formatter = new Formatter(fos);
            for(int i = 0; i < AMOUNT; i++) {
                formatter.format("insert into purchaseorder (po_us_id, po_su_id, po_description, po_dateofissue, po_recievedate, po_status) values (%d, %d, '%s', '%s', '%s', '%s');\n", i+1, i+1, generateVarChar(), generateDate(), generateDate(), generateVarChar());
            }
            formatter.flush();
            formatter.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
        }
    }

    private void generateReciept() {
        try {
            FileOutputStream fos = new FileOutputStream(OUTPUT_DIR + "/" + "7reciept.sql");
            Formatter formatter = new Formatter(fos);
            for(int i = 0; i < AMOUNT; i++) {
                formatter.format("insert into reciept (re_cu_id, re_date, re_amount, re_modeofpayment, re_checknumber, re_bank) values (%d, '%s', %d, '%s', '%s', '%s');\n", i+1, generateDate(), generateInt(), generateVarChar(), generateVarChar(), generateVarChar(), generateVarChar());
            }
            formatter.flush();
            formatter.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
        }
    }

    private int generateInt() {
        return random.nextInt(10000);
    }

    private void generateSupplier() {
        try {
            FileOutputStream fos = new FileOutputStream(OUTPUT_DIR + "/" + "6supplier.sql");
            Formatter formatter = new Formatter(fos);
            for(int i = 0; i < AMOUNT; i++) {
                formatter.format("insert into supplier (su_name, su_phone, su_address, su_fax, su_email) values ('%s', '%s', '%s', '%s', '%s');\n", generateVarChar(), generateVarChar(), generateVarChar(), generateVarChar(), generateVarChar());
            }
            formatter.flush();
            formatter.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
        }
    }

    private void generateUser() {
        try {
            FileOutputStream fos = new FileOutputStream(OUTPUT_DIR + "/" + "5user.sql");
            Formatter formatter = new Formatter(fos);
            for(int i = 0; i < AMOUNT; i++) {
                formatter.format("insert into users (us_code, us_name, us_password, us_class) values ('%s', '%s', '%s', '%s');\n", generateVarChar(), generateVarChar(), generateVarChar(), generateVarChar());
            }
            formatter.flush();
            formatter.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
        }
    }

    private void generateLocation() {
        try {
            FileOutputStream fos = new FileOutputStream(OUTPUT_DIR + "/" + "4location.sql");
            Formatter formatter = new Formatter(fos);
            for(int i = 0; i < AMOUNT; i++) {
                formatter.format("insert into location (lo_description, lo_code) values ('%s', '%s');\n", generateVarChar(), generateVarChar());
            }
            formatter.flush();
            formatter.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
        }
    }

    private void generateInvoice() {
        try {
            FileOutputStream fos = new FileOutputStream(OUTPUT_DIR + "/" + "3invoice.sql");
            Formatter formatter = new Formatter(fos);
            for(int i = 0; i < AMOUNT; i++) {
                formatter.format("insert into invoice (in_cu_id, in_date, in_description, in_total, in_discount, in_totalafterdiscount) values (%d, '%s', '%s', %f, %f, %f);\n", i+1, generateDate(), generateVarChar(), generateDouble(), generateDouble(), generateDouble());
            }
            formatter.flush();
            formatter.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
        }
    }

    private double generateDouble() {
        return random.nextInt(50000) + 0.23;
    }

    private String generateDate() {
        //return "2016-10-24";
        return String.format("%d-%d-%d", random.nextInt(20) + 1990, random.nextInt(11) + 1, random.nextInt(20) + 1);
    }

    private void generateCustomer() {
        try {
            FileOutputStream fos = new FileOutputStream(OUTPUT_DIR + "/" + "2customer.sql");
            Formatter formatter = new Formatter(fos);
            for(int i = 0; i < AMOUNT; i++) {
                formatter.format("insert into customer (cu_name, cu_telephone, cu_fax, cu_email) values ('%s', '%s', '%s', '%s');\n", generateVarChar(), generateVarChar(), generateVarChar(), generateVarChar());
            }
            formatter.flush();
            formatter.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
        }
    }

    private String generateVarChar() {
        char[] chars = "abcdefghijklmnopqrstuvwxyz".toCharArray();
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < random.nextInt(40) + 10; i++) {
            char c = chars[random.nextInt(chars.length)];
            sb.append(c);
        }
        String output = sb.toString();
        return output;
    }

    private void generateCategory() {
        try {
            FileOutputStream fos = new FileOutputStream(OUTPUT_DIR + "/" + "1category.sql");
            Formatter formatter = new Formatter(fos);
            for(int i = 0; i < AMOUNT; i++) {
                formatter.format("insert into category (ca_description, ca_code) values ('%s', '%s');\n", generateVarChar(), generateVarChar());
            }
            formatter.flush();
            formatter.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
        }

    }


}
