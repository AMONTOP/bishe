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
import swust.dao.MaterialInstockBillDao;
import swust.dao.MwareHouseDao;
import swust.model.Employee;
import swust.model.Material;
import swust.model.MaterialInstockBill;
import swust.model.MwareHouse;
import swust.service.MaterialInstockBillService;

public class MaterialInstockBillServiceImpl implements
		MaterialInstockBillService {
	private MaterialInstockBillDao materialInstockBillDao;
	private MaterialDao materialDao;
	private EmployeeDao employeeDao;
	private MwareHouseDao mwareHouseDao;

	@Override
	public List<MaterialInstockBill> getAllMaterialInstockBills() {
		List<MaterialInstockBill> materialInstockBills = materialInstockBillDao
				.getAllMaterialInstockBills();
		return materialInstockBills;
	}

	@Override
	public List<MaterialInstockBill> getBillNoByOnly() {
		List<MaterialInstockBill> materialInstockBills = materialInstockBillDao
				.getBillNoByOnly();
		return materialInstockBills;
	}

	@Override
	public void addMaterialInstockBill(MaterialInstockBill materialInstockBill) {
		materialInstockBillDao.addMaterialInstockBill(materialInstockBill);
	}

	@Override
	public void delMaterialInstockBill(Integer id) {
		materialInstockBillDao.delMaterialInstockBill(id);
	}

	@Override
	public void updateMaterialInstockBill(
			MaterialInstockBill materialInstockBill) {
		materialInstockBillDao.updateMaterialInstockBill(materialInstockBill);
	}

	@Override
	public void updateMaterialInstockBillMaterial(
			MaterialInstockBill materialInstockBill) {
		materialInstockBillDao
				.updateMaterialInstockBillMaterial(materialInstockBill);

	}

	@Override
	public void addToupdateMaterialInstockBill(
			MaterialInstockBill materialInstockBill) {
		materialInstockBillDao
				.addToupdateMaterialInstockBill(materialInstockBill);

	}

	@Override
	public MaterialInstockBill getMaterialInstockBill(Integer id) {
		return materialInstockBillDao.getMaterialInstockBill(id);
	}

	public void addToMaterialCheck(MaterialInstockBill materialInstockBill) {
		materialInstockBillDao.addToMaterialCheck(materialInstockBill);
	}

	public MaterialInstockBillDao getMaterialInstockBillDao() {
		return materialInstockBillDao;
	}

	public void setMaterialInstockBillDao(
			MaterialInstockBillDao materialInstockBillDao) {
		this.materialInstockBillDao = materialInstockBillDao;
	}

	public MaterialDao getMaterialDao() {
		return materialDao;
	}

	public void setMaterialDao(MaterialDao materialDao) {
		this.materialDao = materialDao;
	}

	@Override
	public List<MaterialInstockBill> getMaterialInstockBillByBillState(
			Integer id) {
		List<MaterialInstockBill> materialInstockBills = materialInstockBillDao
				.getMaterialInstockBillByBillState(id);
		return materialInstockBills;
	}

	@Override
	public List<MaterialInstockBill> getSimpleByBillNo(String billNo) {
		List<MaterialInstockBill> materialInstockBills = materialInstockBillDao
				.getSimpleByBillNo(billNo);
		return materialInstockBills;
	}

	@Override
	public List<Material> getMaterialDistinct(String billNo) {
		List<Material> materials = materialInstockBillDao
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
				MaterialInstockBill materialInstockBill = null;
				for (int k = 2; k < sheet.getPhysicalNumberOfRows(); k++) {
					// 4、读取单元格
					Row row = sheet.getRow(k);
					materialInstockBill = new MaterialInstockBill();
					// 用户名
					Cell cell0 = row.getCell(0);
					materialInstockBill.setBillNo(cell0.getStringCellValue());

					// 帐号
					if (row.getCell(1) != null) {
						row.getCell(1).setCellType(Cell.CELL_TYPE_STRING);
						System.out.println(row.getCell(1).getStringCellValue());
						Employee employee2 = employeeDao.getEmployee(Integer
								.parseInt(row.getCell(1).getStringCellValue()));
						materialInstockBill.setEmployee(employee2);
					}

					// 所属部门
					if (row.getCell(2) != null) {
						row.getCell(2).setCellType(Cell.CELL_TYPE_STRING);
						MwareHouse mwareHouse = mwareHouseDao
								.getMwareHouse(Integer.parseInt(row.getCell(2)
										.getStringCellValue()));
						materialInstockBill.setMwareHouse(mwareHouse);
					}

					if (row.getCell(3) != null) {
						row.getCell(3).setCellType(Cell.CELL_TYPE_STRING);
						String s = row.getCell(3).getStringCellValue();
						System.out.println(s);
						Date date = new SimpleDateFormat("yyyy-MM-dd").parse(s);
						materialInstockBill.setBillTime(date);
					}

					if (row.getCell(4) != null) {
						row.getCell(4).setCellType(Cell.CELL_TYPE_STRING);
						materialInstockBill.setMaterialSource(Integer
								.parseInt(row.getCell(4).getStringCellValue()));
					}

					if (row.getCell(5) != null) {
						row.getCell(5).setCellType(Cell.CELL_TYPE_STRING);
						materialInstockBill.setBillState(Integer.parseInt(row
								.getCell(5).getStringCellValue()));
					}

					if (row.getCell(6) != null) {
						row.getCell(6).setCellType(Cell.CELL_TYPE_STRING);
						Material material = materialDao.getMaterial(Integer
								.parseInt(row.getCell(6).getStringCellValue()));
						materialInstockBill.setMaterial(material);
					}

					if (row.getCell(7) != null) {
						row.getCell(7).setCellType(Cell.CELL_TYPE_STRING);
						materialInstockBill.setQuantity(Integer.parseInt(row
								.getCell(7).getStringCellValue()));
					}

					addMaterialInstockBill(materialInstockBill);
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

	public MwareHouseDao getMwareHouseDao() {
		return mwareHouseDao;
	}

	public void setMwareHouseDao(MwareHouseDao mwareHouseDao) {
		this.mwareHouseDao = mwareHouseDao;
	}

}
