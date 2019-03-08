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
import swust.dao.MaterialDao;
import swust.dao.MaterialOutstockBillDao;
import swust.dao.MwareHouseDao;
import swust.model.Employee;
import swust.model.Material;
import swust.model.MaterialOutstockBill;
import swust.model.MwareHouse;
import swust.service.MaterialOutstockBillService;

public class MaterialOutstockBillServiceImpl implements
		MaterialOutstockBillService {
	private MaterialOutstockBillDao materialOutstockBillDao;
	private MaterialDao materialDao;
	private EmployeeDao employeeDao;
	private MwareHouseDao mwareHouseDao;

	@Override
	public List<MaterialOutstockBill> getAllMaterialOutstockBills() {
		List<MaterialOutstockBill> materialOutstockBills = materialOutstockBillDao
				.getAllMaterialOutstockBills();
		return materialOutstockBills;
	}

	@Override
	public List<MaterialOutstockBill> getBillNoByOnly() {
		List<MaterialOutstockBill> materialOutstockBills = materialOutstockBillDao
				.getBillNoByOnly();
		return materialOutstockBills;
	}

	@Override
	public void addMaterialOutstockBill(
			MaterialOutstockBill materialOutstockBill) {
		materialOutstockBillDao.addMaterialOutstockBill(materialOutstockBill);
	}

	@Override
	public void delMaterialOutstockBill(Integer id) {
		materialOutstockBillDao.delMaterialOutstockBill(id);
	}

	@Override
	public void updateMaterialOutstockBill(
			MaterialOutstockBill materialOutstockBill) {
		materialOutstockBillDao
				.updateMaterialOutstockBill(materialOutstockBill);
	}

	@Override
	public void addToupdateMaterialOutstockBill(
			MaterialOutstockBill materialOutstockBill) {
		materialOutstockBillDao
				.addToupdateMaterialOutstockBill(materialOutstockBill);

	}

	@Override
	public List<MaterialOutstockBill> getSimpleByBillNo(String billNo) {
		List<MaterialOutstockBill> materialOutstockBills = materialOutstockBillDao
				.getSimpleByBillNo(billNo);
		return materialOutstockBills;
	}

	@Override
	public List<Material> getMaterialDistinct(String billNo) {
		List<Material> materials = materialOutstockBillDao
				.getMaterialDistinct(billNo);
		return materials;
	}

	// 实现导入
	public void importExcel(File billmaterialExcel,
			String billmaterialExcelFileName) {

		try {
			System.out.println("importservice2");
			FileInputStream fileInputStream = new FileInputStream(
					billmaterialExcel);
			// 正则表达式判断excel为03版本 ^开始 $结束 ?i 忽略大小写 xls 后缀名 \\.最后. 03版本后缀为xls 07版本
			// xlsx
			boolean is03Excel = billmaterialExcelFileName
					.matches("^.+\\.(?i)(xls)$");
			// 1、读取工作簿
			Workbook workbook = new HSSFWorkbook(fileInputStream);
			// 2、读取工作表
			Sheet sheet = workbook.getSheetAt(0);

			Employee employee = employeeDao.getEmployee(1);
			System.out.println(employee);
			// 3、读取行
			if (sheet.getPhysicalNumberOfRows() > 2) {
				MaterialOutstockBill materialOutstockBill = null;
				for (int k = 2; k < sheet.getPhysicalNumberOfRows(); k++) {
					// 4、读取单元格
					Row row = sheet.getRow(k);
					materialOutstockBill = new MaterialOutstockBill();
					// 用户名
					Cell cell0 = row.getCell(0);
					materialOutstockBill.setBillNo(cell0.getStringCellValue());

					// 帐号
					if (row.getCell(1) != null) {
						row.getCell(1).setCellType(Cell.CELL_TYPE_STRING);
						System.out.println(row.getCell(1).getStringCellValue());
						Employee employee2 = employeeDao.getEmployee(Integer
								.parseInt(row.getCell(1).getStringCellValue()));
						materialOutstockBill.setEmployee(employee2);
					}

					// 所属部门
					if (row.getCell(2) != null) {
						row.getCell(2).setCellType(Cell.CELL_TYPE_STRING);
						MwareHouse mwareHouse = mwareHouseDao
								.getMwareHouse(Integer.parseInt(row.getCell(2)
										.getStringCellValue()));
						materialOutstockBill.setMwareHouse(mwareHouse);
					}

					if (row.getCell(3) != null) {
						row.getCell(3).setCellType(Cell.CELL_TYPE_STRING);
						String s = row.getCell(3).getStringCellValue();
						System.out.println(s);
						Date date = new SimpleDateFormat("yyyy-MM-dd").parse(s);
						materialOutstockBill.setBillTime(date);
					}

					if (row.getCell(4) != null) {
						row.getCell(4).setCellType(Cell.CELL_TYPE_STRING);
						materialOutstockBill.setMaterialWhereabouts(Integer
								.parseInt(row.getCell(4).getStringCellValue()));
					}

					if (row.getCell(5) != null) {
						row.getCell(5).setCellType(Cell.CELL_TYPE_STRING);
						materialOutstockBill.setBillState(Integer.parseInt(row
								.getCell(5).getStringCellValue()));
					}

					if (row.getCell(6) != null) {
						row.getCell(6).setCellType(Cell.CELL_TYPE_STRING);
						Material material = materialDao.getMaterial(Integer
								.parseInt(row.getCell(6).getStringCellValue()));
						materialOutstockBill.setMaterial(material);
					}

					if (row.getCell(7) != null) {
						row.getCell(7).setCellType(Cell.CELL_TYPE_STRING);
						materialOutstockBill.setQuantity(Integer.parseInt(row
								.getCell(7).getStringCellValue()));
					}

					addMaterialOutstockBill(materialOutstockBill);
					System.out.println("执行！！！");
				}
			}

			fileInputStream.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public MaterialOutstockBill getMaterialOutstockBill(Integer id) {
		return materialOutstockBillDao.getMaterialOutstockBill(id);
	}

	public MaterialOutstockBillDao getMaterialOutstockBillDao() {
		return materialOutstockBillDao;
	}

	public void setMaterialOutstockBillDao(
			MaterialOutstockBillDao materialOutstockBillDao) {
		this.materialOutstockBillDao = materialOutstockBillDao;
	}

	@Override
	public List<MaterialOutstockBill> getMaterialOutstockBillByBillState(
			Integer id) {
		List<MaterialOutstockBill> materialOutstockBills = materialOutstockBillDao
				.getMaterialOutstockBillByBillState(id);
		return materialOutstockBills;
	}

	public MaterialDao getMaterialDao() {
		return materialDao;
	}

	public void setMaterialDao(MaterialDao materialDao) {
		this.materialDao = materialDao;
	}

	public EmployeeDao getEmployeeDao() {
		return employeeDao;
	}

	public void setEmployeeDao(EmployeeDao employeeDao) {
		this.employeeDao = employeeDao;
	}

	public MwareHouseDao getMwareHouseDao() {
		return mwareHouseDao;
	}

	public void setMwareHouseDao(MwareHouseDao mwareHouseDao) {
		this.mwareHouseDao = mwareHouseDao;
	}

	@Override
	public void updateMaterialOutstockBillMaterial(
			MaterialOutstockBill materialOutstockBill) {
		materialOutstockBillDao
				.updateMaterialOutstockBillMaterial(materialOutstockBill);

	}

}
