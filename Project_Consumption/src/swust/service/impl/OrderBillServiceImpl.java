package swust.service.impl;

import java.math.BigDecimal;
import java.util.List;
import java.util.Vector;

import swust.dao.ClientDao;
import swust.dao.OrderBillDao;
import swust.model.Client;
import swust.model.OrderBill;
import swust.service.OrderBillService;
import swust.util.JxlUtil;

public class OrderBillServiceImpl implements OrderBillService {
	private OrderBillDao orderBillDao;
	private ClientDao clientDao;

	@Override
	public List<OrderBill> getAllOrderBills() {
		List<OrderBill> orderBills = orderBillDao.getAllOrderBills();
		return orderBills;
	}

	@Override
	public void addOrderBill(OrderBill orderBill) {
		orderBillDao.addOrderBill(orderBill);
	}

	@Override
	public void delOrderBill(Integer id) {
		orderBillDao.delOrderBill(id);
	}

	@Override
	public void updateOrderBill(OrderBill orderBill) {
		orderBillDao.updateOrderBill(orderBill);
	}
	
	public void updateOtherOrderBill(OrderBill orderBill){
		orderBillDao.updateOtherOrderBill(orderBill);
	}

	@Override
	public OrderBill getOrderBill(Integer id) {
		return orderBillDao.getOrderBill(id);
	}

	@Override
	public List<OrderBill> getOrderBillByNo(String orderBillName) {
		return orderBillDao.getOrderBillByNo(orderBillName);
	}

	@Override
	public List<OrderBill> getOrderBillByBillState(Integer id) {
		return orderBillDao.getOrderBillByBillState(id);
	}

	@Override
	public void updateOrderBillByMoney(Integer billId, BigDecimal billAmount) {
		orderBillDao.updateOrderBillByMoney(billId, billAmount);
	}

	public OrderBillDao getOrderBillDao() {
		return orderBillDao;
	}

	public void setOrderBillDao(OrderBillDao orderBillDao) {
		this.orderBillDao = orderBillDao;
	}

	@Override
	public void export(Integer empId, String savePath) {
		List<OrderBill> orderBills = orderBillDao.getAllOrderBills();
		List<Client> clients = clientDao.getAllClients();
		String sheetName = "订单管理信息";
		Vector<String> columnNames = new Vector<String>();
		columnNames.add("订单编号");
		columnNames.add("销售人员");
		columnNames.add("客户名称");
		columnNames.add("联系人");
		columnNames.add("联系电话");
		columnNames.add("下单时间");
		columnNames.add("订单金额");
		columnNames.add("订单状态");
		columnNames.add("发货时间");
		columnNames.add("发货者");
		Vector<String> reallyColumnNames = new Vector<String>();
		reallyColumnNames.add("billNo");
		reallyColumnNames.add("client.clientId");
		reallyColumnNames.add("client.clientId");
		reallyColumnNames.add("client.contact");
		reallyColumnNames.add("client.contactPhone");
		reallyColumnNames.add("billTime");
		reallyColumnNames.add("billAmount");
		reallyColumnNames.add("billState");
		reallyColumnNames.add("deliveryAt");
		reallyColumnNames.add("deliveryBy");

		JxlUtil<OrderBill> export = new JxlUtil<OrderBill>();
		export.toExcel(savePath, sheetName, columnNames, reallyColumnNames,
				orderBills);

	}

}
