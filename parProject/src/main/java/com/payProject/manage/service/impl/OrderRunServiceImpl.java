package com.payProject.manage.service.impl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.payProject.config.common.Constant;
import com.payProject.config.common.Constant.Common;
import com.payProject.manage.contorller.MerchantContorller;
import com.payProject.manage.entity.AccountEntity;
import com.payProject.manage.entity.RunOrder;
import com.payProject.manage.entity.RunOrderExample;
import com.payProject.manage.entity.RunOrderExample.Criteria;
import com.payProject.manage.entity.WithdrawalsOrderEntity;
import com.payProject.manage.mapper.RunOrderMapper;
import com.payProject.manage.service.OrderRunService;
import com.payProject.system.util.DealNumber;

import cn.hutool.core.collection.CollUtil;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import io.netty.util.NetUtil;
@Service
public class OrderRunServiceImpl implements OrderRunService {
	Logger log = LoggerFactory.getLogger(MerchantContorller.class);
	@Autowired
	RunOrderMapper  runOrderDao;
	@Override
	public List<RunOrder> findPageRunOrderByRunOrder(RunOrder runOrder) {
		RunOrderExample example  = new RunOrderExample();
		example.setOrderByClause("createTime DESC");
		Criteria criteria = example.createCriteria();
		if(StrUtil.isNotBlank(runOrder.getOrderRunId()))
			criteria.andOrderRunIdEqualTo(runOrder.getOrderRunId());
		if(StrUtil.isNotBlank(runOrder.getOrderAccount()))
			criteria.andOrderAccountEqualTo(runOrder.getOrderAccount());
		if(StrUtil.isNotBlank(runOrder.getCardRunW()))
			criteria.andCardRunWEqualTo(runOrder.getCardRunW());
		if(StrUtil.isNotBlank(runOrder.getCardRunD()))
			criteria.andCardRunDEqualTo(runOrder.getCardRunD());
		if( null != runOrder.getRunStatus())
			criteria.andRunStatusEqualTo(runOrder.getRunStatus());
		if( null != runOrder.getRunType())
			criteria.andRunTypeEqualTo(runOrder.getRunType());
		if(StrUtil.isNotBlank(runOrder.getTime())) {
			String data = StrUtil.subPre(runOrder.getTime(),10);
			String data1 = StrUtil.subSuf(runOrder.getTime(),12);
			criteria.andCreateTimeBetween(DateUtil.parse(data), DateUtil.parse(data1));
			} 
		if(CollUtil.isNotEmpty(runOrder.getRunTypeList()))
		criteria.andRunTypeListEqualTo(runOrder.getRunTypeList());
		if(CollUtil.isNotEmpty( runOrder.getOrderAccountList()))
			criteria.andOrderAccountListEqualTo( runOrder.getOrderAccountList());
		List<RunOrder> selectByExample = runOrderDao.selectByExample(example);
		return selectByExample;
	}
	@Override
	public boolean addAmount(HttpServletRequest request,AccountEntity account, BigDecimal amount) {
		RunOrder  runBean  = new RunOrder();
		runBean.setOrderRunId(DealNumber.GetRunOrder());
		runBean.setRunStatus(Constant.Common.RUN_STATUS_2);
		runBean.setRunType(Constant.Common.RUN_SYSTEM_ADD_MONEY);
		runBean.setOrderAccount(account.getAccountId());
		runBean.setRunOrderAmount(amount.toString());
		runBean.setDealDescribe(account.getDealDescribe());
		runBean.setOrderGenerationIp(getLocalIp(request));
		runBean.setCardRunD("SYS");
		runBean.setCardRunW(account.getAccountId());//系統賬戶簡稱
		int insertSelective = runOrderDao.insertSelective(runBean);
		return insertSelective > 0 && insertSelective <2;
	}

