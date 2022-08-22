
-- CREAREA TABELELOR SI INSERARE LINIILOR


-- TABELUL CLIENTI


create table clienti(
    client_ID           number(4),
    denumire            varchar2(20)not null,
    date_identificare   varchar2(200),
    constraint pk_clienti primary key (client_ID),
    constraint u_clienti_date unique(date_identificare)
);

create sequence clienti_seq
minvalue 0 maxvalue 99999
increment by 1 START with 1
nocycle;

insert into clienti(client_ID,denumire,date_identificare) values (clienti_seq.nextval, 'CONEX SRL', 'RO 15898459');
insert into clienti(client_ID,denumire,date_identificare) values (clienti_seq.nextval, 'NEWSTILLE SRL', 'RO 1584789459');
insert into clienti(client_ID,denumire,date_identificare) values (clienti_seq.nextval, 'REAL INVEST SRL', 'RO 5894565');
insert into clienti(client_ID,denumire,date_identificare) values (clienti_seq.nextval, 'ESTELLA SRL', 'RO 6589425');
insert into clienti(client_ID,denumire,date_identificare) values (clienti_seq.nextval, 'ESTELLA SRL', 'RO 658956425');
insert into clienti(client_ID,denumire,date_identificare) values (clienti_seq.nextval, 'GENERAL COMERCE SRL', 'RO 65248754125');
insert into clienti(client_ID,denumire,date_identificare) values (clienti_seq.nextval, 'AUTORENT SRL', 'RO 65984254852');
insert into clienti(client_ID,denumire,date_identificare) values (clienti_seq.nextval, 'NEXT SHOP SRL', 'RO 65422584258');
insert into clienti(client_ID,denumire,date_identificare) values (clienti_seq.nextval, 'INTERCAR SRL', 'RO 245869');
insert into clienti(client_ID,denumire,date_identificare) values (clienti_seq.nextval, 'SOFTDEV SRL', 'RO 321458221');
insert into clienti(client_ID,denumire,date_identificare) values (clienti_seq.nextval, 'INSTAL SERVICE SRL', 'RO 55899555');




-- TABELUL ADRESE_LIVRARE


create table adrese_livrare(
    adresa_ID       number(4),
    client_ID       number(4),
    adresa_livrare  varchar2(200)not null,
    constraint pk_adresa primary key (adresa_ID),
    constraint fk_clienti foreign key (client_ID) references clienti(client_ID)
);

insert into adrese_livrare(adresa_ID, client_ID, adresa_livrare) values (1,  1,'Bucuresti');
insert into adrese_livrare(adresa_ID, client_ID, adresa_livrare) values (2,  1,'Cluj');
insert into adrese_livrare(adresa_ID, client_ID, adresa_livrare) values (3,  2,'Bucuresti');
insert into adrese_livrare(adresa_ID, client_ID, adresa_livrare) values (4,  3,'Bucuresti');
insert into adrese_livrare(adresa_ID, client_ID, adresa_livrare) values (5,  4,'Bucuresti');
insert into adrese_livrare(adresa_ID, client_ID, adresa_livrare) values (6,  4,'Craiova');
insert into adrese_livrare(adresa_ID, client_ID, adresa_livrare) values (7,  4,'Iasi');
insert into adrese_livrare(adresa_ID, client_ID, adresa_livrare) values (8,  5,'Craiova');
insert into adrese_livrare(adresa_ID, client_ID, adresa_livrare) values (9,  6,'Bucuresti');
insert into adrese_livrare(adresa_ID, client_ID, adresa_livrare) values (10, 7,'Timisoara');
insert into adrese_livrare(adresa_ID, client_ID, adresa_livrare) values (11, 7,'Constanta');
insert into adrese_livrare(adresa_ID, client_ID, adresa_livrare) values (12, 8,'Bucuresti');
insert into adrese_livrare(adresa_ID, client_ID, adresa_livrare) values (13, 9,'Bucuresti');
insert into adrese_livrare(adresa_ID, client_ID, adresa_livrare) values (14, 10,'Timisoara');
insert into adrese_livrare(adresa_ID, client_ID, adresa_livrare) values (15, 11,'Bucuresti');

alter table adrese_livrare add (adresa_ID number(4));


-- TABELUL PRODUS

create table produs(
    produs_ID           number(10),
    denumire            varchar2(20),
    unitate_masura      varchar2(10),
    pret                number(10,2),
    constraint produs_ID primary key (client_ID)
);

