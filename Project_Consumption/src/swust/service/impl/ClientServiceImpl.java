package swust.service.impl;

import java.util.List;
import java.util.Vector;

import swust.dao.ClientDao;
import swust.model.Client;
import swust.service.ClientService;
import swust.util.JxlUtil;

public class ClientServiceImpl implements ClientService {
	private ClientDao clientDao;

	@Override
	public List<Client> getAllClients() {
		List<Client> clients = clientDao.getAllClients();
		return clients;
	}

	@Override
	public void addClient(Client client) {
		clientDao.addClient(client);
	}

	@Override
	public void delClient(Integer id) {
		clientDao.delClient(id);
	}

	@Override
	public void updateClient(Client client) {
		clientDao.updateClient(client);
	}

	@Override
	public Client getClient(Integer id) {
		return clientDao.getClient(id);
	}

	@Override
	public List<Client> getClientByName(String clientName) {
		return clientDao.getClientByName(clientName);
	}

	public ClientDao getClientDao() {
		return clientDao;
	}

	public void setClientDao(ClientDao clientDao) {
		this.clientDao = clientDao;
	}

	@Override
	public void export(Integer empId, String savePath) {
		List<Client> clients = clientDao.getAllClients();
		String sheetName = "客户信息";
		Vector<String> columnNames = new Vector<String>();
		columnNames.add("客户名称");
		columnNames.add("联系人");
		columnNames.add("联系电话");
		columnNames.add("创建日期");
		columnNames.add("创建人");
		Vector<String> reallyColumnNames = new Vector<String>();
		reallyColumnNames.add("clientName");
		reallyColumnNames.add("contact");
		reallyColumnNames.add("contactPhone");
		reallyColumnNames.add("createAt");
		reallyColumnNames.add("empId");

		JxlUtil<Client> export = new JxlUtil<Client>();
		export.toExcel(savePath, sheetName, columnNames, reallyColumnNames,
				clients);

	}

}