    /**
    * 从Request对象中获得客户端IP，处理了HTTP代理服务器和Nginx的反向代理截取了ip
    * @param request
    * @return ip
    */
  public static String getLocalIp(HttpServletRequest request) {
	  String ip = request.getHeader("X-Forwarded-For");
	             if(StrUtil.isNotBlank(ip) && !"unKnown".equalsIgnoreCase(ip)){
	                 //多次反向代理后会有多个ip值，第一个ip才是真实ip
	                 int index = ip.indexOf(",");
	                 if(index != -1){
	                     return ip.substring(0,index);
	                 }else{
	                     return ip;
	                 }
	             }
	             ip = request.getHeader("X-Real-IP");
	             if(StrUtil.isNotBlank(ip) && !"unKnown".equalsIgnoreCase(ip)){
	                 return ip;
	             }
	             return request.getRemoteAddr();
  }
	@Override
	public boolean delAmount(HttpServletRequest request, AccountEntity account, BigDecimal amountB) {
		RunOrder  runBean  = new RunOrder();
		runBean.setOrderRunId(DealNumber.GetRunOrder());
		runBean.setRunStatus(Constant.Common.RUN_STATUS_2);
		runBean.setRunType(Constant.Common.RUN_SYSTEM_DELETE_MONEY);
		runBean.setOrderAccount(account.getAccountId());
		runBean.setRunOrderAmount(amountB.toString());
		runBean.setDealDescribe(account.getDealDescribe());
		runBean.setOrderGenerationIp(getLocalIp(request));
		runBean.setCardRunD("SYS");
		runBean.setCardRunW(account.getAccountId());//系統賬戶簡稱
		int insertSelective = runOrderDao.insertSelective(runBean);
		return insertSelective > 0 && insertSelective <2;
	}
	@Override
	public boolean freAmount(HttpServletRequest request, AccountEntity account, BigDecimal amountB) {
		RunOrder  runBean  = new RunOrder();
		runBean.setOrderRunId(DealNumber.GetRunOrder());
		runBean.setRunStatus(Constant.Common.RUN_STATUS_2);
		runBean.setRunType(Constant.Common.RUN_FREEZE);
		runBean.setOrderAccount(account.getAccountId());
		runBean.setRunOrderAmount(amountB.toString());
		runBean.setDealDescribe(account.getDealDescribe());
		runBean.setOrderGenerationIp(getLocalIp(request));
		runBean.setCardRunD("SYS");
		runBean.setCardRunW(account.getAccountId());//系統賬戶簡稱
		int insertSelective = runOrderDao.insertSelective(runBean);
		return insertSelective > 0 && insertSelective <2;
	}
	@Override
	public List<RunOrder> findOrderRunByWitOrder(String orderId) {
		RunOrderExample example  = new RunOrderExample();
		example.setOrderByClause("createTime DESC");
		Criteria criteria = example.createCriteria();
		criteria.andOrderIdEqualTo(orderId);
		List<RunOrder> selectByExample = runOrderDao.selectByExample(example);
		return selectByExample;
	}
	@Override
	public boolean updataRunType(List<RunOrder> runList) {
		List<Integer> list  = new ArrayList<Integer>();
		for(RunOrder order : runList) {
			RunOrderExample example  = new RunOrderExample();
			Criteria criteria = example.createCriteria();
			criteria.andOrderRunIdEqualTo(order.getOrderRunId());
			int updateByExample = runOrderDao.updateByExample(order, example);
			list.add(updateByExample);
		}
		if(!list.contains(0)) {
			return true;
		}
		return false;
	}
	/**
	 * <p>给用户追加一笔资金，这笔资金是代付失败的资金变动</p>
	 */
	@Override
	public boolean createAmount(WithdrawalsOrderEntity order) {
		log.info("---------进入交易流水处理类，生成解冻流水，流水方式为解冻代付金额，当前代付金额为："+ order.getWithdrawalsAmount()+"" );
		RunOrder runBean  = new RunOrder();
		runBean.setOrderRunId(DealNumber.GetRunOrder());
		runBean.setOrderId(order.getOrderId());
		runBean.setRunStatus(Common.RUN_STATUS_2);
		runBean.setRunType(Common.RUN_UN_FREEZE);
		runBean.setOrderAccount(order.getOrderAccount());
		runBean.setRunOrderAmount(order.getWithdrawalsAmount().toString());
		runBean.setOrderGenerationIp(order.getOrderGenerationIp());
		runBean.setDealDescribe("用户代付手续费资金账户冻结");
		runBean.setCardRunD("SYS");//系統賬戶簡稱
		runBean.setCardRunW(order.getOrderAccount());
		int insertSelective = runOrderDao.insertSelective(runBean);
		return insertSelective > 0 && insertSelective < 2;
	}
}
