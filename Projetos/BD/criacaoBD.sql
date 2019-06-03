----- DATABASE

--Criar um banco de dados com o nome vendas

----- TABELAS

CREATE SEQUENCE public.vendedor_id_seq;

CREATE TABLE public.VENDEDOR (
                ID BIGINT NOT NULL DEFAULT nextval('public.vendedor_id_seq'),
                EMAIL VARCHAR(100) NOT NULL,
                NOME VARCHAR(100) NOT NULL,
                CONSTRAINT vendedor_pk PRIMARY KEY (ID)
);


ALTER SEQUENCE public.vendedor_id_seq OWNED BY public.VENDEDOR.ID;

CREATE UNIQUE INDEX vendedor_unq
 ON public.VENDEDOR
 ( EMAIL );

CREATE SEQUENCE public.venda_id_seq;

CREATE TABLE public.VENDA (
                ID BIGINT NOT NULL DEFAULT nextval('public.venda_id_seq'),
                VENDEDOR BIGINT NOT NULL,
                DATA_HORA TIMESTAMP NOT NULL,
                VALOR DOUBLE PRECISION NOT NULL,
                COMISSAO DOUBLE PRECISION NOT NULL,
                CONSTRAINT venda_pk PRIMARY KEY (ID)
);


ALTER SEQUENCE public.venda_id_seq OWNED BY public.VENDA.ID;

CREATE UNIQUE INDEX venda_unq
 ON public.VENDA
 ( VENDEDOR, DATA_HORA, VALOR );

CREATE TABLE public.CONFIG (
                ID BIGINT NOT NULL,
                EMAIL_RELATORIO VARCHAR(100) NOT NULL,
                KEY_TOKEN VARCHAR(50),
                CONSTRAINT config_pk PRIMARY KEY (ID)
);


CREATE SEQUENCE public.usuario_id_seq;

CREATE TABLE public.USUARIO (
                ID BIGINT NOT NULL DEFAULT nextval('public.usuario_id_seq'),
                EMAIL VARCHAR(100) NOT NULL,
                NOME VARCHAR(100) NOT NULL,
                SENHA VARCHAR(100) NOT NULL,
                AUTH_TOKEN VARCHAR(150),
                AUTH_VALIDADE TIMESTAMP,
                CONSTRAINT usuario_pk PRIMARY KEY (ID)
);


ALTER SEQUENCE public.usuario_id_seq OWNED BY public.USUARIO.ID;

CREATE UNIQUE INDEX usuario_unq
 ON public.USUARIO
 ( EMAIL );

ALTER TABLE public.VENDA ADD CONSTRAINT vendedor_venda_fk
FOREIGN KEY (VENDEDOR)
REFERENCES public.VENDEDOR (ID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

--- INSERTS INICIAIS

INSERT INTO public.config(
	id, key_token, email_relatorio)
	VALUES (1, 'key123', 'abandeira@live.com');

INSERT INTO public.usuario(
	email, nome, senha, auth_token, auth_validade)
	VALUES ('admin', 'admin', '$2y$10$IcRAVTIRPAwG1jEuqKfe/.WNl55TfhBjvfUBWEuEc0vpILgJKESWC', null, null);