create sequence produs_seq
minvalue 0 maxvalue 99999
increment by 1 START with 1
nocycle;


insert into produs(produs_ID, denumire, unitate_masura, pret) values (produs_seq.nextval, 'Pantofi','buc', 245.2);
insert into produs(produs_ID, denumire, unitate_masura, pret) values (produs_seq.nextval, 'Ghete','buc', 145.2);
insert into produs(produs_ID, denumire, unitate_masura, pret) values (produs_seq.nextval, 'Detergent PK','kg', 5.2);
insert into produs(produs_ID, denumire, unitate_masura, pret) values (produs_seq.nextval, 'Hartie','buc', 15.2);
insert into produs(produs_ID, denumire, unitate_masura, pret) values (produs_seq.nextval, 'Toner Imprimanta','buc', 155.2);
insert into produs(produs_ID, denumire, unitate_masura, pret) values (produs_seq.nextval, 'Pix culoare neagra','buc', 4.5);
insert into produs(produs_ID, denumire, unitate_masura, pret) values (produs_seq.nextval, 'Apa Distila','litri', 12.4);
insert into produs(produs_ID, denumire, unitate_masura, pret) values (produs_seq.nextval, 'Detergent Universal','kg', 45.3);
insert into produs(produs_ID, denumire, unitate_masura, pret) values (produs_seq.nextval, 'Suc Concentrat','litri', 25.6);
insert into produs(produs_ID, denumire, unitate_masura, pret) values (produs_seq.nextval, 'Faina Alba','kg', 5.6);

















-- TABELUL ANTET COMANDA

create table antet_comanda(
    comanda_ID           number(10),
    client_ID            number(4),
    adresa_ID            number(4),
    data_comada          date,
    numar_comanda        varchar2(20)not null,
    valoare_comanda      number(10,2),
    constraint pk_comanda primary key (comada_ID),
    constraint fk_client foreign key (client_ID) references clienti(client_ID),
    constraint fk_adresa foreign key (adresa_ID) references adrese_livrare(adresa_ID),
    constraint u_numar_comanda unique(numar_comanda)
);

create sequence comanda_seq
minvalue 0 maxvalue 99999
increment by 1 START with 1
nocycle;

insert into antet_comanda(comanda_ID, client_ID , adresa_ID, data_comada, numar_comanda, valoare_comanda) values (comanda_seq.nextval, 1, 1, to_date('14-03-2022','dd-mm-yyyy'), '10000001', 1258.2);
insert into antet_comanda(comanda_ID, client_ID , adresa_ID, data_comada, numar_comanda, valoare_comanda) values (comanda_seq.nextval, 6, 9, to_date('25-02-2022','dd-mm-yyyy'), '10000002', 2567.2);
insert into antet_comanda(comanda_ID, client_ID , adresa_ID, data_comada, numar_comanda, valoare_comanda) values (comanda_seq.nextval, 2, 3, to_date('10-03-2022','dd-mm-yyyy'), '10000003', 2569.2);
insert into antet_comanda(comanda_ID, client_ID , adresa_ID, data_comada, numar_comanda, valoare_comanda) values (comanda_seq.nextval, 3, 4, to_date('25-04-2022','dd-mm-yyyy'), '10000004', 1879.2);
insert into antet_comanda(comanda_ID, client_ID , adresa_ID, data_comada, numar_comanda, valoare_comanda) values (comanda_seq.nextval, 10, 14, to_date('11-01-2022','dd-mm-yyyy'), '10000006', 2548.2);







-- TABELUL DETALII COMANDA

create table detalii_comanda(
    comanda_ID           number(10),
    produs_ID           number(10),
    cantitate      number(10),
    constraint fk_comanda foreign key (comanda_ID) references antet_comanda(comanda_ID),
    constraint fk_produs  foreign key (produs_ID) references produs(produs_ID)
);

