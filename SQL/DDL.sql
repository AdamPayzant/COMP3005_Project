create table  user
    (
        username        varchar(20),
        password        varchar(max),
        user_id         int,
        email           varchar(max),
        primary key (username, password)
    );
create table orders
    (
        user_id         int,
        order_num       int,
        primary key (user_id, order_num),
        foreign key (user_id) references user,
        foreign key (order_num) references order
    );
create table order
    (
        order_num       int,
        tracking_num    int,
        store_id        int,
        date            varchar(30),
        primary key (order_num),
        foreign key (store_id) references bookstore
    );
create table item
    (
        order_num       int,
        isbn            varchar(13),
        primary key (order_num, isbn),
        foreign key (order_num) references order,
        foreign key (isbn) references book
    );
create table book
    (
        isbn            varchar(13),
        name            varchar(max),
        genre           varchar(10),
        page_num        smallint,
        primary key (isbn)
    );
create table publishes
    (
        isbn            varchar(13),
        publisher       varchar(max),
        primary key (isbn, publisher),
        foreign key (isbn) references book,
        foreign key (publisher) references publisher
    );
create table publisher
    (
        name            varchar(max),
        country         varchar(3),
        region          varchar(10),
        city            varchar(20),
        street          varchar(50),
        building_num    int,
        email           varchar(max),
        bank_acc        int,
        primary key (name)
    );
create table phone
    (
        name            varchar(max),
        phone_num       varchar(25),
        primary key(name, phone_num),
        foreign key (name) references publisher
    );
create table carries
    (
        store_id        int,
        isbn            varchar(13),
        price           int,
        quantity        int,
        pub_cut         tinyint,
        primary key (store_id, isbn),
        foreign key (store_id) references bookstore,
        foreign key (isbn) references book
    );
create table bookstore
    (
        store_id        int,
        store_name      varchar(max),
        primary key (store_id)
    );

create table shipment
    (
        shipment_id     int,
        cost            int,
        primary key (shipment_id)
    );
create table ships
    (
        pub_name        varchar(max),
        shipment_id     int,
        primary key (pub_name, shipment_id),
        foreign key (pub_name) references publisher,
        foreign key (shipment_id) references shipment
    );
create table contains
    (
        isbn            varchar(13),
        shipment_id     int,
        quantity        int,
        primary key (isbn, shipment_id),
        foreign key (isbn) references book,
        foreign key (shipment_id) references shipment
    );
create table receives
    (
        store_id        int,
        shipment_id     int,
        foreign key (store_id) references bookstore,
        foreign key (shipment_id) references shipment
    );