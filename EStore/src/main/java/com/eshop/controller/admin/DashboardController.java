package com.eshop.controller.admin;

import java.text.ParseException;
import java.util.List;
import java.util.Optional;

import org.apache.commons.lang3.time.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.eshop.dto.BrandDTO;
import com.eshop.dto.CategoryDTO;
import com.eshop.dto.OrderDTO;
import com.eshop.dto.OrderReport;
import com.eshop.dto.SaleReport;
import com.eshop.service.BrandService;
import com.eshop.service.CategoryService;
import com.eshop.service.OrderService;
import com.eshop.service.ProductService;
import com.eshop.utils.MapperUtils;

@Controller
@RequestMapping("/dashboard")
public class DashboardController {
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private ProductService productService;
    @Autowired
    private BrandService brandService;
    @Autowired
    private OrderService orderService;

    @RequestMapping("/report")
    public String showReportPage(Model model, @RequestParam Optional<String> brand,
                                 @RequestParam Optional<String> startDate, @RequestParam Optional<String> endDate) throws ParseException {
        List<OrderDTO> orders = MapperUtils.mapAll(orderService.getAll(), OrderDTO.class);
        double revenue = orders.stream().filter(order -> order.getStatus() == 1).mapToDouble(OrderDTO::getTotal).sum();
        model.addAttribute("orders", orders);
        model.addAttribute("revenue", revenue);
        model.addAttribute("products", productService.getAll());

        // Tồn kho theo danh mục
        List<BrandDTO> brands = MapperUtils.mapAll(brandService.getAll(), BrandDTO.class);
        List<CategoryDTO> categoryList = null;
        if (brand.isPresent()) {
            String brandSlug = brand.get();
            categoryList = MapperUtils.mapAll(categoryService.getAllByBrand(brandSlug), CategoryDTO.class);
            model.addAttribute("brandSlugSelected", brandSlug);
        } else {
            categoryList = MapperUtils.mapAll(categoryService.getAll(), CategoryDTO.class);
        }
        model.addAttribute("brands", brands);
        model.addAttribute("categoryList", categoryList);

        // Thống kê đơn hàng
        List<OrderReport> inventoryByOrders = orderService.getOrderReports();
        model.addAttribute("inventoryByOrders", inventoryByOrders);

        // Thống kê doanh thu
        List<SaleReport> saleReports = null;
        if (startDate.isPresent() && endDate.isPresent()) {
            saleReports = orderService.getSaleReports(DateUtils.parseDate(startDate.get(), "dd/MM/yyyy"), DateUtils.parseDate(endDate.get(), "dd/MM/yyyy"));
            model.addAttribute("period", startDate.get() + " - " + endDate.get());
        } else {
            saleReports = orderService.getSaleReports();
        }
        model.addAttribute("saleReports", saleReports);
        return "admin/report";
    }

    @RequestMapping
    public String showDashboardPage() {
        return "admin/index";
    }

    @RequestMapping("/category-management")
    public String showCategoryManagerPage() {
        return "admin/manager/category";
    }

    @RequestMapping("/brand-management")
    public String showBrandManagerPage() {
        return "admin/manager/brand";
    }

    @RequestMapping("/product-management")
    public String showProductManagerPage() {
        return "admin/manager/product";
    }

    @RequestMapping("/user-management")
    public String showUserManagementPage() {
        return "admin/manager/user";
    }

    @RequestMapping("/discount-management")
    public String showDiscountManagementPage() {
        return "admin/manager/discount";
    }

    @RequestMapping("/authority-management")
    public String showAuthorityManagementPage() {
        return "admin/manager/authority";
    }

}
