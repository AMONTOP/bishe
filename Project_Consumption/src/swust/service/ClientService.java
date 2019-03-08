package swust.service;

import java.util.List;

import swust.model.Client;

public interface ClientService {
	// 查询所有
	public List<Client> getAllClients();

	// 添加用户
	public void addClient(Client client);

	// 删除用户
	public void delClient(Integer id);

	// 修改用户
	public void updateClient(Client client);

	// 单个查询
	public Client getClient(Integer id);

	// 单个查询(根据客户姓名)
	public List<Client> getClientByName(String clientName);

	public void export(Integer empId, String savePath);
}
