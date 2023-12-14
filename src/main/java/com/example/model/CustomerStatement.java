package com.example.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.time.LocalDate;

@Entity
@Table(name="customer_statement")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class CustomerStatement {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int customerStatementId;

    @NotNull(message = "Statement date required")
    private LocalDate statementDate;

    @Pattern(regexp = "\\d{16}", message = "Account number should be 16 digits.")
    private String accountNumber;

    @Pattern(regexp = "[A-Za-z]{4}\\d{4}", message = "IFSC code should have 4 characters followed by 4 numbers.")
    private String ifscCode;
    private String action;
    private String type;

    @DecimalMin(value = "0.0", inclusive = false, message = "Amount cannot be negative.")
    private double amount;

    @ManyToOne
    @JoinColumn(name = "customer_id")
    private CustomerDetails customerDetails;
}
