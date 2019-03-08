package swust.service.impl;

import java.util.List;

import swust.dao.ProfitDao;
import swust.model.Profit;
import swust.service.ProfitService;


public class ProfitServiceImpl implements ProfitService {
	private ProfitDao profitDao;

	@Override
	public List<Profit> getAllProfits() {
		List<Profit> Profits = profitDao.getAllProfits();
		return Profits;
	}

	@Override
	public void addProfit(Profit Profit) {
		profitDao.addProfit(Profit);
	}

	@Override
	public void delProfit(Integer id) {
		profitDao.delProfit(id);
	}

	@Override
	public void updateProfit(Profit Profit) {
		profitDao.updateProfit(Profit);
	}

	@Override
	public Profit getProfit(Integer id) {
		return profitDao.getProfit(id);
	}

	public ProfitDao getProfitDao() {
		return profitDao;
	}

	public void setProfitDao(ProfitDao profitDao) {
		this.profitDao = profitDao;
	}

}
