package swust.service.impl;

import java.util.List;

import swust.dao.MwareHouseDao;
import swust.model.MwareHouse;
import swust.service.MwareHouseService;

public class MwareHouseServiceImpl implements MwareHouseService {
	private MwareHouseDao wareHouseDao;

	@Override
	public List<MwareHouse> getAllMwareHouses() {
		List<MwareHouse> wareHouses = wareHouseDao.getAllMwareHouses();
		return wareHouses;
	}

	@Override
	public void addMwareHouse(MwareHouse wareHouse) {
		wareHouseDao.addMwareHouse(wareHouse);
	}

	@Override
	public void delMwareHouse(Integer id) {
		wareHouseDao.delMwareHouse(id);
	}

	@Override
	public void updateMwareHouse(MwareHouse wareHouse) {
		wareHouseDao.updateMwareHouse(wareHouse);
	}

	@Override
	public MwareHouse getMwareHouse(Integer id) {
		return wareHouseDao.getMwareHouse(id);
	}

	@Override
	public List<MwareHouse> getMwareHouseByName(String wareNo) {
		return wareHouseDao.getMwareHouseByName(wareNo);
	}

	public MwareHouseDao getMwareHouseDao() {
		return wareHouseDao;
	}

	public void setMwareHouseDao(MwareHouseDao wareHouseDao) {
		this.wareHouseDao = wareHouseDao;
	}

	/*
	 * @Override public void export(Integer empId, String savePath) {
	 * List<MwareHouse> wareHouses = wareHouseDao.getAllMwareHouses(); String
	 * sheetName = "客户信息"; Vector<String> columnNames = new Vector<String>();
	 * columnNames.add("客户名称"); columnNames.add("联系人"); columnNames.add("联系电话");
	 * columnNames.add("创建日期"); columnNames.add("创建人"); Vector<String>
	 * reallyColumnNames = new Vector<String>();
	 * reallyColumnNames.add("wareNo"); reallyColumnNames.add("contact");
	 * reallyColumnNames.add("contactPhone"); reallyColumnNames.add("createAt");
	 * reallyColumnNames.add("empId");
	 * 
	 * JxlUtil<MwareHouse> export = new JxlUtil<MwareHouse>();
	 * export.toExcel(savePath, sheetName, columnNames, reallyColumnNames,
	 * wareHouses);
	 * 
	 * }
	 */

}
