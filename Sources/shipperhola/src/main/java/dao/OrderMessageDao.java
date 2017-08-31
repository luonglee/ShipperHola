/*
 * Copyright © 2017 XVideos Team
 */
package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.sql.DataSource;
import model.Account;
import model.Category;
import model.Order;
import model.OrderMessage;
import org.springframework.jdbc.core.RowMapper;

/**
 *
 * @author PC
 */
public class OrderMessageDao extends AbstractGenericDao<OrderMessage, Integer> {

    private static final RowMapper<OrderMessage> MAPPER = (rs, rowNum) -> new OrderMessage(
            rs.getInt("id"),
            rs.getDate("date"),
            rs.getString("content"),
            new Account(rs.getInt("accountId")),
            new OrderMessage(rs.getInt("repliedMessageId")),
            new Order(rs.getInt("orderId"))
    );

    public OrderMessageDao(DataSource dataSource) {
        super(dataSource);
    }

    @Override
    public List<OrderMessage> getAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public OrderMessage getById(Integer id) {
        return jdbcTemplate.queryForObject("SELECT * FROM OrderMessage WHERE id = ?", new Object[]{id}, MAPPER);
    }

    @Override
    public boolean add(OrderMessage orderMessage) {
        Map<String, Object> params = new HashMap<>();
        params.put("date", orderMessage.getDate());
        params.put("content", orderMessage.getContent());
        params.put("accountId", orderMessage.getAccount().getId());
        params.put("repliedMessageId", orderMessage.getRepliedMessage().getId());
        params.put("orderId", orderMessage.getOrder().getId());
        Number id = simpleJdbcInsert.withTableName("OrderMessage").usingGeneratedKeyColumns("id").executeAndReturnKey(params);
        if (id != null) {
            orderMessage.setId(id.intValue());
            return true;
        } else {
            return false;
        }
    }
    @Override
    public boolean update(OrderMessage orderMessage) {
        return jdbcTemplate.update("UPDATE OrderMessage SET  date = ?, content = ? , accountId = ?, repliedMessageId=?, orderId=?  WHERE id = ?", orderMessage.getDate(), orderMessage.getContent(), orderMessage.getAccount().getId(), orderMessage.getRepliedMessage(), orderMessage.getOrder().getId()) > 0;
    }

    @Override
    public boolean delete(Integer id) {
        return jdbcTemplate.update("DELETE FROM OrderMessage Where id = ? ", id) > 0;
    }
}