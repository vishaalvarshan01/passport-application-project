package com.example.controller;

import com.example.model.BankDetails;
import com.example.model.CustomerDetails;
import com.example.model.CustomerStatement;
import com.example.model.User;
import com.example.service.BankService;
import com.example.service.CustomerService;
import com.example.service.CustomerStatementService;
import com.example.service.UserService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;


@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    UserService userService;

    @Autowired
    BankService bankService;

    @Autowired
    CustomerService customerService;

    @Autowired
    CustomerStatementService customerStatementService;
    @GetMapping("/")
    public String getIndexPage(){
        return "index";
    }

    @GetMapping("/login")
    public String showLoginForm(Model model) {
        model.addAttribute("user", new User());
        System.out.println("login page");
        return "login";
    }

    @PostMapping("/loginUser")
    public String loginUser(@ModelAttribute("user") User user, Model model, HttpSession session) {
        System.out.println("working");
        System.out.println("user : " + user);
        String foundUser = userService.loginValidation(user);
        if(foundUser.equals("found")){
            session.setAttribute("email",user.getEmail());
            return "welcome";
        }
        model.addAttribute("msg","wrong credentials , try again");
        return "login";
    }

    @GetMapping("/welcome")
    public String showWelcomePage(HttpSession session) {

        String email = (String) session.getAttribute("email");
        if(email == null){
            return "login";
        }
        return "welcome";
    }

    @GetMapping("/logout")
    public String logoutUser(HttpSession session){
        session.invalidate();
        return "redirect:/admin/login";
    }

    @GetMapping("/addBranch")
    public String addBranchPage(HttpSession session){
        String email = (String) session.getAttribute("email");
        if(email == null){
            return "login";
        }
        return "addBranch";
    }

    @PostMapping("/addBankBranch")
    public String addBankBranch(@ModelAttribute BankDetails bankDetails){
        System.out.println("bank details : " + bankDetails);
        bankService.saveBankBranchDetails(bankDetails);
        return "addBranch";
    }

    @GetMapping("/createCustomer")
    public String getCreateCustomerPage(HttpSession session, Model model, HttpServletRequest request){
        String email = (String) session.getAttribute("email");
        if(email == null){
            return "login";
        }
        List<String> codeList = bankService.retrieveBankCode();
        request.setAttribute("bankCodes", codeList);
        return "createCustomer";
    }


    @PostMapping("/createCustomerAccount")
    public String createCustomerAccount(@ModelAttribute CustomerDetails customerDetails,HttpServletRequest request){
        System.out.println("customer details :  " + customerDetails);
        customerService.saveCustomerDetails(customerDetails);
        List<String> codeList = bankService.retrieveBankCode();
        request.setAttribute("bankCodes", codeList);
        return "createCustomer";
    }

    @GetMapping("/viewCustomers")
    public String viewCustomerPage(HttpSession session, HttpServletRequest request){
        String email = (String) session.getAttribute("email");
        if(email == null){
            return "login";
        }
        List<CustomerDetails> allCustomers = customerService.getAllCustomerDetails();
        if(allCustomers.isEmpty()){
            request.setAttribute("msg", "No customers available");
        }
        request.setAttribute("customerDetails" , allCustomers);
        return "viewCustomers";
    }

    @GetMapping("/deleteCustomer/{id}")
    public String deleteCustomer(@PathVariable("id") int customerId, Model model,HttpSession session) {
        customerService.deleteCustomerDetail(customerId);

        String email = (String) session.getAttribute("email");
        if(email == null){
            return "login";
        }

        List<CustomerDetails> allCustomers = customerService.getAllCustomerDetails();
        model.addAttribute("customerDetails", allCustomers);
        model.addAttribute("deleteMsg","Account deleted successfully");
        return "viewCustomers";
    }

    @GetMapping("/viewDetails/{id}")
    public String getCustomerDetails(@PathVariable("id") int customerId, Model model,HttpSession session){

        String email = (String) session.getAttribute("email");
        if(email == null){
            return "login";
        }

        CustomerDetails customerDetails = customerService.getCustomerDetails(customerId);

        model.addAttribute("customer_details" , customerDetails);

        List<BankDetails> bankDetails = bankService.findByBankCode(customerDetails.getCustomer_BankBranch());

        model.addAttribute("bankBranch", bankDetails.get(0).getBankBranch());
        model.addAttribute("bankAddress", bankDetails.get(0).getBankAddress());
        model.addAttribute("managerName", bankDetails.get(0).getManagerName());
        return "customerDetails";
    }

    @GetMapping("/viewStatement/{id}")
    public String getBankStatementPage(@PathVariable("id") int customerId , HttpSession session,Model model,HttpServletRequest request){
        String email = (String) session.getAttribute("email");
        if(email == null){
            return "login";
        }

        CustomerDetails customerDetails = customerService.getCustomerDetails(customerId);

        model.addAttribute("customer_details" , customerDetails);

       request.setAttribute("statements",customerStatementService.getCustomerStatement(customerId));
       System.out.println(customerStatementService.getCustomerStatement(customerId));
       return "viewStatement";
    }

    @GetMapping("/changePassword")
    public String getChangePasswordPage(HttpSession session){
        String email = (String) session.getAttribute("email");
        if(email == null){
            return "login";
        }
        return "changePassword";
    }

    @PostMapping("/changePassword")
    public String changePassword(HttpServletRequest request,Model model){
        String email = request.getParameter("email");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");
        System.out.println(email + " " + newPassword + " " + confirmPassword);
        String result = userService.changePassword(email, newPassword,confirmPassword);
        if(result.equals("success")){
            model.addAttribute("msg","Password successfully changed");
            return "changePassword";
        }
        model.addAttribute("msg",result);
        return "changePassword";
    }


    // no need for verify checks
    @GetMapping("/verifyChecks")
    public String getVerifyChecksPage(HttpSession session,HttpServletRequest request){
        List<CustomerStatement> allStatements = customerStatementService.getAllCustomerStatement();
        request.setAttribute("statements",allStatements);
        return "verifyChecks";
    }

    @PostMapping("/verifyCheck")
    public String verifyCheck(HttpServletRequest request) {
        int customerStatementId = Integer.parseInt(request.getParameter("customerStatementId"));
        System.out.println("statement id" + customerStatementId);
        customerStatementService.verifyCustomerChecks(customerStatementId);
        return "redirect:/admin/verifyChecks";
    }

}
