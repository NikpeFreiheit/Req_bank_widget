create table transactions
(
    id                 integer,
    transaction_at     DATE,
    transaction_amount numeric,
    transaction_type   varchar, ---dict: credit/debit
    transaction_name   varchar, ---dict: carefour,salary<...>

    PRIMARY KEY (id)
);

create table accounts
(
    id             integer,
    transaction_id integer,
    issued_at      DATE,
    expires_at     DATE,
    acct_number    varchar,---могут быть буквы, если IBAN или если валютный счет в РФ
    acct_type      varchar,
    acct_name      varchar,
    last_amount    integer,

    PRIMARY KEY (id),
    FOREIGN KEY (transaction_id)
        REFERENCES transactions (id) ON DELETE CASCADE

);

create table cards
(
    id          integer,
    account_id  integer,
    card_type   varchar,---dict: VISA/MC(Master Card)<...>
    card_number integer,
    card_name   varchar,
    cerrent_id  varchar,---dict: rub,eur,usd<...>
    last_amount numeric,

    PRIMARY KEY (id),
    FOREIGN KEY (account_id)
        REFERENCES accounts (id) ON DELETE CASCADE

);

create table clients
(
    id         integer,
    account_id integer,
    first_name varchar,
    surname    varchar,
    patronymic varchar,

    PRIMARY KEY (id),
    FOREIGN KEY (account_id)
        REFERENCES accounts (id) ON DELETE CASCADE

);
