package swust.service.impl;

import java.io.File;
import java.io.FileInputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;

import swust.dao.EmployeeDao;
import swust.dao.ProductDao;
import swust.dao.ProductInstockBillDao;
import swust.dao.WareHouseDao;
import swust.model.Employee;
import swust.model.Product;
import swust.model.ProductInstockBill;
import swust.model.WareHouse;
import swust.service.ProductInstockBillService;

public class ProductInstockBillServiceImpl implements ProductInstockBillService {
	private ProductInstockBillDao productInstockBillDao;
	private ProductDao productDao;
	private EmployeeDao employeeDao;
	private WareHouseDao wareHouseDao;

	@Override
	public List<ProductInstockBill> getAllProductInstockBills() {
		List<ProductInstockBill> productInstockBills = productInstockBillDao
				.getAllProductInstockBills();
		return productInstockBills;
	}

	@Override
	public List<ProductInstockBill> getBillNoByOnly() {
		List<ProductInstockBill> productInstockBills = productInstockBillDao
				.getBillNoByOnly();
		return productInstockBills;
	}

	@Override
	public void addProductInstockBill(ProductInstockBill productInstockBill) {
		productInstockBillDao.addProductInstockBill(productInstockBill);
	}

	@Override
	public void delProductInstockBill(Integer id) {
		productInstockBillDao.delProductInstockBill(id);
	}

	@Override
	public void updateProductInstockBill(ProductInstockBill productInstockBill) {
		productInstockBillDao.updateProductInstockBill(productInstockBill);
	}

	@Override
	public void updateProductInstockBillProduct(
			ProductInstockBill productInstockBill) {
		productInstockBillDao
				.updateProductInstockBillProduct(productInstockBill);

	}

	@Override
	public void addToupdateProductInstockBill(
			ProductInstockBill productInstockBill) {
		productInstockBillDao.addToupdateProductInstockBill(productInstockBill);

	}

	@Override
	public ProductInstockBill getProductInstockBill(Integer id) {
		return productInstockBillDao.getProductInstockBill(id);
	}

	public ProductInstockBillDao getProductInstockBillDao() {
		return productInstockBillDao;
	}

	public void setProductInstockBillDao(
			ProductInstockBillDao productInstockBillDao) {
		this.productInstockBillDao = productInstockBillDao;
	}

	public ProductDao getProductDao() {
		return productDao;
	}

	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}

	@Override
	public List<ProductInstockBill> getProductInstockBillByBillState(Integer id) {
		List<ProductInstockBill> productInstockBills = productInstockBillDao
				.getProductInstockBillByBillState(id);
		return productInstockBills;
	}

	@Override
	public List<ProductInstockBill> getSimpleByBillNo(String billNo) {
		List<ProductInstockBill> productInstockBills = productInstockBillDao
				.getSimpleByBillNo(billNo);
		return productInstockBills;
	}

	@Override
	public List<Product> getProductDistinct(String billNo) {
		List<Product> products = productInstockBillDao
				.getProductDistinct(billNo);
		return products;
	}

	@Override
	public void addToProductCheck(ProductInstockBill productInstockBill) {
		productInstockBillDao.addToProductCheck(productInstockBill);
	}

	// 实现导入
	public void importExcel(File billproductExcel,
			String billproductExcelFileName) {

		try {
			System.out.println("importservice2");
			FileInputStream fileInputStream = new FileInputStream(
					billproductExcel);
			// 正则表达式判断excel为03版本 ^开始 $结束 ?i 忽略大小写 xls 后缀名 \\.最后. 03版本后缀为xls 07版本
			// xlsx
			boolean is03Excel = billproductExcelFileName
					.matches("^.+\\.(?i)(xls)$");
			// 1、读取工作簿
			Workbook workbook = new HSSFWorkbook(fileInputStream);
			// 2、读取工作表
			Sheet sheet = workbook.getSheetAt(0);

			Employee employee = employeeDao.getEmployee(1);
			System.out.println(employee);
			// 3、读取行
			if (sheet.getPhysicalNumberOfRows() > 2) {
				ProductInstockBill productInstockBill = null;
				for (int k = 2; k < sheet.getPhysicalNumberOfRows(); k++) {
					// 4、读取单元格
					Row row = sheet.getRow(k);
					productInstockBill = new ProductInstockBill();
					// 用户名
					Cell cell0 = row.getCell(0);
					productInstockBill.setBillNo(cell0.getStringCellValue());

					// 帐号
					if (row.getCell(1) != null) {
						row.getCell(1).setCellType(Cell.CELL_TYPE_STRING);
						System.out.println(row.getCell(1).getStringCellValue());
						Employee employee2 = employeeDao.getEmployee(Integer
								.parseInt(row.getCell(1).getStringCellValue()));
						productInstockBill.setEmployee(employee2);
					}

					// 所属部门
					if (row.getCell(2) != null) {
						row.getCell(2).setCellType(Cell.CELL_TYPE_STRING);
						WareHouse wareHouse = wareHouseDao.getWareHouse(Integer
								.parseInt(row.getCell(2).getStringCellValue()));
						productInstockBill.setWareHouse(wareHouse);
					}

					if (row.getCell(3) != null) {
						row.getCell(3).setCellType(Cell.CELL_TYPE_STRING);
						String s = row.getCell(3).getStringCellValue();
						System.out.println(s);
						Date date = new SimpleDateFormat("yyyy-MM-dd").parse(s);
						productInstockBill.setBillTime(date);
					}

					if (row.getCell(4) != null) {
						row.getCell(4).setCellType(Cell.CELL_TYPE_STRING);
						productInstockBill.setProductSource(Integer
								.parseInt(row.getCell(4).getStringCellValue()));
					}

					if (row.getCell(5) != null) {
						row.getCell(5).setCellType(Cell.CELL_TYPE_STRING);
						productInstockBill.setBillState(Integer.parseInt(row
								.getCell(5).getStringCellValue()));
					}

					if (row.getCell(6) != null) {
						row.getCell(6).setCellType(Cell.CELL_TYPE_STRING);
						Product product = productDao.getProduct(Integer
								.parseInt(row.getCell(6).getStringCellValue()));
						productInstockBill.setProduct(product);
					}

					if (row.getCell(7) != null) {
						row.getCell(7).setCellType(Cell.CELL_TYPE_STRING);
						productInstockBill.setQuantity(Integer.parseInt(row
								.getCell(7).getStringCellValue()));
					}

					addProductInstockBill(productInstockBill);
					System.out.println("执行！！！");
				}
			}

			fileInputStream.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public EmployeeDao getEmployeeDao() {
		return employeeDao;
	}

	public void setEmployeeDao(EmployeeDao employeeDao) {
		this.employeeDao = employeeDao;
	}

	public WareHouseDao getWareHouseDao() {
		return wareHouseDao;
	}

	public void setWareHouseDao(WareHouseDao wareHouseDao) {
		this.wareHouseDao = wareHouseDao;
	}

}