insert into detalii_comanda(comanda_ID, produs_ID , cantitate) values (1, 3, 25);
insert into detalii_comanda(comanda_ID, produs_ID , cantitate) values (2, 7, 15);
insert into detalii_comanda(comanda_ID, produs_ID , cantitate) values (2, 8, 10);
insert into detalii_comanda(comanda_ID, produs_ID , cantitate) values (3, 3, 11);
insert into detalii_comanda(comanda_ID, produs_ID , cantitate) values (3, 4, 20);
insert into detalii_comanda(comanda_ID, produs_ID , cantitate) values (3, 9, 11);
insert into detalii_comanda(comanda_ID, produs_ID , cantitate) values (4, 1, 25);
insert into detalii_comanda(comanda_ID, produs_ID , cantitate) values (4, 2, 25);
insert into detalii_comanda(comanda_ID, produs_ID , cantitate) values (5, 3, 25);
insert into detalii_comanda(comanda_ID, produs_ID , cantitate) values (5, 7, 25);





-- TABELUL SOFER

create table sofer(
    angajat_ID           number(10),
    nume                 varchar2(30),
    constraint pk_sofer primary key (angajat_ID)
);


insert into sofer(angajat_ID, nume) values (1, 'Popescu Ion');
insert into sofer(angajat_ID, nume) values (2, 'Ionescu Mihai');
insert into sofer(angajat_ID, nume) values (3, 'Adamescu Ionel');
insert into sofer(angajat_ID, nume) values (4, 'Marinescu Costel');
insert into sofer(angajat_ID, nume) values (5, 'Ion Costel');


-- TABELUL AUTO

create table auto(
    auto_ID           number(10),
    numar             varchar2(30),
    constraint pk_auto primary key (auto_ID)
);


insert into auto(auto_ID, numar) values (1, 'B-52-SMK');
insert into auto(auto_ID, numar) values (2, 'B-25-PKW');
insert into auto(auto_ID, numar) values (3, 'B-11-JHB');
insert into auto(auto_ID, numar) values (4, 'B-25-DVF');
insert into auto(auto_ID, numar) values (5, 'B-24-WRF');




-- TABELUL AVIZ

create table aviz(
    aviz_ID           number(10),
    comanda_ID        number(10),
    numar_aviz        varchar2(30),
    constraint pk_aviz primary key (aviz_ID),
    constraint fk_comanda  foreign key (comanda_ID) references antet_comada(comanda_ID)
);


insert into aviz(aviz_ID, comanda_ID , numar_aviz) values (1, 1, '250001');
insert into aviz(aviz_ID, comanda_ID , numar_aviz) values (2, 2, '250002');
insert into aviz(aviz_ID, comanda_ID , numar_aviz) values (3, 3, '250003');
insert into aviz(aviz_ID, comanda_ID , numar_aviz) values (4, 4, '250004');
insert into aviz(aviz_ID, comanda_ID , numar_aviz) values (5, 5, '250005');



-- TABELUL FACTURA

create table factura(
    factura_ID        number(10),
    aviz_ID           number(10),
    numar_factura     varchar2(30),
    constraint pk_factura primary key (factura_ID),
    constraint fk_aviz  foreign key (aviz_ID) references aviz(aviz_ID)
);


insert into factura(factura_ID, aviz_ID , numar_factura) values (1, 1, 'EF25001');
insert into factura(factura_ID, aviz_ID , numar_factura) values (2, 2, 'EF25002');
insert into factura(factura_ID, aviz_ID , numar_factura) values (3, 3, 'EF25003');
insert into factura(factura_ID, aviz_ID , numar_factura) values (4, 4, 'EF25004');
insert into factura(factura_ID, aviz_ID , numar_factura) values (5, 5, 'EF25005');


-- TABELUL PLATA

create table plata(
    plata_ID        number(10),
    factura_ID      number(10),
    client_ID       number(10),
    tip             varchar2(4),
    numar_document  varchar2(30),
    vloare_plata    number(10,2),
    constraint pk_plati primary key (plata_ID),
    constraint fk_clientii  foreign key (client_ID) references clienti(client_ID),
    constraint fk_facturile  foreign key (factura_ID) references factura(factura_ID)
);


insert into plata(plata_ID, factura_ID , client_ID, tip, numar_document, vloare_plata  ) values (1, 1, 1,  'CHIT', '589789', 1258.2);
insert into plata(plata_ID, factura_ID , client_ID, tip, numar_document, vloare_plata  ) values (2, 2, 6,  'CHIT', '589789', 2567.2);
insert into plata(plata_ID, factura_ID , client_ID, tip, numar_document, vloare_plata  ) values (3, 3, 2,  'OP', 'OP 125', 2569.2);
insert into plata(plata_ID, factura_ID , client_ID, tip, numar_document, vloare_plata  ) values (4, 4, 1,  'OP', 'OP 325', 1879.2);
insert into plata(plata_ID, factura_ID , client_ID, tip, numar_document, vloare_plata  ) values (5, 5, 10, 'BO', 'B 0005', 2548.2);




