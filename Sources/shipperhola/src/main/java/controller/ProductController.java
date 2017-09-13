/*
 * Copyright © 2017 XVideos Team
 */
package controller;

import static app.Application.*;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;
import model.Product;
import spark.Request;
import spark.Route;
import static spark.Spark.*;
import static app.ApplicationConstants.*;
import model.Category;
import spark.Filter;
import spark.utils.StringUtils;

/**
 *
 * @author nhattq
 */
public class ProductController {
    
    public static final Route VIEW_SEARCH_PAGE = (request, response) -> {
        try {
            extractParamsAndValidate(request);
            List<Product> products = getProductDao().search(
                    (String) request.attribute("keyword"), 
                    (Double) request.attribute("minPrice"),
                    (Double) request.attribute("maxPrice"),
                    (Date) request.attribute("minDate"),
                    (Date) request.attribute("maxDate"),
                    (Integer) request.attribute("categoryId"),
                    null,
                    true,
                    null, 
                    null
            );
            request.attribute("products", products);
            return getViewManager().renderForRequest(request, PRODUCT_SEARCH_VIEW_NAME);
        } catch (Exception ex) {
            return ex.getMessage();
        }
    };
    
    public static final Filter EMBED_DATA_TO_REQUEST = (request, response) -> {
        List<Category> categories = getCategoryDao().getAll();
        request.attribute("categories", categories);
    };
    
    private static void extractParamsAndValidate(Request request) throws Exception {
        String keyword = request.queryParams("keyword");
        String minPriceStr = request.queryParams("minPrice");
        String maxPriceStr = request.queryParams("maxPrice");
        String minDateStr = request.queryParams("minDate");
        String maxDateStr = request.queryParams("maxDate");
        String categoryIdStr = request.queryParams("categoryId");
        keyword = StringUtils.isEmpty(keyword) ? null : keyword;
        Double minPrice = StringUtils.isEmpty(minPriceStr) ? null : Double.parseDouble(minPriceStr);
        Double maxPrice = StringUtils.isEmpty(maxPriceStr) ? null : Double.parseDouble(maxPriceStr);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date minDate = StringUtils.isEmpty(minDateStr) ? null : new Date(sdf.parse(minDateStr).getTime());
        Date maxDate = StringUtils.isEmpty(maxDateStr) ? null : new Date(sdf.parse(maxDateStr).getTime());
        Integer categoryId = StringUtils.isEmpty(categoryIdStr) ? null : Integer.parseInt(categoryIdStr);
        request.attribute("keyword", keyword);
        request.attribute("minPrice", minPrice);
        request.attribute("maxPrice", maxPrice);
        request.attribute("minDate", minDate);
        request.attribute("maxDate", maxDate);
        request.attribute("categoryId", categoryId);
    }
    
    public static void setupRoutes() {
        path("/products", () -> {
            before("/*", EMBED_DATA_TO_REQUEST);
            get("/search", VIEW_SEARCH_PAGE);
        });
    }
    
}