package com.wbg.swager.controller;

import com.wbg.swager.dao.OrdersMapper;
import com.wbg.swager.entity.Orders;
import com.wbg.swager.entity.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/order")
public class OrderController {
    @Autowired
    private OrdersMapper ordersMapper;

    @RequestMapping(value = "/index",method = RequestMethod.GET)
    public String select(Model model){
        String itemidstr=" ";
        List<Orders> list=ordersMapper.selectAll();
        model.addAttribute("order",list);
        for(int i=0;i<list.size();i++) {

            List<String> itemIds = ordersMapper.selectItemId(list.get(i).getOrderId());
            for(int j=0;j<itemIds.size();j++)
            {
                itemidstr=itemidstr+itemIds.get(j)+" ";
            }
            list.get(i).setPetname(itemidstr);
            itemidstr=" ";

        }

        return "order";
    }

    @RequestMapping(value = "/add",method = RequestMethod.POST)
    public String add(Orders order){
        System.out.println(order);
        return "";
    }
    @RequestMapping(value = "/adds",method = RequestMethod.POST)
    public String adds(){
        System.out.println();
        return "";
    }

    @RequestMapping(method = RequestMethod.GET)
    public String index(){
        return "index";
    }


    @RequestMapping(value = "/del",method = RequestMethod.GET)
    @ResponseBody
    public String del(int id) {
        R r=new R();
        System.out.println("1111111111");
        System.out.println(ordersMapper.deleteByPrimaryKey(id));
        if(ordersMapper.deleteByPrimaryKey(id)==1){
            System.out.println("22222222222222");
            r.setCode(200);

        }
        System.out.println("3333333333");
        return r.toJson();
    }
}
