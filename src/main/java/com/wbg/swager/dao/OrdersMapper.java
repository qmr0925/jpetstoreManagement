package com.wbg.swager.dao;

import com.wbg.swager.entity.Orders;
import java.util.List;

public interface OrdersMapper {

    int deleteByPrimaryKey(Integer id);


    int insert(Orders record);


    Orders selectByPrimaryKey(Integer id);
    String selectStatusByPrimaryKey(int id);
    List<Orders> selectByUserName(String username);

    List<Orders> selectByStatus(String orderStatus);


    List<Orders> selectAll();


    int updateByPrimaryKey(Orders record);
    int updateByPrimaryKeys(int orderid);
    List<String> selectItemId (int orderid);

}