-- TABELUL LIVREAZA

create table livreaza(
    sofer_ID        number(10),
    auto_ID      number(10),
    aviz_ID       number(10),
    constraint fk_soferi  foreign key (sofer_ID) references sofer(angajat_ID),
    constraint fk_autom  foreign key (auto_ID) references auto(auto_ID),
    constraint fk_avize  foreign key (aviz_ID) references aviz(aviz_ID)
);

insert into livreaza(sofer_ID, auto_ID, aviz_ID) values (1, 2, 1);
insert into livreaza(sofer_ID, auto_ID, aviz_ID) values (1, 2, 2);
insert into livreaza(sofer_ID, auto_ID, aviz_ID) values (3, 1, 3);
insert into livreaza(sofer_ID, auto_ID, aviz_ID) values (1, 1, 4);
insert into livreaza(sofer_ID, auto_ID, aviz_ID) values (2, 1, 5);





--     (1)  Sa se afiseze comenzile livrate de soferii care au in nume sirul de caractere "ion"
--          Client, adresa de livrare, valoarea comenzii, numarul avizului, data livrarii, numele soferului si numarul de inmatriculare al masinii cu care a facut livrarea


select
    cl.denumire as clientul,
    ad.adresa_livrare as Adresa,
    acom.valoare_comanda as Suma,
    av.numar_aviz as "Numar Aviz",
    av.data_aviz as "Data livrarii",
    sof.Nume as "Soferul",
    aut.numar as "Nr Inamtriculare"
from 
        aviz av
    join 
        antet_comanda acom
        on
        (av.comanda_id = acom.comanda_id)
    join 
        adrese_livrare ad
        on
        (acom.adresa_id = ad.adresa_id)
    join
        clienti cl
        on 
        (ad.client_id = cl.client_id)
    join  
        livreaza liv
        on
        (liv.aviz_id = av.aviz_id)
    join
        sofer sof
        on 
        (sof.angajat_id = liv.sofer_id)
    join 
        auto aut
        on
        (aut.auto_id = liv.auto_id)
    where (instr(lower(sof.nume), 'ion') <> 0)   
    ;



--    (1) - a)   Sa se afiseze comenzile livrate de soferii care au in nume sirul de caractere "ion"
--               Client, adresa de livrare, valoarea comenzii, numarul avizului, data livrarii, numele soferului si numarul de inmatriculare al masinii cu care a facut livrarea


select
    cl.denumire as clientul,
    ad.adresa_livrare as Adresa,
    acom.valoare_comanda as Suma,
    av.numar_aviz as "Numar Aviz",
    av.data_aviz as "Data livrarii",
    sof.Nume as "Soferul",
    aut.numar as "Nr Inamtriculare"
from aviz av
    natural join antet_comanda acom
    natural join adrese_livrare ad
    natural join clienti cl
    natural join livreaza liv
    join
        sofer sof
        on 
        (sof.angajat_id = liv.sofer_id)
    join 
        auto aut
        on
        (aut.auto_id = liv.auto_id)
    where (instr(lower(sof.nume), 'ion') <> 0)
    ;  
    

-- (2)    Sa se afiseza toti partenrii firmei, ordonati in ordine alfabetica, iar pentru cei care au facut comenzi  sa se afiseze comenzile si valoarea acestora

select
    cl.denumire                                                as clinetul,
    nvl(to_char(val.ID_comanda),'Client inactiv')                       as ID_comanda,
    nvl(to_char(val."valoarea comenzii"),'Client inactiv')              as "valoarea comenzii"
from 
    (
    select    
        det_c.comanda_id                 as ID_comanda,
        sum(prod.pret * det_c.cantitate) as "valoarea comenzii"
    from produs prod  
        join detalii_comanda det_c 
            on (prod.produs_id = det_c.produs_id)
    group by det_c.comanda_id
    ) val
    
    join antet_comanda ant_c
        on (val.id_comanda = ant_c.comanda_id)
    right join clienti cl
        on (ant_c.client_id = cl.client_id)
order by cl.denumire;


-- (3)  Sa se afiseaze lunile cand fiecare sofer a avut activitate si cate luni au trecut de la fiecare livrare pana in prezent

