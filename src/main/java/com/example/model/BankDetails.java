package com.example.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import lombok.*;

import java.util.List;

@Entity
@Table(name = "bank_details")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class BankDetails {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int bankId;

    @Pattern(regexp = "[A-Za-z]{2}[0-9]{3}", message = "Bank branch format should be 2 letters followed by 3 numbers.")
    private String bankBranch;

    @NotNull(message = "Bank address is required.")
    private String bankAddress;

    @NotNull(message = "Manager name is required.")
    private String managerName;

    @ToString.Exclude
    @OneToMany(mappedBy = "bankDetails")
    private List<CustomerDetails> customers;
}
