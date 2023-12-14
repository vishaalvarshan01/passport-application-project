package com.example.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Past;
import jakarta.validation.constraints.Pattern;
import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;
import java.util.List;


@Entity
@Table(name = "customer_details")
@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString(exclude = "bankDetails")
@EqualsAndHashCode(exclude = "bankDetails")
public class CustomerDetails {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int customerId;

    @NotNull(message = "Customer name is required.")
    private String customer_name;

    @Pattern(regexp = "\\d{16}", message = "Account number should be 16 digits.")
    private String customerAccountNumber;

    @NotNull(message = "Account type is required.")
    private String customer_AccountType;

    @NotNull(message = "Date of birth is required.")
    private LocalDate customer_Dob;

    @NotNull(message = "Bank branch is required.")
    private String customer_BankBranch;

    @DecimalMin(value = "0.0", inclusive = false, message = "Balance cannot be negative.")
    private double balance;

    @ManyToOne
    @JoinColumn(name = "bank_id")
    private BankDetails bankDetails;

    @OneToMany(mappedBy = "customerDetails", cascade = CascadeType.ALL)
    private List<CustomerStatement> customerStatements;

    @Override
    public String toString() {
        return "CustomerDetails{" +
                "customerId=" + customerId +
                ", customer_name='" + customer_name + '\'' +
                ", customerAccountNumber='" + customerAccountNumber + '\'' +
                ", customer_AccountType='" + customer_AccountType + '\'' +
                ", customer_Dob=" + customer_Dob +
                ", customer_BankBranch='" + customer_BankBranch + '\'' +
                ", balance=" + balance +
                ", bankDetails=" + bankDetails;
    }
}
