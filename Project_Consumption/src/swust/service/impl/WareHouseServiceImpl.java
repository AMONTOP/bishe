package swust.service.impl;

import java.util.List;

import swust.dao.WareHouseDao;
import swust.model.WareHouse;
import swust.service.WareHouseService;

public class WareHouseServiceImpl implements WareHouseService {
	private WareHouseDao wareHouseDao;

	@Override
	public List<WareHouse> getAllWareHouses() {
		List<WareHouse> wareHouses = wareHouseDao.getAllWareHouses();
		return wareHouses;
	}

	@Override
	public void addWareHouse(WareHouse wareHouse) {
		wareHouseDao.addWareHouse(wareHouse);
	}

	@Override
	public void delWareHouse(Integer id) {
		wareHouseDao.delWareHouse(id);
	}

	@Override
	public void updateWareHouse(WareHouse wareHouse) {
		wareHouseDao.updateWareHouse(wareHouse);
	}

	@Override
	public WareHouse getWareHouse(Integer id) {
		return wareHouseDao.getWareHouse(id);
	}

	@Override
	public List<WareHouse> getWareHouseByName(String wareNo) {
		return wareHouseDao.getWareHouseByName(wareNo);
	}

	public WareHouseDao getWareHouseDao() {
		return wareHouseDao;
	}

	public void setWareHouseDao(WareHouseDao wareHouseDao) {
		this.wareHouseDao = wareHouseDao;
	}

	/*
	 * @Override public void export(Integer empId, String savePath) {
	 * List<WareHouse> wareHouses = wareHouseDao.getAllWareHouses(); String
	 * sheetName = "客户信息"; Vector<String> columnNames = new Vector<String>();
	 * columnNames.add("客户名称"); columnNames.add("联系人"); columnNames.add("联系电话");
	 * columnNames.add("创建日期"); columnNames.add("创建人"); Vector<String>
	 * reallyColumnNames = new Vector<String>();
	 * reallyColumnNames.add("wareNo"); reallyColumnNames.add("contact");
	 * reallyColumnNames.add("contactPhone"); reallyColumnNames.add("createAt");
	 * reallyColumnNames.add("empId");
	 * 
	 * JxlUtil<WareHouse> export = new JxlUtil<WareHouse>();
	 * export.toExcel(savePath, sheetName, columnNames, reallyColumnNames,
	 * wareHouses);
	 * 
	 * }
	 */

}
