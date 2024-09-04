# Subnetting Plan for Growing Organization

## **1. Initial Subnet Requirements**
- **Departments**:  
  - Finance: 50 hosts
  - Human Resources: 30 hosts
  - Sales: 70 hosts
  - Marketing: 40 hosts
  - IT: 100 hosts
  - Operations: 80 hosts
  
- ## **Future Growth**:  
  - Planning for 50% growth in each department over the next 5 years.

| **Department**        | **Current Hosts** | **Future Growth (50%)** | **Total Hosts Needed** |
|-----------------------|-------------------|-------------------------|------------------------|
| Finance               | 50                | 25                      | 75                     |
| Human Resources       | 30                | 15                      | 45                     |
| Sales                 | 70                | 35                      | 105                    |
| Marketing             | 40                | 20                      | 60                     |
| IT                    | 100               | 50                      | 150                    |
| Operations            | 80                | 40                      | 120                    |

## **2. Allocating IP Addresses to Accomodate future growth**
- Using the private IP address range `10.0.0.0/16` (which allows for a large number of subnets and hosts).
  
| **Department**        | **Hosts Needed** | **Subnet Size**  | **Subnet Mask**       | **IP Range**                  |
|-----------------------|------------------|------------------|-----------------------|-------------------------------|
| Finance               | 75               | /25 (126 hosts)  | 255.255.255.128        | 10.0.0.0 - 10.0.0.127          |
| Human Resources       | 45               | /26 (62 hosts)   | 255.255.255.192        | 10.0.0.128 - 10.0.0.191        |
| Sales                 | 105              | /25 (126 hosts)  | 255.255.255.128        | 10.0.0.192 - 10.0.1.63         |
| Marketing             | 60               | /26 (62 hosts)   | 255.255.255.192        | 10.0.1.64 - 10.0.1.127         |
| IT                    | 150              | /24 (254 hosts)  | 255.255.255.0          | 10.0.1.128 - 10.0.2.127        |
| Operations            | 120              | /25 (126 hosts)  | 255.255.255.128        | 10.0.2.128 - 10.0.3.255        |

## **3. Subnet Masking**
- Each department has been assigned a subnet mask based on the number of hosts they need, factoring in future growth. Subnets are sized to avoid waste of IP addresses while ensuring scalability.

| **Department**        | **Subnet Mask**       | **Number of Hosts Supported** |
|-----------------------|-----------------------|-------------------------------|
| Finance               | /25 (255.255.255.128) | 126 hosts                     |
| Human Resources       | /26 (255.255.255.192) | 62 hosts                      |
| Sales                 | /25 (255.255.255.128) | 126 hosts                     |
| Marketing             | /26 (255.255.255.192) | 62 hosts                      |
| IT                    | /24 (255.255.255.0)   | 254 hosts                     |
| Operations            | /25 (255.255.255.128) | 126 hosts                     |

## **4. Documentation**
Each subnet is documented to clearly indicate which IP ranges are assigned to each department.

| **Department**        | **IP Range**                | **Purpose**                                      |
|-----------------------|-----------------------------|--------------------------------------------------|
| Finance               | 10.0.0.0 - 10.0.0.127       | Financial transactions and accounting systems.   |
| Human Resources       | 10.0.0.128 - 10.0.0.191     | Employee data and payroll systems.               |
| Sales                 | 10.0.0.192 - 10.0.1.63      | CRM and sales data.                              |
| Marketing             | 10.0.1.64 - 10.0.1.127      | Marketing campaigns and analytics.               |
| IT                    | 10.0.1.128 - 10.0.2.127     | Network infrastructure and servers.              |
| Operations            | 10.0.2.128 - 10.0.3.255     | Production and supply chain management.          |



The allocations above ensure:

- **Scalability**: Each department can grow without immediate need for IP restructuring.
- **Efficiency**: Minimizes IP waste while providing sufficient addresses.
- **Simplicity**: Easy to manage and document, with clear boundaries between subnets.


**Ref:** [Subnet calculator](https://www.site24x7.com/tools/ipv4-subnetcalculator.html) 