select distinct
    sf.nume             as "Numele soferului",
    decode(to_number(to_char(av.data_aviz,'mm'),'99'),
        1,'Sofer activ in luna IANUARIE',
        2,'Sofer activ in luna FEBRUARIE',
        3,'Sofer activ in luna MARTIE',
        4,'Sofer activ in luna APRILIE'
        )                   as Activitate,
    concat(concat('Activitate de acum ', round(months_between(trunc(sysdate),trunc(av.data_aviz)))), ' luni') as Perioada
from
    aviz av
        join livreaza lv on (lv.aviz_id = av.aviz_id)
        join sofer sf    on (lv.sofer_id = sf. angajat_id)
order by sf.nume
;




-- (3) - a)  Sa se afiseaze lunile cand fiecare sofer a avut activitate si cate luni au trecut de la fiecare livrare pana in prezent

select distinct
    sf.nume             as "Numele soferului",
    case to_number(to_char(av.data_aviz,'mm'),'99')
        when 1 then 'Sofer activ in luna IANUARIE'
        when 2 then 'Sofer activ in luna FEBRUARIE'
        when 3 then 'Sofer activ in luna MARTIE'
        when 4 then 'Sofer activ in luna APRILIE'
                end                  as Activitate, 
    concat(concat('Activitate de acum ', round(months_between(trunc(sysdate),trunc(av.data_aviz)))), ' luni') as Perioada 
from
    aviz av
        join livreaza lv on (lv.aviz_id = av.aviz_id)
        join sofer sf    on (lv.sofer_id = sf. angajat_id)
order by sf.nume
;

--   (4)  Produsele si cantitatile care au fost livrate de fiecare masina


select
    initcap(aut.numar) as "Numar Inmatriculare",
    initcap(prod.denumire) as Produsul,
    sum(det_c.cantitate) Cantitate
from auto aut
    join livreaza liv on (aut.auto_id = liv.auto_id)
    join aviz avz on (liv.aviz_id = avz.aviz_id)
    join detalii_comanda det_c on (avz.comanda_id = det_c.comanda_id)
    join produs prod on (det_c.produs_id = prod.produs_id) 
    join antet_comanda ant_c on(det_c.comanda_id = ant_c.comanda_id)
group by aut.numar, prod.denumire
order by aut.numar, prod.denumire

;


--   (5)  clientii care au facut o singura comanda si valoarea comenzii


select
    cl.denumire,
    ant_c.valoare_comanda
from  antet_comanda ant_c 
    join clienti cl on  (cl.client_id = ant_c.client_id)
where ant_c.valoare_comanda in (select
                                    sum(ant_1.valoare_comanda)
                               from
                                    antet_comanda ant_1
                                group by client_id)
order by cl.denumire

;


-- Sa se actualizeze valoarea totala a comenzilor


update antet_comanda ant_c
set valoare_comanda = 
    (
    select "valoarea comenzii" from 
        (
        select    
            det_c.comanda_id                 as ID_comanda,
            sum(prod.pret * det_c.cantitate) as "valoarea comenzii"
        from produs prod  
            join detalii_comanda det_c 
                on (prod.produs_id = det_c.produs_id)
        group by det_c.comanda_id
        )
    where (ID_comanda = ant_c.comanda_id)
    )
;

 -- pentru fiecare client sa se calculeze achizitiile totale si sa se insereze valorile in tabel
 
 
alter table clienti add (total number(10));


update clienti cli
set total = 
    (
    select sum(prod.pret * det_c.cantitate)
    from clienti cl
        join antet_comanda ant_c on (cl.client_id = ant_c.client_id)
        join detalii_comanda det_c on (ant_c.comanda_id = det_c.comanda_id)
        join produs prod on (prod.produs_id = det_c.produs_id)
    where (cli.client_id = cl.client_id)
    group by cl.client_id   
    )
;



---      Stergeti acea adresa de livrare a clientului "CONE SRL" unde nu s-a facut nici o livrare

delete adrese_livrare adr
where adr.adresa_id = 
    (
    select 
        adr_liv.adresa_id 
    from adrese_livrare adr_liv
        left join antet_comanda ant_c on (adr_liv.adresa_id = ant_c.adresa_id)
        join clienti cl on (cl.client_id = adr_liv.client_id)
    where lower(cl.denumire) = 'conex srl' and comanda_id is null
    )
;
