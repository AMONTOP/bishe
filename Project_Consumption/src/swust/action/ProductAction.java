package swust.action;

import java.io.File;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts2.ServletActionContext;

import swust.model.Product;
import swust.model.ProductCategory;
import swust.model.ProductMaterial;
import swust.service.ProductCategoryService;
import swust.service.ProductMaterialService;
import swust.service.ProductService;

public class ProductAction extends BaseAction {
	private ProductService productService;
	private ProductCategoryService productCategoryService;
	private ProductMaterialService productMaterialService;
	private List<ProductMaterial> listProductMaterials;
	private List<Product> list;
	private List<ProductCategory> listCategory;
	private Product product;
	private int id;
	private String productName;
	private String[] selectedRow;
	private File productExcel;
	private String productExcelContentType;
	private String productExcelFileName;

	public String show() {
		list = productService.getAllProducts();
		// listCategory = productCategoryService.getAllProductCategorys();
		// getRequest().put("listCategory",productCategoryService.getAllProductCategorys());
		return "zhanshi";
	}

	public String show2() {
		list = productService.getAllProducts();
		return "zhanshi2";
	}

	public String showPM() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String productId = request.getParameter("productId");
		System.out.println(productId);
		listProductMaterials = productMaterialService.getPMByProductId(Integer
				.parseInt(productId));
		return "zhanshitable";
	}

	public String delete() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String productId = reqeust.getParameter("productId");// 字符串
		productService.delProduct(Integer.parseInt(productId));
		return "find";
	}

	public String prepup() {
		HttpServletRequest reqeust = ServletActionContext.getRequest();
		String productId = reqeust.getParameter("productId");// 字符串
		System.out.println(productId);
		product = productService.getProduct(Integer.parseInt(productId));
		getRequest().put("listCategory",
				productCategoryService.getAllProductCategorys());
		return "prepup";
	}

	public String findbyName() {
		list = productService.getProductByName(product.getProductName());
		return "zhanshi";
	}

	public String addPre() {
		getRequest().put("listCategory",
				productCategoryService.getAllProductCategorys());
		return "addPre";
	}

	// 增加
	public String save() {
		productService.addProduct(product);
		return "find";
	}

	// 修改
	public String update() {
		productService.updateProduct(product);
		return "find";
	}

	// 导出excel
	public void export2Excel() {
		try {
			HSSFWorkbook workbook = new HSSFWorkbook();
			HSSFSheet sheet = workbook.createSheet();
			HSSFRow row_title = sheet.createRow(0);
			HSSFCell cell_title1 = row_title.createCell(0);
			HSSFCell cell_title2 = row_title.createCell(1);
			HSSFCell cell_title3 = row_title.createCell(2);
			HSSFCell cell_title4 = row_title.createCell(3);
			HSSFCell cell_title5 = row_title.createCell(4);
			HSSFCell cell_title6 = row_title.createCell(5);
			cell_title1.setCellValue("货品编号");
			cell_title2.setCellValue("货品名称");
			cell_title3.setCellValue("计量单位");
			cell_title4.setCellValue("货品类别");
			cell_title5.setCellValue("规格");
			cell_title6.setCellValue("价格");

			// List<Product> products = productService.getAllProducts();
			for (int i = 0; i < selectedRow.length; i++) {
				// int a = selectedRow[
				Product product = productService.getProduct(Integer
						.parseInt(selectedRow[i]));
				HSSFRow row = sheet.createRow(i + 1);
				HSSFCell cell1 = row.createCell(0);
				HSSFCell cell2 = row.createCell(1);
				HSSFCell cell3 = row.createCell(2);
				HSSFCell cell4 = row.createCell(3);
				HSSFCell cell5 = row.createCell(4);
				HSSFCell cell6 = row.createCell(5);
				cell1.setCellValue(product.getProductNo());
				cell2.setCellValue(product.getProductName());
				cell3.setCellValue(product.getUnit());
				cell4.setCellValue(product.getProductCategory()
						.getCategoryName());
				cell5.setCellValue(product.getSpec());
				cell6.setCellValue(String.valueOf(product.getPrice()));
			}
			HttpServletResponse response = ServletActionContext.getResponse();
			// 把响应头数据类型设置为任意二进制流，用于上传下载
			response.setContentType("application/octet-stream");
			// 告诉浏览器通过下载方式打开，并设置下载文件名
			response.setHeader("Content-Disposition", "attachment;fileName="//
					+ new String("产品信息.xls".getBytes(), "ISO8859-1"));
			ServletOutputStream sos = response.getOutputStream();
			workbook.write(sos);
			if (sos != null) {
				sos.close();
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 导入用户列表
	public String importExcel() {
		// 1、获取excel文件
		System.out.println("执行import");
		System.out.println(productExcel);
		if (productExcel != null) {
			// 是否是excel ^开始 .+任意字符串 $结束 ?i 忽略大小写 xls | xlsx 后缀名 \\.表示最后.
			if (productExcelFileName.matches("^.+\\.(?i)((xls)|(xlsx))$")) {
				// 2、导入
				productService.importExcel(productExcel, productExcelFileName);
			}
		}
		return "find";
	}

	public ProductService getProductService() {
		return productService;
	}

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	public ProductCategoryService getProductCategoryService() {
		return productCategoryService;
	}

	public void setProductCategoryService(
			ProductCategoryService productCategoryService) {
		this.productCategoryService = productCategoryService;
	}

	public List<Product> getList() {
		return list;
	}

	public void setList(List<Product> list) {
		this.list = list;
	}

	public List<ProductCategory> getListCategory() {
		return listCategory;
	}

	public void setListCategory(List<ProductCategory> listCategory) {
		this.listCategory = listCategory;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String[] getSelectedRow() {
		return selectedRow;
	}

	public void setSelectedRow(String[] selectedRow) {
		this.selectedRow = selectedRow;
	}

	public File getProductExcel() {
		return productExcel;
	}

	public void setProductExcel(File productExcel) {
		this.productExcel = productExcel;
	}

	public String getProductExcelContentType() {
		return productExcelContentType;
	}

	public void setProductExcelContentType(String productExcelContentType) {
		this.productExcelContentType = productExcelContentType;
	}

	public String getProductExcelFileName() {
		return productExcelFileName;
	}

	public void setProductExcelFileName(String productExcelFileName) {
		this.productExcelFileName = productExcelFileName;
	}

	public ProductMaterialService getProductMaterialService() {
		return productMaterialService;
	}

	public void setProductMaterialService(
			ProductMaterialService productMaterialService) {
		this.productMaterialService = productMaterialService;
	}

	public List<ProductMaterial> getListProductMaterials() {
		return listProductMaterials;
	}

	public void setListProductMaterials(
			List<ProductMaterial> listProductMaterials) {
		this.listProductMaterials = listProductMaterials;
	}

}
