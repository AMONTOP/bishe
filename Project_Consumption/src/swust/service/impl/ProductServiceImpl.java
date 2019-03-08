package swust.service.impl;

import java.io.File;
import java.io.FileInputStream;
import java.math.BigDecimal;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;

import swust.dao.ProductCategoryDao;
import swust.dao.ProductDao;
import swust.model.Product;
import swust.model.ProductCategory;
import swust.service.ProductService;

public class ProductServiceImpl implements ProductService {
	private ProductDao productDao;
	private ProductCategoryDao productCategoryDao;

	@Override
	public List<Product> getAllProducts() {
		List<Product> products = productDao.getAllProducts();
		List<ProductCategory> productCategories = productCategoryDao
				.getAllProductCategorys();
		return products;
	}

	@Override
	public void addProduct(Product product) {
		productDao.addProduct(product);
	}

	@Override
	public void delProduct(Integer id) {
		productDao.delProduct(id);
	}

	@Override
	public void updateProduct(Product product) {
		productDao.updateProduct(product);
	}

	@Override
	public Product getProduct(Integer id) {
		return productDao.getProduct(id);
	}

	@Override
	public List<Product> getProductByName(String productName) {
		return productDao.getProductByName(productName);
	}

	// 实现导入
	public void importExcel(File productExcel, String productExcelFileName) {
		try {
			System.out.println("importservice");
			FileInputStream fileInputStream = new FileInputStream(productExcel);
			// 正则表达式判断excel为03版本 ^开始 $结束 ?i 忽略大小写 xls 后缀名 \\.最后. 03版本后缀为xls 07版本
			// xlsx
			boolean is03Excel = productExcelFileName
					.matches("^.+\\.(?i)(xls)$");
			// 1、读取工作簿
			Workbook workbook = new HSSFWorkbook(fileInputStream);
			// 2、读取工作表
			Sheet sheet = workbook.getSheetAt(0);

			// 3、读取行
			if (sheet.getPhysicalNumberOfRows() > 2) {
				Product product = null;
				for (int k = 2; k < sheet.getPhysicalNumberOfRows(); k++) {
					// 4、读取单元格
					Row row = sheet.getRow(k);
					product = new Product();
					// 用户名
					Cell cell0 = row.getCell(0);
					product.setProductNo(cell0.getStringCellValue());

					// 帐号
					Cell cell1 = row.getCell(1);
					product.setProductName(cell1.getStringCellValue());
					// 所属部门
					Cell cell2 = row.getCell(2);
					product.setUnit(cell2.getStringCellValue());
					// 性别
					if (row.getCell(3) != null) {
						row.getCell(3).setCellType(Cell.CELL_TYPE_STRING);
						ProductCategory productCategory = productCategoryDao
								.getProductCategory(Integer.parseInt(row
										.getCell(3).getStringCellValue()));
						product.setProductCategory(productCategory);
					}

					// user.setGender(cell3.getStringCellValue().equals("男"));
					// char ch = cell3.getStringCellValue().charAt(0); //
					// 将获取的字符串转为字符
					// System.out.println(ch);
					// product.setGender(ch);

					Cell cell4 = row.getCell(4);
					product.setSpec(cell4.getStringCellValue());

					// Cell cell5 = row.getCell(5);
					row.getCell(5).setCellType(Cell.CELL_TYPE_STRING);
					BigDecimal bd = new BigDecimal(row.getCell(5)
							.getStringCellValue());
					product.setPrice(bd);

					addProduct(product);
					System.out.println("执行！！！");
				}
			}

			fileInputStream.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public ProductDao getProductDao() {
		return productDao;
	}

	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}

	public ProductCategoryDao getProductCategoryDao() {
		return productCategoryDao;
	}

	public void setProductCategoryDao(ProductCategoryDao productCategoryDao) {
		this.productCategoryDao = productCategoryDao;
	}

}
