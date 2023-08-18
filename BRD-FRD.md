# BRD
## Project objectives
Create a convenient space for the Client of the Bank, where he can simultaneously see data on Accounts, Cards and Transactions

## Needs statement
Develop three widgets that will be displayed on the client screen at a time. The client must have the ability to filter the displayed data.
To receive information for widgets from the system of the Bank and Transaction data in the Application DB.

## Project scope
Develop documentation describing the business requirements, architecture, API for the front screen with widgets without designing client actions, without a description of possible errors that may occur when one of the system nodes is unavailable or when a transaction fails.

## Glossary
- Client - 
- Bank - banking service provider
- Accounts - 
- Cards - 
- Transactions - data which collected in application DB 
- Applications - 
- Widget - 
- Application DB - database which include information about transactions an payments, ~~don't collect any information about card numbers, amounts or Personal Data~~

## FRD
Method REST JSON over HTTPS
HTTPS will ensure secure communication between the application, the banking service provider and the application DB

There must be a synchronous interaction, because the banking service must be performed instantly with the result displayed. A client-server architecture is required, which will provide instantaneous receipt of data on completed transactions. Additionally, you can use an asynchronous connection and once in a selected period of time update transaction data through an increment, taking data from Kafka to the application database

Take into account in the structure of the application database that there can be several accounts for one card and several cards for one account (for example, how Tinkoff can issue a card with a different payment system to one account, or when two different settlement accounts in different currencies can be linked to one card)

In the request (GET), it is also necessary to configure filters and parameters (specified in the URL), in accordance with which data will be returned from the Bank system and the application DB:
 1. Which account to display (it is also possible to specify the currency here, because there are multi-currency accounts)
 2. Which cards to display (Linked to the account or all cards?)
 3. What transactions and their number (for which cards? Displayed or all?)

### Widgets:

**1. “Account”**
The widget should display:
1. Last available amount on the account
2. Account currency

**2. “Cards”**
Виджет должен отображать:
Все карты, открытые у данного клиента:
1. Наименование карты
2. Тип карты
3. Номер карты (скрытый, кроме последних 4-х символов)
4. Доступный остаток по карте
5. Валюта карты

**3. "Transaction"**

Виджет должен отображать последние 5 транзакций:
1. Иконку транзакции
2. Наименование транзакции
3. Сумму транзакции с указанием пополнения или снятия средств со света
4. Валюту транзакции
